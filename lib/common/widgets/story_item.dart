import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jokes_app/common/resource/fonts.dart';
import 'package:jokes_app/common/utils/size.dart';
import 'package:jokes_app/common/widgets/button.dart';
import 'package:jokes_app/common/widgets/scale_tap.dart';
import 'package:jokes_app/common/widgets/story_owner.dart';
import 'package:jokes_app/common/widgets/story_type_.dart';

import '../fake/strings.dart';
import '../resource/colors.dart';

class StoryItem extends StatelessWidget {
  final Function() onTap;

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                        'Lorem ipsum',
                        style: primaryTextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      child: const StoryTypeIcon(
                        value: 'life',
                      ),
                    ),
                  ],
                )
              ],
            ),
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(left: 24, right: 24),
                child: Text(
                  Fake.loremIpsum,
                  style: primaryTextStyle(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                ),
              ),
            ),
            Button(
              margin: const EdgeInsets.only(left: 24, right: 24, top: 24),
              height: 48,
              width: context.width,
              text: 'View more',
              onTap: () {
                //
              },
            ),
          ],
        ),
      ),
      onLongPress: () {
        onTap.call();
      },
    );
  }

  const StoryItem({
    required this.onTap,
  });
}
