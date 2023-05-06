import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jokes_app/common/resource/colors.dart';
import 'package:jokes_app/common/resource/fonts.dart';
import 'package:jokes_app/common/widgets/scale_tap.dart';
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
    return Container(
      height: 252,
      margin: const EdgeInsets.all(16),
      child: Screenshot(
        controller: screenshotController,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
          ),
          alignment: Alignment.center,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  maxLines: 8,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  text,
                  style: primaryTextStyle(),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  "Stories app",
                  style: primaryTextStyle(
                      color: AppColors.whiteAlpha52, fontSize: 12),
                ),
              ),
            ],
          ),
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
  Color _backgroundColor = Colors.black;
  ScreenshotController screenshotController = ScreenshotController();
  int _selectedIndex = 0;
  final List<Color> _colors = [];

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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(24),
      ),
      margin: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ScaleTap(
            onPressed: () {
              setState(() {
                _selectedIndex = Random().nextInt(50);
                _backgroundColor = _colors[_selectedIndex];
              });
            },
            child: _ImageContent(
              color: _backgroundColor,
              text: widget.text,
              screenshotController: screenshotController,
            ),
          ),
          _ImageBackgroundPicker(
            onPick: (color, index) {
              setState(
                () {
                  _backgroundColor = color;
                  _selectedIndex = index;
                },
              );
            },
            selectedIndex: _selectedIndex,
            colors: _colors,
          ),
          Row(
            children: [
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(top: 12, right: 16, bottom: 16),
                child: FloatingActionButton(
                  splashColor: AppColors.darkSpringGreen,
                  backgroundColor: AppColors.darkGreen,
                  child: const Icon(Icons.send),
                  onPressed: () async {
                    final path = await screenshotController.captureAndSave(
                        (await FileUtils.generateFilePath("jpeg")));
                    if (path != null) {
                      Share.shareXFiles([XFile(path)]);
                    }
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _ImageBackgroundPicker extends StatefulWidget {
  final Function(Color color, int index) onPick;
  final int selectedIndex;
  final List<Color> colors;

  @override
  State<_ImageBackgroundPicker> createState() => _ImageBackgroundPickerState();

  const _ImageBackgroundPicker({
    required this.onPick,
    required this.selectedIndex,
    required this.colors,
  });
}

class _ImageBackgroundPickerState extends State<_ImageBackgroundPicker>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 50, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(left: 16, right: 16),
        scrollDirection: Axis.horizontal,
        itemCount: widget.colors.length,
        itemBuilder: (e, i) {
          final item = widget.colors[i];
          return ScaleTap(
            onPressed: () {
              widget.onPick.call(item, i);
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
                  border: widget.selectedIndex == i
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
