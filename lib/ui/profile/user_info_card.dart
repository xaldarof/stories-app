import 'package:flutter/material.dart';
import 'package:jokes_app/common/widgets/icon_text.dart';
import 'package:jokes_app/common/widgets/scale_tap.dart';
import 'package:jokes_app/domain/models/ui/profile_stats.dart';

import '../../common/resource/colors.dart';

class UserInfoCard extends StatelessWidget {
  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final ProfileStats stats;

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
          children: [
            IconText(
              icon: Icons.favorite,
              text: 'Read count ${stats.readStoriesCount}',
            ),
            IconText(
              icon: Icons.pending_actions,
              text: 'Published ${stats.storyCount}',
            ),
            IconText(
              icon: Icons.pending_actions,
              text: 'View reached count ${stats.viewReachCount}',
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
    required this.stats,
  });
}
