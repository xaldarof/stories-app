import 'package:flutter/cupertino.dart';
import 'package:jokes_app/common/resource/colors.dart';
import 'package:jokes_app/common/resource/fonts.dart';

class Button extends StatelessWidget {
  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: AppColors.darkGreen),
      child: Text(
        text,
        style: primaryTextStyle(
            color: AppColors.darkSpringGreen,
            fontWeight: FontWeight.bold,
            fontSize: 16),
      ),
    );
  }

  const Button({
    super.key,
    this.margin,
    this.width,
    this.height,
    required this.text,
  });
}
