import 'package:flutter/material.dart';
import 'package:jokes_app/assets.dart';
import 'package:jokes_app/common/resource/decorations.dart';
import 'package:jokes_app/common/utils/ui.dart';
import 'package:jokes_app/common/widgets/button.dart';
import 'package:jokes_app/common/widgets/input_widget.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const DefaultBackgroundDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(),
            SizedBox(
                height: 100,
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    Colors.red,
                    BlendMode.modulate,
                  ),
                  child: Lottie.asset(
                    Assets.writeJson,
                    frameRate: FrameRate.max,
                    width: 152,
                    height: 152,
                  ),
                )),
            const Spacer(),
            Input(
                hint: 'Username',
                margin: const EdgeInsets.only(left: 24, right: 24)),
            Input(hint: 'Password', margin: const EdgeInsets.all(24)),
            const Spacer(),
            const Spacer(),
            Button(
              margin: const EdgeInsets.all(24),
              onTap: () {
                unFocus();
              },
              text: 'Login',
              height: 56,
            ),
          ],
        ),
      ),
    );
  }
}
