import 'package:flutter/material.dart';
import 'package:jokes_app/common/extensions/controller_ext.dart';
import 'package:jokes_app/common/resource/decorations.dart';
import 'package:jokes_app/common/utils/size.dart';
import 'package:jokes_app/ui/stories/story_category_item.dart';

import '../../common/widgets/story_item.dart';

class StoriesScreen extends StatefulWidget {
  const StoriesScreen({super.key});

  @override
  State<StoriesScreen> createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen> {
  final ScrollController _scrollController = ScrollController();
  bool showCategories = true;

  @override
  void initState() {
    _scrollController.addListener(() {
      if (showCategories == true) {
        setState(() {
          showCategories = false;
        });
      }
    });
    _scrollController.onTopReached((onTop) {
      setState(() {
        showCategories = onTop;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(context.width, 42),
        child: showCategories
            ? ListView.builder(
                itemCount: 10,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (e, i) {
                  return const StoryCategoryItem(value: 'value');
                },
              )
            : Container(),
      ),
      body: Container(
        decoration: DefaultBackgroundDecoration(),
        child: ListView.builder(
          controller: _scrollController,
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
      ),
    );
  }
}
