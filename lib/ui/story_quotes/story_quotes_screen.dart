import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes_app/common/resource/fonts.dart';
import 'package:jokes_app/common/utils/navigator.dart';
import 'package:jokes_app/generated/locale_keys.g.dart';
import 'package:jokes_app/ui/profile/user_stories_screen.dart';
import 'package:jokes_app/ui/story_quotes/bloc/story_quotes_bloc.dart';

import '../../common/resource/colors.dart';
import '../../di/app_di.dart';

class StoryQuotesScreen extends StatelessWidget {
  final String title;
  final int storyId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StoryQuotesBloc>(
      create: (_) => StoryQuotesBloc(
        injector.get(),
      )..add(
          GetQuotes(storyId: storyId),
        ),
      child: BlocBuilder<StoryQuotesBloc, StoryQuotesState>(
        builder: (context, state) {
          final bloc = context.read<StoryQuotesBloc>();
          return Scaffold(
            backgroundColor: AppColors.primaryColorBlack,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Text(
                "${Strings.quotes} $title",
                style:
                    primaryTextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            body: ListView.separated(
              itemCount: state.quotes.length,
              itemBuilder: (e, i) {
                final item = state.quotes[i];
                return ListTile(
                  onTap: () {
                    context.navigateTo(UserStoriesScreen(
                        userId: item.userId, username: item.username));
                  },
                  title: Row(
                    children: [
                      Container(
                        padding:
                            const EdgeInsets.only(left: 12, right: 12, top: 2),
                        height: 20,
                        margin: const EdgeInsets.only(
                            right: 12, top: 16, bottom: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: item.isOwner
                              ? AppColors.darkGreen
                              : AppColors.whiteAlpha52,
                        ),
                        child: Text(
                          item.username,
                          style: primaryTextStyle(
                              color: AppColors.white, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  subtitle: Text(
                    item.body,
                    style: primaryTextStyle(),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: AppColors.whiteAlpha52,
                );
              },
            ),
          );
        },
      ),
    );
  }

  const StoryQuotesScreen({
    super.key,
    required this.title,
    required this.storyId,
  });
}
