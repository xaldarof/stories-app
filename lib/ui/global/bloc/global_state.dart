part of 'global_bloc.dart';

enum GlobalStatus {
  loading,
  success,
  fail,
}

class GlobalState extends Equatable {
  final GlobalStatus? topUsersStatus;
  final List<User> topUsers;

  @override
  List<Object?> get props => [
        topUsersStatus,
        topUsers,
      ];

  const GlobalState({
    this.topUsersStatus,
    this.topUsers = const [],
  });

  GlobalState copyWith({
    GlobalStatus? topUsersStatus,
    List<User>? topUsers,
  }) {
    return GlobalState(
      topUsersStatus: topUsersStatus ?? this.topUsersStatus,
      topUsers: topUsers ?? this.topUsers,
    );
  }
}
