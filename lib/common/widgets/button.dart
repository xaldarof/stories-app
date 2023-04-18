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
  final bool? enabled;
  final bool? animate;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enabled == false ? 0.5 : 1,
      child: ScaleTap(
        scaleMinValue: enabled == false ? 1 : null,
        enableFeedback: enabled == true,
        child: Container(
          alignment: Alignment.center,
          height: height,
          width: width,
          margin: margin,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.darkGreen),
          child: enabled == true
              ? animate == true
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
          if (enabled == true) {
            onTap.call();
          }
        },
      ),
    );
  }

  const Button({
    super.key,
    this.margin,
    this.width,
    this.enabled = false,
    this.animate = true,
    required this.onTap,
    this.height,
    required this.text,
  });
}
