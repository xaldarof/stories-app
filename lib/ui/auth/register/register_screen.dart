import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes_app/assets.dart';
import 'package:jokes_app/common/utils/navigator.dart';
import 'package:jokes_app/common/utils/ui.dart';
import 'package:jokes_app/common/widgets/button.dart';
import 'package:jokes_app/common/widgets/input_widget.dart';
import 'package:jokes_app/di/app_di.dart';
import 'package:jokes_app/ui/auth/register/bloc/register_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../common/resource/colors.dart';
import '../../home/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterBloc(
        injector.get(),
      ),
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          final bloc = context.read<RegisterBloc>();
          return MultiBlocListener(
            listeners: [
              BlocListener<RegisterBloc, RegisterState>(
                listener: (context, state) {
                  if (state.registerStatus == RegisterStatus.success) {
                    context.navigateTo(const HomeScreen(), removeStack: true);
                  }
                },
              ),
            ],
            child: Material(
              child: AnimateGradient(
                controller: _animationController,
                primaryColors: [
                  AppColors.darkGreen,
                  AppColors.primaryColor,
                  AppColors.primaryColor,
                ],
                secondaryColors: [
                  AppColors.primaryColor,
                  AppColors.primaryColorBlack,
                  AppColors.primaryColorBlack,
                ],
                child: Container(
                  alignment: Alignment.center,
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
                        enabled: state.registerStatus == RegisterStatus.loading,
                        margin: const EdgeInsets.all(24),
                        onTap: () {
                          bloc.add(Register());
                          unFocus();
                        },
                        text: 'Register',
                        height: 56,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
}
