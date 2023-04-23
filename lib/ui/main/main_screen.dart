import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes_app/di/app_di.dart';
import 'package:jokes_app/ui/main/bloc/main_bloc.dart';
import 'package:jokes_app/ui/main/splash_screen.dart';
import 'package:modified_localization/easy_localization.dart';

import '../../common/utils/ui.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    setNavColor();
    return BlocProvider<MainBloc>(
      create: (_) => MainBloc(injector.get())
        ..add(
          ObserveAppState(),
        ),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<MainBloc, MainState>(
          builder: (BuildContext context, state) {
            return const SplashScreen();
          },
        ),
      ),
    );
  }
}
