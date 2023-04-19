import 'package:encrypt_shared_preferences/enc_shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:jokes_app/di/app_di.dart';
import 'package:jokes_app/ui/main/main_screen.dart';
import 'package:modified_localization/easy_localization.dart';

import 'common/language/language.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await EncryptedSharedPreferences.initialize('1234930934-023940-2394-0324234');
  await setUpDependencies();
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
