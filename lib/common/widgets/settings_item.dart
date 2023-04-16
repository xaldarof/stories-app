import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jokes_app/common/widgets/scale_tap.dart';
import 'package:jokes_app/common/widgets/story_owner.dart';
import 'package:jokes_app/common/widgets/story_type_.dart';

import '../resource/colors.dart';
import '../resource/fonts.dart';

class SettingsItem extends StatelessWidget {
  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final String text;
  final String? subText;
  final Function() onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      child: Container(
        alignment: Alignment.centerLeft,
        height: height,
        width: width,
        margin: margin,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: AppColors.primaryDark),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(14),
              child: StoryOwnerIcon(
                width: 48,
                height: 48,
                icon: icon,
              ),
            ),
            Flexible(
              child: ListTile(
                title: Text(
                  text,
                  style: primaryTextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                subtitle: subText != null
                    ? Text(
                        subText!,
                        style: primaryTextStyle(
                            color: AppColors.whiteAlpha52,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      )
                    : null,
              ),
            ),
          ],
        ),
      ),
      onPressed: () {
        onTap.call();
      },
    );
  }

  const SettingsItem({
    super.key,
    this.margin,
    this.width,
    this.height,
    this.subText,
    required this.icon,
    required this.text,
    required this.onTap,
  });
}
