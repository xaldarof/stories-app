import 'package:flutter/material.dart';
import 'package:jokes_app/common/resource/colors.dart';
import 'package:jokes_app/common/resource/fonts.dart';
import 'package:jokes_app/common/utils/navigator.dart';
import 'package:modified_localization/easy_localization.dart';

import '../../../common/language/language.dart';
import '../../../generated/locale_keys.g.dart';
import 'language_item.dart';

class SelectLanguage extends StatelessWidget {
  final Function(LanguageInfo languageInfo) onSelect;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primaryColor,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Strings.selectLanguage,
              style:
                  primaryTextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const Padding(
              padding: EdgeInsets.all(2),
            ),
            Text(
              Strings.selectLanguage,
              style: primaryTextStyle(),
            ),
            const Padding(
              padding: EdgeInsets.all(6),
            ),
            SizedBox(
              height: 252,
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: Language.supportedLanguagesInfo.length,
                itemBuilder: (e, i) {
                  return LanguageItem(
                    onTap: () async {
                      context
                          .setLocale(Language.supportedLanguagesInfo[i].locale);
                      onSelect.call(Language.supportedLanguagesInfo[i]);
                      context.goBack();
                    },
                    languageInfo: Language.supportedLanguagesInfo[i],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  const SelectLanguage({
    super.key,
    required this.onSelect,
  });
}
