import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jokes_app/common/utils/ui.dart';

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
    const PublishScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    setNavColor();
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
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
        items: const [
          BottomNavigationBarItem(
            label: 'Stories',
            icon: Icon(Icons.pending),
          ),
          BottomNavigationBarItem(
            label: 'Publish',
            icon: Icon(Icons.add),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person),
          ),
        ],
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColorBlack,
      ),
      body: _screens[selectedIndex],
    );
  }
}
