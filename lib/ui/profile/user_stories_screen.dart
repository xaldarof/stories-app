import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes_app/common/utils/navigator.dart';
import 'package:jokes_app/common/utils/size.dart';
import 'package:jokes_app/ui/profile/bloc/user_stories/user_stories_bloc.dart';
import 'package:jokes_app/ui/profile/bloc/user_stories/user_stories_state.dart';

import '../../common/resource/colors.dart';
import '../../common/resource/decorations.dart';
import '../../common/widgets/story_item.dart';
import '../../di/app_di.dart';
import '../stories/story_category_item.dart';
import '../stories/view_story_screen.dart';
import 'bloc/user_stories/user_stories_event.dart';

class UserStoriesScreen extends StatefulWidget {
  const UserStoriesScreen({super.key});

  @override
  State<UserStoriesScreen> createState() => _UserStoriesScreenState();
}

class _UserStoriesScreenState extends State<UserStoriesScreen> {
  var selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserStoriesBloc(injector.get())
        ..add(
          GetCategories(),
        ),
      child: BlocBuilder<UserStoriesBloc, UserStoriesState>(
        builder: (context, state) {
          final bloc = context.read<UserStoriesBloc>();
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: const Text('Your stories'),
              bottom: (state.showCategories && state.categories.isNotEmpty)
                  ? PreferredSize(
                      preferredSize: Size(context.width, 42),
                      child: Expanded(
                        child: ListView.builder(
                          itemCount: state.categories.length,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (e, i) {
                            final item = (state.categories ?? [])[i];
                            return StoryCategoryItem(
                              value: item,
                              selected: selectedCategoryIndex == i,
                              onTap: () {
                                bloc.add(
                                    GetCategoryStories(categoryId: item.id));
                                setState(() {
                                  selectedCategoryIndex = i;
                                });
                              },
                            );
                          },
                        ),
                      ),
                    )
                  : null,
            ),
            body: Container(
              height: context.height,
              width: context.width,
              decoration: const DefaultBackgroundDecoration(),
              child: (state.categories.isEmpty)
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
                      padding: const EdgeInsets.only(top: 152),
                      controller: bloc.scrollController,
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.stories.length,
                      itemBuilder: (e, i) {
                        final item = (state.stories)[i];
                        return StoryItem(
                          onTap: () {
                            context.navigateTo(
                              ViewStoryScreen(
                                story: item,
                                onReadFinish: () {
                                  //
                                },
                              ),
                            );
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
