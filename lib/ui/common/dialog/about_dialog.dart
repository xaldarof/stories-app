import 'package:flutter/material.dart';
import 'package:jokes_app/common/resource/colors.dart';
import 'package:jokes_app/common/resource/fonts.dart';
import 'package:jokes_app/generated/locale_keys.g.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primaryColor,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Text(
          Strings.aboutContent,
          style: primaryTextStyle(),
        ),
      ),
    );
  }

  const About({
    super.key,
  });
}
