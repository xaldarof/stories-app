import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jokes_app/common/resource/fonts.dart';
import 'package:jokes_app/common/widgets/scale_tap.dart';
import 'package:jokes_app/domain/models/ui/profile.dart';

import '../../common/resource/colors.dart';

class UserItem extends StatelessWidget {
  final User user;
  final int index;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    Color color = AppColors.primaryColor;
    if (index == 1) color = AppColors.gold.withAlpha(152);
    if (index == 2) color = AppColors.gold.withAlpha(100);
    if (index == 3) color = AppColors.gold.withAlpha(62);
    return ScaleTap(
      onPressed: () {
        onTap.call();
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 24, left: 24, right: 24),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.whiteAlpha52),
        ),
        height: 62,
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              child: Text(
                user.username,
                style: primaryTextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.all(16),
              child: Text(
                index.toString(),
                style: primaryTextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  const UserItem({
    super.key,
    required this.user,
    required this.index,
    required this.onTap,
  });
}
