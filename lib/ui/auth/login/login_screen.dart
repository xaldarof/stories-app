import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes_app/assets.dart';
import 'package:jokes_app/common/resource/colors.dart';
import 'package:jokes_app/common/resource/fonts.dart';
import 'package:jokes_app/common/utils/navigator.dart';
import 'package:jokes_app/common/utils/printer.dart';
import 'package:jokes_app/common/utils/ui.dart';
import 'package:jokes_app/common/widgets/button.dart';
import 'package:jokes_app/common/widgets/input_widget.dart';
import 'package:jokes_app/di/app_di.dart';
import 'package:jokes_app/generated/locale_keys.g.dart';
import 'package:jokes_app/ui/auth/login/bloc/login_bloc.dart';
import 'package:jokes_app/ui/auth/register/register_screen.dart';
import 'package:jokes_app/ui/home/home_screen.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
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
      create: (_) => LoginBloc(
        injector.get(),
      ),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          final bloc = context.read<LoginBloc>();
          return MultiBlocListener(
            listeners: [
              BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state.loginStatus == LoginStatus.success) {
                    context.navigateTo(const HomeScreen(), removeStack: true);
                  }
                  if (state.loginStatus == LoginStatus.fail) {
                    context.showSnackBar(Strings.somethingWentWrong,
                        status: MessageStatus.fail);
                  }
                },
              ),
            ],
            child: Scaffold(
              body: AnimateGradient(
                duration: Duration(milliseconds: 500),
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
                        child: Lottie.asset(
                          Assets.writeJson,
                          frameRate: FrameRate.max,
                          width: 152,
                          height: 152,
                        ),
                      ),
                      const Spacer(),
                      Input(
                          controller: bloc.usernameController,
                          hint: Strings.username,
                          margin: const EdgeInsets.only(left: 24, right: 24)),
                      Input(
                          controller: bloc.passwordController,
                          hint: Strings.password,
                          margin: const EdgeInsets.all(24)),
                      InkWell(
                        onTap: () {
                          context.navigateTo(const RegisterScreen());
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 32),
                          alignment: Alignment.centerRight,
                          child: Text(
                            Strings.dontHaveAccountRegister,
                            style: primaryTextStyle(
                                color: AppColors.darkSpringGreen,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Spacer(),
                      Button(
                        enabled: state.loginStatus != LoginStatus.loading,
                        margin: const EdgeInsets.all(24),
                        onTap: () {
                          bloc.add(Login());
                          unFocus();
                        },
                        text: Strings.login,
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
  }
}
