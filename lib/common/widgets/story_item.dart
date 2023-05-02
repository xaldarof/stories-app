import 'package:flutter/material.dart';
import 'package:jokes_app/common/resource/fonts.dart';
import 'package:jokes_app/common/utils/size.dart';
import 'package:jokes_app/common/utils/strings.dart';
import 'package:jokes_app/common/widgets/button.dart';
import 'package:jokes_app/common/widgets/scale_tap.dart';
import 'package:jokes_app/common/widgets/story_owner.dart';
import 'package:jokes_app/common/widgets/story_type_.dart';
import 'package:jokes_app/generated/locale_keys.g.dart';

import '../../domain/models/ui/story.dart';
import '../resource/colors.dart';

class StoryItem extends StatelessWidget {
  final Function() onTap;
  final Story story;
  final Function() onTapOwner;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      margin: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.primaryDark,
        border: Border.all(color: AppColors.whiteAlpha52),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: ScaleTap(
              onPressed: () {
                onTapOwner.call();
              },
              child: Container(
                padding: const EdgeInsets.only(left: 12, right: 12),
                height: 20,
                margin: const EdgeInsets.only(right: 12, top: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.whiteAlpha52,
                ),
                child: Text(
                  story.authorName,
                  style: primaryTextStyle(color: AppColors.white, fontSize: 12),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      left: 24, top: 24, bottom: 12, right: 16),
                  child: ScaleTap(
                    onPressed: () {
                      onTapOwner.call();
                    },
                    child: CircleIcon(
                      animate: story.isPremium,
                      iconColor: story.isEnabled ? null : AppColors.blue,
                      borderColor: story.isPremium ? AppColors.gold : null,
                      icon: story.isEnabled
                          ? Icons.public
                          : Icons.ac_unit_rounded,
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      child: Text(
                        story.title.cut(20),
                        overflow: TextOverflow.ellipsis,
                        style: primaryTextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      child: StoryTypeIcon(
                        value: story.timeCreate,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 24, right: 24, top: 92),
              child: Text(
                textAlign: TextAlign.start,
                story.body,
                style: primaryTextStyle(),
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Button(
              enabled: story.isEnabled,
              margin: const EdgeInsets.only(
                  left: 24, right: 24, top: 24, bottom: 24),
              height: 48,
              width: context.width,
              text: story.isEnabled
                  ? '${Strings.viewMore}(${story.viewCount})'
                  : Strings.frozen,
              onTap: () {
                onTap.call();
              },
            ),
          )
        ],
      ),
    );
  }

  const StoryItem({
    super.key,
    required this.onTap,
    required this.story,
    required this.onTapOwner,
  });
}
