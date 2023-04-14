import 'package:flutter/material.dart';

class StoryOwnerIcon extends StatelessWidget {
  const StoryOwnerIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: 52,
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(100),
      ),
      child: const Icon(
        Icons.adb,
        color: Colors.white,
      ),
    );
  }
}
