import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jokes_app/common/resource/decorations.dart';
import 'package:jokes_app/common/utils/size.dart';
import 'package:jokes_app/common/widgets/settings_item.dart';
import 'package:jokes_app/ui/profile/user_info_card.dart';

import '../../common/resource/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height,
      decoration: DefaultBackgroundDecoration(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SettingsItem(
              margin: const EdgeInsets.all(24),
              text: 'Xoldarov Temur',
              onTap: () {
                //
              },
              icon: Icons.person,
            ),
            const UserInfoCard(
              margin: EdgeInsets.only(left: 24, right: 24),
            ),
            SettingsItem(
              margin: const EdgeInsets.all(24),
              text: 'Language',
              onTap: () {
                //
              },
              icon: Icons.language,
            ),
            SettingsItem(
              margin: const EdgeInsets.only(left: 24, right: 24),
              text: 'About',
              onTap: () {
                //
              },
              icon: Icons.info_outlined,
            ),
            SettingsItem(
              margin: const EdgeInsets.all(24),
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
  }
}
