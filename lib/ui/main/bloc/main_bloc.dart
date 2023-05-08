import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:jokes_app/common/utils/navigator.dart';
import 'package:jokes_app/common/utils/printer.dart';
import 'package:jokes_app/domain/models/common/app_state.dart';

import '../../../common/utils/bloc.dart';
import '../../../domain/repositories/main_repository.dart';
import '../main_screen.dart';
import '../splash_screen.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final MainRepository _repository;

  MainBloc(
    this._repository,
  ) : super(const MainState()) {
    on<ObserveAppState>(_observeAppStatus);
    on<GetAppStatus>(_getAppStatus,
        transformer: debounceSequential(const Duration(seconds: 3)));

    FirebaseMessaging.instance.onTokenRefresh.listen((event) async {
      final res = await _repository.refreshFCMToken(event);
      if (res) {
        printMessage("Token refreshed");
      } else {
        printMessage("Something went wrong !");
      }
    });

    stream.listen((event) {
      if (state.appState == AppState.unAuthorized) {
        navigatorKey.currentContext
            ?.navigateTo(const SplashScreen(), removeStack: true);
      }
    });
  }

  Future<void> _observeAppStatus(ObserveAppState event, Emitter emitter) {
    return emitter.forEach(
      _repository.getAppState(),
      onData: (data) {
        return state.copyWith(appState: data);
      },
    );
  }

  Future<void> _getAppStatus(GetAppStatus event, Emitter emitter) async {
    final isAuthorized = await _repository.isAuthorized();
    if (isAuthorized) {
      emitter(state.copyWith(appState: AppState.logged));
    } else {
      emitter(state.copyWith(appState: AppState.unAuthorized));
    }
  }
}
