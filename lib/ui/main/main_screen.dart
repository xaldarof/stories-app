import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes_app/common/utils/printer.dart';
import 'package:jokes_app/di/app_di.dart';
import 'package:jokes_app/generated/locale_keys.g.dart';
import 'package:jokes_app/ui/main/bloc/main_bloc.dart';
import 'package:jokes_app/ui/main/splash_screen.dart';
import 'package:modified_localization/easy_localization.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:quick_actions/quick_actions.dart';

import '../../common/utils/ui.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    setNavColor();
    FirebaseMessaging.instance.getToken().then((value) {
      printMessage("Current token : $value");
    });
    return BlocProvider<MainBloc>(
      create: (_) => MainBloc(injector.get())
        ..add(
          ObserveAppState(),
        ),
      child: OverlaySupport.global(
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
      ),
    );
  }
}
