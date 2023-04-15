import 'package:flutter/material.dart';
import 'package:jokes_app/common/widgets/story_owner.dart';

import '../resource/colors.dart';
import '../resource/fonts.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.all(14),
          child: StoryOwnerIcon(
            width: 48,
            height: 48,
            icon: icon,
          ),
        ),
        Text(
          text,
          style: primaryTextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
      ],
    );
  }

  const IconText({
    super.key,
    required this.icon,
    required this.text,
  });
}
