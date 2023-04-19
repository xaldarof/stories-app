import 'package:flutter/cupertino.dart';
import 'package:modified_localization/easy_localization.dart';

class Language {
  static List<Locale> get supportedLanguages {
    return [
      const Locale('ru', 'RU'),
      const Locale('uz', 'UZ'),
      const Locale('en', 'US'),
    ];
  }

  static List<LanguageInfo> get supportedLanguagesInfo {
    var languages = [
      LanguageInfo(
          title: 'Русский',
          locale: supportedLanguages[0],
          id: 1),
      LanguageInfo(
          title: 'Uzbek',
          locale: supportedLanguages[1],
          id: 2),
      LanguageInfo(
          title: 'English',
          locale: supportedLanguages[2],
          id: 0),
    ];
    return languages;
  }

  static Locale get defaultLanguage {
    return supportedLanguages[0];
  }

  static String get languagePath {
    return "assets/translations";
  }
}

extension LangExt on BuildContext {
  LanguageInfo get localeInfo {
    return Language.supportedLanguagesInfo
        .where((element) => element.locale.countryCode == locale.countryCode)
        .toList()[0];
  }
}

class LanguageInfo {
  final int id;
  final String title;
  final Locale locale;

  const LanguageInfo({
    required this.id,
    required this.title,
    required this.locale,
  });
}
