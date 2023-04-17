part of 'profile_bloc.dart';

enum ProfileStatus {
  loading,
  success,
  fail,
}

class ProfileState extends Equatable {
  final ProfileStatus? profileStatus;
  final ProfileStatus? profileStatsStatus;
  final Profile? profile;
  final ProfileStats? profileStats;

  @override
  List<Object?> get props => [
        profileStatus,
        profileStats,
      ];

  const ProfileState({
    this.profileStatus,
    this.profileStatsStatus,
    this.profile,
    this.profileStats,
  });

  ProfileState copyWith({
    ProfileStatus? profileStatus,
    ProfileStatus? profileStatsStatus,
    Profile? profile,
    ProfileStats? profileStats,
  }) {
    return ProfileState(
      profileStatus: profileStatus ?? this.profileStatus,
      profileStatsStatus: profileStatsStatus ?? this.profileStatsStatus,
      profile: profile ?? this.profile,
      profileStats: profileStats ?? this.profileStats,
    );
  }
}
