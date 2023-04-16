import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:jokes_app/domain/models/common/domain_result.dart';

import '../../../../domain/repositories/auth_repository.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _repository;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginBloc(
    this._repository,
  ) : super(const LoginState()) {
    on<Login>(_login);
  }

  Future<void> _login(Login event, Emitter emitter) {
    return emitter.forEach(
      _repository.login(usernameController.text, passwordController.text),
      onData: (data) {
        if (data is DomainLoading) {
          return state.copyWith(loginStatus: LoginStatus.loading);
        }
        if (data is DomainSuccess) {
          return state.copyWith(loginStatus: LoginStatus.success);
        }
        if (data is DomainFail) {
          return state.copyWith(loginStatus: LoginStatus.fail);
        }
      },
    );
  }
}
