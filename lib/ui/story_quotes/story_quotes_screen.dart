import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes_app/common/resource/fonts.dart';
import 'package:jokes_app/common/utils/navigator.dart';
import 'package:jokes_app/common/widgets/loading.dart';
import 'package:jokes_app/common/widgets/not_found.dart';
import 'package:jokes_app/common/widgets/story_quote_item.dart';
import 'package:jokes_app/generated/locale_keys.g.dart';
import 'package:jokes_app/ui/profile/user_stories_screen.dart';
import 'package:jokes_app/ui/story_quotes/bloc/story_quotes_bloc.dart';
import 'package:jokes_app/ui/story_quotes/generate_quote_image_dialog.dart';

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
            body: state.quotes.isEmpty
                ? state.quotesStatus == StoryQuotesStatus.success
                    ? const NotFound()
                    : const Loading()
                : ListView.separated(
                    itemCount: state.quotes.length,
                    itemBuilder: (e, i) {
                      final item = state.quotes[i];
                      return StoryQuoteItem(
                        item: item,
                        onTap: () {
                          showGenerateQuoteDialog(
                              context, item.body);
                        },
                        onTapOwner: () {
                          context.navigateTo(UserStoriesScreen(
                              userId: item.userId, username: item.username));
                        },
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
