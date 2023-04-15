import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jokes_app/common/widgets/icon_text.dart';
import 'package:jokes_app/common/widgets/scale_tap.dart';
import 'package:jokes_app/common/widgets/story_owner.dart';

import '../../common/resource/colors.dart';
import '../../common/resource/fonts.dart';

class UserInfoCard extends StatelessWidget {
  final EdgeInsets? margin;
  final double? width;
  final double? height;

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
        child: Column(
          children: const [
            IconText(
              icon: Icons.favorite,
              text: 'Liked',
            ),
            IconText(
              icon: Icons.pending_actions,
              text: 'Published',
            ),
            IconText(
              icon: Icons.pending_outlined,
              text: 'Published',
            ),
          ],
        ),
      ),
      onPressed: () {
        //
      },
    );
  }

  const UserInfoCard({
    super.key,
    this.margin,
    this.width,
    this.height,
  });
}
