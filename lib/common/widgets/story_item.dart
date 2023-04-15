import 'package:flutter/material.dart';
import 'package:jokes_app/common/resource/fonts.dart';
import 'package:jokes_app/common/utils/size.dart';
import 'package:jokes_app/common/widgets/button.dart';
import 'package:jokes_app/common/widgets/scale_tap.dart';
import 'package:jokes_app/common/widgets/story_owner.dart';
import 'package:jokes_app/common/widgets/story_type_.dart';

import '../../domain/models/ui/story.dart';
import '../resource/colors.dart';

class StoryItem extends StatelessWidget {
  final Function() onTap;
  final Story story;

  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      child: Container(
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
              alignment: Alignment.topCenter,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        left: 24, top: 24, bottom: 12, right: 16),
                    child: const StoryOwnerIcon(
                      icon: Icons.adb,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        child: Text(
                          story.authorName,
                          style: primaryTextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                          overflow: TextOverflow.ellipsis,
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
                margin: const EdgeInsets.only(
                    left: 24, right: 24, top: 24, bottom: 24),
                height: 48,
                width: context.width,
                text: 'View more',
                onTap: () {
                  //
                },
              ),
            )
          ],
        ),
      ),
      onLongPress: () {
        onTap.call();
      },
    );
  }

  const StoryItem({
    super.key,
    required this.onTap,
    required this.story,
  });
}
