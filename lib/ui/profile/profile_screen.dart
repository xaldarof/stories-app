import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes_app/common/resource/decorations.dart';
import 'package:jokes_app/common/utils/size.dart';
import 'package:jokes_app/common/widgets/settings_item.dart';
import 'package:jokes_app/di/app_di.dart';
import 'package:jokes_app/ui/common/dialog/about.dart';
import 'package:jokes_app/ui/common/dialog/logout.dart';
import 'package:jokes_app/ui/profile/bloc/profile/profile_bloc.dart';
import 'package:jokes_app/ui/profile/user_info_card.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:modified_localization/easy_localization.dart';

import '../../generated/locale_keys.g.dart';
import '../common/dialog/select_language_dialog.dart';

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
          final bloc = context.read<ProfileBloc>();
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
                      showCupertinoModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return LogOutContent(
                            onPositive: () {
                              bloc.add(LogOut());
                            },
                          );
                        },
                      );
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
                    text: Strings.language,
                    onTap: () {
                      showCupertinoModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return SelectLanguage(
                            onSelect: (lang) {
                              context.setLocale(lang.locale);
                            },
                          );
                        },
                      );
                    },
                    icon: Icons.language,
                  ),
                  SettingsItem(
                    margin: const EdgeInsets.only(left: 24, right: 24, top: 12),
                    text: Strings.about,
                    onTap: () {
                      showCupertinoModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return const About();
                        },
                      );
                    },
                    icon: Icons.info_outlined,
                  ),
                  SettingsItem(
                    margin: const EdgeInsets.only(left: 24, right: 24, top: 12),
                    text: Strings.share,
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
