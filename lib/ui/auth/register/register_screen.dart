import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes_app/assets.dart';
import 'package:jokes_app/common/resource/decorations.dart';
import 'package:jokes_app/common/utils/ui.dart';
import 'package:jokes_app/common/widgets/button.dart';
import 'package:jokes_app/common/widgets/input_widget.dart';
import 'package:jokes_app/di/app_di.dart';
import 'package:jokes_app/ui/auth/register/bloc/register_bloc.dart';
import 'package:lottie/lottie.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterBloc(
        injector.get(),
      ),
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          final bloc = context.read<RegisterBloc>();
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
                      controller: bloc.usernameController,
                      hint: 'Username',
                      margin: const EdgeInsets.only(left: 24, right: 24)),
                  Input(
                      controller: bloc.passwordController,
                      hint: 'Password',
                      margin: const EdgeInsets.all(24)),
                  const Spacer(),
                  const Spacer(),
                  Button(
                    loading: state.registerStatus == RegisterStatus.loading,
                    margin: const EdgeInsets.all(24),
                    onTap: () {
                      bloc.add(Register());
                      unFocus();
                    },
                    text: 'Login',
                    height: 56,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
