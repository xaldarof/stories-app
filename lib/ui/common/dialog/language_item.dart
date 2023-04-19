import 'package:flutter/material.dart';
import 'package:jokes_app/common/resource/fonts.dart';
import 'package:modified_localization/easy_localization.dart';

import '../../../common/language/language.dart';
import '../../../common/resource/colors.dart';

class LanguageItem extends StatelessWidget {
  final Function _onTap;
  final LanguageInfo _languageInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.whiteAlpha52),
        color: AppColors.primaryColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              _onTap.call();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(4),
                    ),
                    Text(
                      _languageInfo.title,
                      style: primaryTextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                ...[
                  if (_languageInfo.locale.languageCode ==
                      context.locale.languageCode)
                    Icon(
                      Icons.check_circle,
                      color: AppColors.darkSpringGreen,
                    )
                  else
                    Icon(
                      Icons.circle_outlined,
                      color: AppColors.whiteAlpha52,
                    ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  const LanguageItem({
    super.key,
    required Function onTap,
    required LanguageInfo languageInfo,
  })  : _onTap = onTap,
        _languageInfo = languageInfo;
}
