import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes_app/common/utils/navigator.dart';
import 'package:jokes_app/di/app_di.dart';
import 'package:jokes_app/ui/main/bloc/main_bloc.dart';
import 'package:jokes_app/ui/main/splash_screen.dart';
import 'package:modified_localization/easy_localization.dart';

import '../../common/utils/ui.dart';
import '../../domain/models/common/app_state.dart';
import '../auth/login/login_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    setNavColor();
    return MaterialApp(
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => MainBloc(
          injector.get(),
        )..add(
            ObserveAppState(),
          ),
        child: BlocConsumer<MainBloc, MainState>(
          builder: (context, state) {
            return const SplashScreen();
          },
          listener: (context, state) {
            if (state.appState == AppState.unAuthorized) {
              context.navigateTo(const LoginScreen());
            }
          },
        ),
      ),
    );
  }
}
