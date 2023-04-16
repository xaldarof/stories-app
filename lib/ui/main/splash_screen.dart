import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes_app/common/resource/decorations.dart';
import 'package:jokes_app/common/utils/navigator.dart';
import 'package:jokes_app/di/app_di.dart';
import 'package:jokes_app/domain/models/common/app_state.dart';
import 'package:jokes_app/ui/auth/login/login_screen.dart';
import 'package:jokes_app/ui/home/home_screen.dart';
import 'package:jokes_app/ui/main/bloc/main_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainBloc(
        injector.get(),
      )..add(
          GetAppStatus(),
        ),
      child: BlocConsumer<MainBloc, MainState>(
        builder: (context, state) {
          return Container(
            height: 52,
            decoration: const DefaultBackgroundDecoration(),
            padding: const EdgeInsets.all(100),
            child: Lottie.asset(
              Assets.writeJson,
              frameRate: FrameRate.max,
              width: 52,
              height: 52,
            ),
          );
        },
        listener: (context, state) {
          if (state.appState == AppState.logged) {
            context.navigateTo(const HomeScreen(), removeStack: true);
          }
          if (state.appState == AppState.unAuthorized) {
            context.navigateTo(const LoginScreen(), removeStack: true);
          }
        },
      ),
    );
  }
}
