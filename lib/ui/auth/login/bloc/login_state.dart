part of 'login_bloc.dart';

enum LoginStatus {
  loading,
  success,
  fail,
}

class LoginState {
  final LoginStatus? loginStatus;

  const LoginState({
    this.loginStatus,
  });

  LoginState copyWith({
    LoginStatus? loginStatus,
  }) {
    return LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
    );
  }
}
