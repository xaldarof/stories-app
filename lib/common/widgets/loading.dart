import 'package:flutter/cupertino.dart';
import 'package:jokes_app/assets.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: Center(
        child: Lottie.asset(
          Assets.loadingJson,
          frameRate: FrameRate.max,
          width: 152,
          height: 152,
        ),
      ),
    );
  }
}
