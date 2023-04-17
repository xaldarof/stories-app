import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes_app/common/resource/decorations.dart';
import 'package:jokes_app/common/utils/size.dart';
import 'package:jokes_app/common/widgets/settings_item.dart';
import 'package:jokes_app/di/app_di.dart';
import 'package:jokes_app/ui/profile/bloc/profile_bloc.dart';
import 'package:jokes_app/ui/profile/user_info_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileBloc(injector.get())
        ..add(
          GetProfile(),
        )
        ..add(
          GetProfileStats(),
        ),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return Container(
            height: context.height,
            decoration: const DefaultBackgroundDecoration(),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SettingsItem(
                    subText: state.profile?.dateJoined,
                    margin: const EdgeInsets.all(24),
                    text: state.profile?.username ?? "",
                    onTap: () {
                      //
                    },
                    icon: Icons.person,
                  ),
                  if (state.profileStats != null)
                    UserInfoCard(
                      margin: const EdgeInsets.only(left: 24, right: 24),
                      stats: state.profileStats!,
                    ),
                  SettingsItem(
                    margin: const EdgeInsets.only(left: 24, right: 24, top: 12),
                    text: 'Language',
                    onTap: () {
                      //
                    },
                    icon: Icons.language,
                  ),
                  SettingsItem(
                    margin: const EdgeInsets.only(left: 24, right: 24, top: 12),
                    text: 'About',
                    onTap: () {
                      //
                    },
                    icon: Icons.info_outlined,
                  ),
                  SettingsItem(
                    margin: const EdgeInsets.only(left: 24, right: 24, top: 12),
                    text: 'Share',
                    onTap: () {
                      //
                    },
                    icon: Icons.share,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
