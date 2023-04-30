import 'package:flutter/material.dart';
import 'package:jokes_app/common/resource/fonts.dart';
import 'package:jokes_app/common/utils/ui.dart';
import 'package:jokes_app/generated/locale_keys.g.dart';
import 'package:jokes_app/ui/global/global_screen.dart';

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
  int selectedIndex = 0;

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
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(
            () {
              selectedIndex = index;
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
          screenTitles[selectedIndex],
          style: primaryTextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.primaryColorBlack,
      ),
      body: _screens[selectedIndex],
    );
  }
}
