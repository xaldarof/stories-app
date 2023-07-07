import 'package:flutter/material.dart';
import 'package:jokes_app/common/resource/fonts.dart';
import 'package:jokes_app/common/utils/navigator.dart';
import 'package:jokes_app/common/utils/ui.dart';
import 'package:jokes_app/generated/locale_keys.g.dart';
import 'package:jokes_app/ui/global/global_screen.dart';
import 'package:jokes_app/ui/profile/notifications/notifications_screen.dart';
import 'package:quick_actions/quick_actions.dart';

import '../../common/resource/colors.dart';
import '../profile/profile_screen.dart';
import '../publish/publish_screen.dart';
import '../stories/stories_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    _initQuickActions();
    super.initState();
  }

  void _initQuickActions() {
    const QuickActions quickActions = QuickActions();
    quickActions.initialize((shortcutType) {
      if (shortcutType == 'profile') {
        setState(() {
          _selectedIndex = 3;
        });
      }
      if (shortcutType == 'publish') {
        setState(() {
          _selectedIndex = 2;
        });
      }
      if (shortcutType == 'notifications') {
        context.navigateTo(const NotificationsScreen());
      }
    });
    quickActions.setShortcutItems(<ShortcutItem>[
      ShortcutItem(
          type: 'profile', localizedTitle: Strings.profile, icon: 'profile'),
      ShortcutItem(
          type: 'publish', localizedTitle: Strings.publish, icon: 'add_new_icon'),
      ShortcutItem(
          type: 'notifications',
          localizedTitle: Strings.notifications,
          icon: 'notification')
    ]);
  }

  final _screens = [
    const StoriesScreen(),
    const GlobalScreen(),
    const PublishScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    setNavColor();
    final screenTitles = [
      Strings.stories,
      Strings.global,
      Strings.publish,
      Strings.profile,
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
        selectedItemColor: AppColors.darkSpringGreen,
        unselectedItemColor: Colors.white.withAlpha(72),
        unselectedLabelStyle: const TextStyle(color: Colors.black12),
        items: [
          BottomNavigationBarItem(
            label: Strings.stories,
            icon: const Icon(Icons.pending),
          ),
          BottomNavigationBarItem(
            label: Strings.global,
            icon: const Icon(Icons.public),
          ),
          BottomNavigationBarItem(
            label: Strings.publish,
            icon: const Icon(Icons.add),
          ),
          BottomNavigationBarItem(
            label: Strings.profile,
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          screenTitles[_selectedIndex],
          style: primaryTextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.primaryColorBlack,
      ),
      body: _screens[_selectedIndex],
    );
  }
}
