part of 'profile_bloc.dart';

enum ProfileStatus {
  loading,
  success,
  fail,
}

class ProfileState extends Equatable {
  final ProfileStatus? profileStatus;
  final Profile? profile;

  @override
  List<Object?> get props => [
        profileStatus,
      ];

  const ProfileState({
    this.profileStatus,
    this.profile,
  });

  ProfileState copyWith({
    ProfileStatus? profileStatus,
    Profile? profile,
  }) {
    return ProfileState(
      profileStatus: profileStatus ?? this.profileStatus,
      profile: profile ?? this.profile,
    );
  }
}
