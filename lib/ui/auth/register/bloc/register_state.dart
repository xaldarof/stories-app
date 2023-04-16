part of 'register_bloc.dart';

enum RegisterStatus {
  loading,
  success,
  fail,
}

@immutable
class RegisterState {
  final RegisterStatus? registerStatus;

  const RegisterState({
    this.registerStatus,
  });

  RegisterState copyWith({
    RegisterStatus? registerStatus,
  }) {
    return RegisterState(
      registerStatus: registerStatus ?? this.registerStatus,
    );
  }
}
