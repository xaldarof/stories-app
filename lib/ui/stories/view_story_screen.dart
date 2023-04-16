import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jokes_app/common/resource/colors.dart';
import 'package:jokes_app/common/resource/fonts.dart';
import 'package:jokes_app/common/utils/size.dart';

import '../../common/resource/decorations.dart';
import '../../domain/models/ui/story.dart';

class ViewStoryScreen extends StatelessWidget {
  final Story story;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColorBlack,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(story.authorName),
      ),
      body: Expanded(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.only(
                top: 100, left: 24, right: 24, bottom: 100),
            decoration: const DefaultBackgroundDecoration(radius: 24),
            child: AnimatedTextKit(
              isRepeatingAnimation: false,
              animatedTexts: [
                TypewriterAnimatedText(
                    speed: const Duration(milliseconds: 1),
                    story.body +
                        story.body +
                        story.body +
                        story.body +
                        story.body +
                        story.body +
                        story.body +
                        story.body +
                        story.body +
                        story.body +
                        story.body +
                        story.body +
                        story.body,
                    textStyle: primaryTextStyle()),
              ],
              onTap: () {
                //
              },
            ),
          ),
        ),
      ),
    );
  }

  const ViewStoryScreen({
    super.key,
    required this.story,
  });
}
