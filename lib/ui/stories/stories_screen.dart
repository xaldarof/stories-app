import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes_app/common/extensions/controller_ext.dart';
import 'package:jokes_app/common/resource/colors.dart';
import 'package:jokes_app/common/resource/decorations.dart';
import 'package:jokes_app/common/utils/size.dart';
import 'package:jokes_app/di/app_di.dart';
import 'package:jokes_app/ui/stories/bloc/stories_bloc.dart';
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
    return BlocProvider(
      create: (_) => StoriesBloc(injector.get())
        ..add(
          GetCategories(),
        )
        ..add(
          GetStories(),
        ),
      child: BlocBuilder<StoriesBloc, StoriesState>(
        builder: (context, state) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: PreferredSize(
              preferredSize: Size(context.width, 42),
              child: (showCategories && state.categories != null)
                  ? ListView.builder(
                      itemCount: state.categories?.length,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (e, i) {
                        final item = (state.categories ?? [])[i];
                        return StoryCategoryItem(value: item);
                      },
                    )
                  : Container(),
            ),
            body: Container(
              height: context.height,
              width: context.width,
              decoration: DefaultBackgroundDecoration(),
              child: (state.stories == null)
                  ? SizedBox(
                      width: 24,
                      height: 24,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.darkSpringGreen,
                        ),
                      ),
                    )
                  : ListView.builder(
                      controller: _scrollController,
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.stories?.length,
                      itemBuilder: (e, i) {
                        final item = (state.stories ?? [])[i];
                        return StoryItem(
                          onTap: () {
                            //
                          },
                          story: item,
                        );
                      },
                    ),
            ),
          );
        },
      ),
    );
  }
}
