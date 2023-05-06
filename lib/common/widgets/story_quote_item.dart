import 'package:flutter/material.dart';
import 'package:jokes_app/common/utils/navigator.dart';
import 'package:jokes_app/common/widgets/scale_tap.dart';
import 'package:jokes_app/domain/models/ui/story_quote.dart';

import '../../ui/profile/user_stories_screen.dart';
import '../resource/colors.dart';
import '../resource/fonts.dart';

class StoryQuoteItem extends StatelessWidget {
  final StoryQuote item;
  final Function() onTap;
  final Function() onTapOwner;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap.call();
      },
      title: Row(
        children: [
          ScaleTap(
            onPressed: () {
              onTapOwner.call();
            },
            child: Container(
              padding: const EdgeInsets.only(left: 12, right: 12, top: 2),
              height: 20,
              margin: const EdgeInsets.only(right: 12, top: 16, bottom: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color:
                    item.isOwner ? AppColors.darkGreen : AppColors.whiteAlpha52,
              ),
              child: Text(
                item.username,
                style: primaryTextStyle(color: AppColors.white, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
      trailing: Icon(
        Icons.touch_app,
        color: AppColors.whiteAlpha52,
      ),
      subtitle: Text(
        item.body,
        style: primaryTextStyle(),
      ),
    );
  }

  const StoryQuoteItem({
    super.key,
    required this.item,
    required this.onTap,
    required this.onTapOwner,
  });
}
