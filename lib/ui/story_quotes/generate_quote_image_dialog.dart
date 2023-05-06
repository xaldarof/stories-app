import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jokes_app/common/resource/colors.dart';
import 'package:jokes_app/common/resource/fonts.dart';
import 'package:jokes_app/common/utils/size.dart';
import 'package:jokes_app/common/widgets/scale_tap.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import '../../common/utils/file.dart';

void showGenerateQuoteDialog(BuildContext context, String text) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
      return Material(
        color: Colors.transparent,
        child: _DialogContent(
          text: text,
        ),
      );
    },
  );
}

class _ImageContent extends StatelessWidget {
  final String text;
  final Color color;
  final ScreenshotController screenshotController;

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenshotController,
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.whiteAlpha52),
        ),
        alignment: Alignment.center,
        height: 200,
        width: context.width,
        child: Text(
          text,
          style: primaryTextStyle(),
        ),
      ),
    );
  }

  const _ImageContent({
    required this.text,
    required this.color,
    required this.screenshotController,
  });
}

class _DialogContent extends StatefulWidget {
  final String text;

  @override
  State<_DialogContent> createState() => _DialogContentState();

  const _DialogContent({
    required this.text,
  });
}

class _DialogContentState extends State<_DialogContent> {
  Color _backgroundColor = Colors.transparent;
  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(24),
      ),
      margin: const EdgeInsets.all(24),
      height: 350,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                _ImageContent(
                  color: _backgroundColor,
                  text: widget.text,
                  screenshotController: screenshotController,
                ),
                Flexible(
                  child: _ImageBackgroundPicker(
                    onPick: (color) {
                      setState(
                        () {
                          _backgroundColor = color;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: const EdgeInsets.all(16),
              child: FloatingActionButton(
                splashColor: AppColors.darkSpringGreen,
                backgroundColor: AppColors.darkGreen,
                child: const Icon(Icons.save),
                onPressed: () async {
                  final path = await screenshotController.captureAndSave(
                      (await FileUtils.generateFilePath("png")));
                  if (path != null) {
                    Share.shareXFiles([XFile(path)]);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageBackgroundPicker extends StatefulWidget {
  final Function(Color color) onPick;

  @override
  State<_ImageBackgroundPicker> createState() => _ImageBackgroundPickerState();

  const _ImageBackgroundPicker({
    required this.onPick,
  });
}

class _ImageBackgroundPickerState extends State<_ImageBackgroundPicker> {
  final _colors = [];

  @override
  void initState() {
    _colors.add(Colors.black);
    _colors.add(Colors.white);
    for (int i = 0; i < 50; i++) {
      _colors.add(Color.fromARGB(Random().nextInt(255), Random().nextInt(255),
          Random().nextInt(255), Random().nextInt(255)));
    }
    super.initState();
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(left: 16, right: 16),
        scrollDirection: Axis.horizontal,
        itemCount: _colors.length,
        itemBuilder: (e, i) {
          final item = _colors[i];
          return ScaleTap(
            onPressed: () {
              widget.onPick.call(item);
              setState(() {
                selectedIndex = i;
              });
            },
            child: Container(
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: item,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(2),
              height: 24,
              width: 24,
              child: Container(
                width: 16,
                decoration: BoxDecoration(
                  color: item,
                  border: selectedIndex == i
                      ? Border.all(color: Colors.black, width: 2)
                      : null,
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 16,
              ),
            ),
          );
        },
      ),
    );
  }
}