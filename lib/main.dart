import 'dart:ui';

import 'package:encrypt_shared_preferences/enc_shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jokes_app/di/app_di.dart';
import 'package:jokes_app/ui/profile/profile_screen.dart';
import 'package:jokes_app/ui/publish/publish_screen.dart';
import 'package:jokes_app/ui/stories/stories_screen.dart';

import 'common/resource/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EncryptedSharedPreferences.initialize('1234930934-023940-2394-0324234');
  await setUpDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Stories'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  final _screens = [
    const StoriesScreen(),
    PublishScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var mySystemTheme = SystemUiOverlayStyle.light
        .copyWith(systemNavigationBarColor: AppColors.black);
    SystemChrome.setSystemUIOverlayStyle(mySystemTheme);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
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
        title: Text(widget.title),
      ),
      body: _screens[selectedIndex],
    );
  }
}
