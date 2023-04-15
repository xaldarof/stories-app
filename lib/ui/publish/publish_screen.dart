import 'package:flutter/cupertino.dart';
import 'package:jokes_app/common/utils/size.dart';
import 'package:jokes_app/common/widgets/button.dart';
import 'package:jokes_app/common/widgets/input_widget.dart';

import '../../common/resource/colors.dart';
import '../../common/widgets/story_item.dart';

class PublishScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              AppColors.primaryColor,
              AppColors.primaryColorBlack,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topLeft,
            stops: const [0.0, 1],
            tileMode: TileMode.clamp),
        color: AppColors.primaryColor,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        controller: ScrollController(),
        child: Column(
          children: [
            Input(
              hint: 'Title...',
              margin: const EdgeInsets.only(
                  left: 24, right: 24, top: 24, bottom: 0),
              multiLine: false,
            ),
            Input(
              hint: 'Body...',
              margin: const EdgeInsets.all(24),
              multiLine: true,
            ),
            Button(
              loading: false,
              height: 52,
              onTap: () {},
              text: 'Send to review',
              margin: const EdgeInsets.all(24),
            ),
          ],
        ),
      ),
    );
  }
}
