import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes_app/common/utils/navigator.dart';
import 'package:jokes_app/common/widgets/icon_text.dart';
import 'package:jokes_app/common/widgets/scale_tap.dart';
import 'package:jokes_app/domain/models/ui/profile_stats.dart';
import 'package:jokes_app/generated/locale_keys.g.dart';
import 'package:jokes_app/ui/profile/bloc/profile/profile_bloc.dart';
import 'package:jokes_app/ui/profile/user_stories_screen.dart';

import '../../common/resource/colors.dart';

class UserInfoCard extends StatelessWidget {
  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final ProfileStats? stats;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Container(
          alignment: Alignment.centerLeft,
          height: height,
          width: width,
          margin: margin,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: AppColors.primaryDark),
          child: Column(
            children: [
              ScaleTap(
                child: IconText(
                  icon: Icons.favorite,
                  text: '${Strings.readCount} ${stats?.readStoriesCount ?? ""}',
                ),
                onPressed: () {
                  //
                },
              ),
              ScaleTap(
                onPressed: () {
                  context.navigateTo(UserStoriesScreen(
                    userId: state.profile?.id ?? -1,
                    username: state.profile?.username ?? "",
                  ));
                },
                child: IconText(
                  hasAction: true,
                  icon: Icons.pending_actions,
                  text: '${Strings.published} ${stats?.storyCount ?? ""}',
                ),
              ),
              ScaleTap(
                onPressed: () {},
                child: IconText(
                  icon: Icons.pending_actions,
                  text: '${Strings.viewReachCount} ${stats?.viewReachCount ?? ""}',
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  const UserInfoCard({
    super.key,
    this.margin,
    this.width,
    this.height,
    required this.stats,
  });
}
