import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jokes_app/common/widgets/story_item.dart';

import 'common/resource/colors.dart';

void main() {
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                AppColors.primaryColor,
                AppColors.primaryColorBlack,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topLeft,
              stops: const [0.0, 1],
              tileMode: TileMode.clamp),
          color: AppColors.primaryColor,
        ),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 3,
          itemBuilder: (e, i) {
            return StoryItem(
              onTap: () {
                //
              },
            );
          },
        ),
      ),
    );
  }
}
