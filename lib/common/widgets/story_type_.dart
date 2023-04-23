import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jokes_app/common/resource/colors.dart';
import 'package:jokes_app/common/resource/fonts.dart';

class StoryTypeIcon extends StatelessWidget {
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 0, right: 12),
      height: 20,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(24),
      //   color: Colors.brown,
      // ),
      child: Text(
        value.toLowerCase(),
        style: primaryTextStyle(
            color: AppColors.white.withAlpha(152), fontSize: 12),
      ),
    );
  }

  const StoryTypeIcon({
    super.key,
    required this.value,
  });
}
