import 'package:encrypt_shared_preferences/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:jokes_app/common/resource/colors.dart';
import 'package:jokes_app/common/resource/fonts.dart';
import 'package:jokes_app/common/utils/printer.dart';
import 'package:jokes_app/di/app_di.dart';
import 'package:jokes_app/ui/main/main_screen.dart';
import 'package:modified_localization/easy_localization.dart';
import 'package:overlay_support/overlay_support.dart';
import 'common/language/language.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized('121234930934-023');
  await EncryptedSharedPreferences.initialize('121234930934-023');
  await setUpDependencies();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  late final FirebaseMessaging messaging;
  messaging = FirebaseMessaging.instance;

  FirebaseMessaging.onMessage.listen(
    (RemoteMessage message) {
      printMessage(message.toString());
      showSimpleNotification(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                message.notification?.title ?? "",
                style: primaryTextStyle(color: AppColors.white),
              ),
              Text(
                message.notification?.body ?? "",
                style: primaryTextStyle(color: AppColors.white),
              ),
            ],
          ),
          background: AppColors.darkGreen);
    },
  );

  runApp(
    EasyLocalization(
      supportedLocales: Language.supportedLanguages,
      path: Language.languagePath,
      saveLocale: true,
      startLocale: Language.defaultLanguage,
      child: const MainScreen(),
    ),
  );
}

Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  printMessage("Handling a background message: ${message.messageId}");
}
