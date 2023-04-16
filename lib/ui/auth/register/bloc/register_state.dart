part of 'register_bloc.dart';

enum RegisterStatus {
  loading,
  success,
  fail,
}

@immutable
class RegisterState extends Equatable {
  final RegisterStatus? registerStatus;

  const RegisterState({
    this.registerStatus,
  });

  @override
  List<Object?> get props => [
        registerStatus,
      ];

  RegisterState copyWith({
    RegisterStatus? registerStatus,
  }) {
    return RegisterState(
      registerStatus: registerStatus ?? this.registerStatus,
    );
  }
}
