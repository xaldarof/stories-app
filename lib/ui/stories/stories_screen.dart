

import 'package:flutter/cupertino.dart';

import '../../common/resource/colors.dart';
import '../../common/widgets/story_item.dart';

class StoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 3,
        itemBuilder: (e, i) {
          return StoryItem(
            onTap: () {
              //
            },
          );
        },
      ),
    );
  }
}