import 'package:flutter/cupertino.dart';

import 'colors.dart';

class DefaultBackgroundDecoration extends BoxDecoration {
  final double? radius;

  @override
  BorderRadiusGeometry? get borderRadius => BorderRadius.circular(radius ?? 0);

  @override
  Color? get color => AppColors.primaryColor;

  @override
  Gradient? get gradient => LinearGradient(
      colors: [
        AppColors.primaryColor,
        AppColors.primaryColorBlack,
      ],
      begin: Alignment.bottomCenter,
      end: Alignment.topLeft,
      stops: const [0.0, 1],
      tileMode: TileMode.clamp);

  const DefaultBackgroundDecoration({
    this.radius,
  });
}
