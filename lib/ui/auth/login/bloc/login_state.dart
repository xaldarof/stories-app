part of 'login_bloc.dart';

enum LoginStatus {
  loading,
  success,
  fail,
}

class LoginState extends Equatable {
  final LoginStatus? loginStatus;

  const LoginState({
    this.loginStatus,
  });

  @override
  List<Object?> get props => [
        loginStatus,
      ];

  LoginState copyWith({
    LoginStatus? loginStatus,
  }) {
    return LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
    );
  }
}
