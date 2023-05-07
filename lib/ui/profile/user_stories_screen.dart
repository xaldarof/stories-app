import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes_app/common/resource/fonts.dart';
import 'package:jokes_app/common/utils/navigator.dart';
import 'package:jokes_app/common/utils/size.dart';
import 'package:jokes_app/common/widgets/loading.dart';
import 'package:jokes_app/ui/profile/bloc/user_stories/user_stories_bloc.dart';
import 'package:jokes_app/ui/profile/bloc/user_stories/user_stories_state.dart';

import '../../common/resource/colors.dart';
import '../../common/resource/decorations.dart';
import '../../common/widgets/not_found.dart';
import '../../common/widgets/story_item.dart';
import '../../di/app_di.dart';
import '../../generated/locale_keys.g.dart';
import '../stories/story_category_item.dart';
import '../view_story/view_story_screen.dart';
import 'bloc/user_stories/user_stories_event.dart';

class UserStoriesScreen extends StatefulWidget {
  final int userId;
  final String username;

  const UserStoriesScreen({
    super.key,
    required this.userId,
    required this.username,
  });

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
          SetUserId(id: widget.userId),
        )
        ..add(
          GetCategories(
            userId: widget.userId,
          ),
        ),
      child: BlocBuilder<UserStoriesBloc, UserStoriesState>(
        builder: (context, state) {
          final bloc = context.read<UserStoriesBloc>();
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Text(
                "${Strings.stories} ${widget.username}",
                style:
                    primaryTextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              bottom: (state.showCategories && state.categories.isNotEmpty)
                  ? PreferredSize(
                      preferredSize: Size(context.width, 42),
                      child: Expanded(
                        child: ListView.builder(
                          itemCount: state.categories.length,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (e, i) {
                            final item = (state.categories)[i];
                            return StoryCategoryItem(
                              value: item,
                              selected: selectedCategoryIndex == i,
                              onTap: () {
                                bloc.add(GetCategoryStories(
                                    categoryId: item.id,
                                    userId: widget.userId));
                                setState(
                                  () {
                                    selectedCategoryIndex = i;
                                  },
                                );
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
              child: (state.stories.isEmpty)
                  ? state.storiesStatus == UserStoriesStatus.success
                      ? const NotFound()
                      : const Loading()
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
                                  bloc.add(SetAsRead(storyId: item.id));
                                },
                                onUnpublish: () {
                                  // bloc.add(Un)
                                },
                              ),
                            );
                          },
                          story: item,
                          onTapOwner: () {
                            //
                          },
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
