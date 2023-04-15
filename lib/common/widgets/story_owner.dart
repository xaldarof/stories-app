import 'package:flutter/material.dart';

class StoryOwnerIcon extends StatelessWidget {
  final IconData icon;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 52,
      width: width ?? 52,
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }

  const StoryOwnerIcon({
    super.key,
    required this.icon,
    this.width,
    this.height,
  });
}
