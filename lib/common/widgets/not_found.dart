import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

import '../../assets.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: Center(
        child: Lottie.asset(Assets.emptyJson, width: 152, height: 152),
      ),
    );
  }
}
