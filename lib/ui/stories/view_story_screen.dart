import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:jokes_app/common/resource/colors.dart';
import 'package:jokes_app/common/resource/fonts.dart';

import '../../domain/models/ui/story.dart';

class ViewStoryScreen extends StatefulWidget {
  final Story story;
  final Function() onReadFinish;

  @override
  State<ViewStoryScreen> createState() => _ViewStoryScreenState();

  const ViewStoryScreen({
    super.key,
    required this.story,
    required this.onReadFinish,
  });
}

class _ViewStoryScreenState extends State<ViewStoryScreen> {
  bool _titleAnimFinish = false;
  bool _dateAnimFinish = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColorBlack,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(widget.story.authorName),
      ),
      body: GestureDetector(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 100, left: 24, right: 24),
                child: AnimatedTextKit(
                  isRepeatingAnimation: false,
                  onFinished: () {
                    setState(() {
                      _titleAnimFinish = true;
                    });
                  },
                  animatedTexts: [
                    TypewriterAnimatedText(
                      speed: const Duration(milliseconds: 30),
                      widget.story.title,
                      textStyle:
                          primaryTextStyle(fontSize: 16, color: AppColors.grey),
                    ),
                  ],
                  onTap: () {
                    //
                  },
                ),
              ),
              if (_titleAnimFinish)
                Container(
                  padding: const EdgeInsets.only(top: 4, left: 24, right: 24),
                  child: AnimatedTextKit(
                    isRepeatingAnimation: false,
                    onFinished: () {
                      setState(() {
                        _dateAnimFinish = true;
                      });
                    },
                    animatedTexts: [
                      TypewriterAnimatedText(
                        speed: const Duration(milliseconds: 30),
                        widget.story.timeCreate,
                        textStyle: primaryTextStyle(
                            fontSize: 14, color: AppColors.grey),
                      ),
                    ],
                    onTap: () {
                      //
                    },
                  ),
                ),
              const Padding(
                padding: EdgeInsets.all(18),
              ),
              if (_dateAnimFinish)
                Container(
                  padding: const EdgeInsets.only(
                      top: 24, left: 24, right: 24, bottom: 42),
                  child: AnimatedTextKit(
                    totalRepeatCount: 1,
                    onFinished: () {
                      widget.onReadFinish.call();
                    },
                    animatedTexts: [
                      TypewriterAnimatedText(
                        speed: const Duration(milliseconds: 30),
                        widget.story.body,
                        textStyle: primaryTextStyle(fontSize: 16),
                      ),
                    ],
                    onTap: () {
                      //
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
