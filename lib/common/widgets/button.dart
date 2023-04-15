import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jokes_app/common/resource/colors.dart';
import 'package:jokes_app/common/resource/fonts.dart';
import 'package:jokes_app/common/widgets/scale_tap.dart';

class Button extends StatelessWidget {
  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final String text;
  final bool? loading;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: loading == true ? 0.5 : 1,
      child: ScaleTap(
        scaleMinValue: loading == true ? 1 : null,
        enableFeedback: loading == false,
        child: Container(
          alignment: Alignment.center,
          height: height,
          width: width,
          margin: margin,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.darkGreen),
          child: loading == true
              ? SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: AppColors.darkSpringGreen,
                    strokeWidth: 2,
                  ),
                )
              : Text(
                  text,
                  style: primaryTextStyle(
                      color: AppColors.darkSpringGreen,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
        ),
        onPressed: () {
          onTap.call();
        },
      ),
    );
  }

  const Button({
    super.key,
    this.margin,
    this.width,
    this.loading = false,
    required this.onTap,
    this.height,
    required this.text,
  });
}
