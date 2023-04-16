import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jokes_app/domain/models/common/app_state.dart';

import '../../../common/utils/bloc.dart';
import '../../../domain/repositories/main_repository.dart';

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
