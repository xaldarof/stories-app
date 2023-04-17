import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jokes_app/common/utils/printer.dart';
import 'package:jokes_app/domain/models/ui/profile_stats.dart';

import '../../../domain/models/common/domain_result.dart';
import '../../../domain/models/ui/profile.dart';
import '../../../domain/repositories/profile_repository.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository _repository;

  ProfileBloc(this._repository) : super(const ProfileState()) {
    on<GetProfile>(_getProfile);
    on<GetProfileStats>(_getProfileStats);
  }

  Future<void> _getProfile(GetProfile event, Emitter emitter) {
    return emitter.forEach(
      _repository.getProfile(),
      onData: (data) {
        if (data is DomainLoading) {
          return state.copyWith(profileStatus: ProfileStatus.loading);
        }
        if (data is DomainSuccess<Profile>) {
          return state.copyWith(
              profileStatus: ProfileStatus.success, profile: data.data);
        }
        if (data is DomainFail) {
          return state.copyWith(profileStatus: ProfileStatus.fail);
        }
        return state;
      },
    );
  }

  Future<void> _getProfileStats(GetProfileStats event, Emitter emitter) {
    return emitter.forEach(
      _repository.getStats(),
      onData: (data) {
        printMessage('get stats : ${data}');
        if (data is DomainLoading) {
          return state.copyWith(profileStatsStatus: ProfileStatus.loading);
        }
        if (data is DomainSuccess<ProfileStats>) {
          return state.copyWith(
              profileStatsStatus: ProfileStatus.success,
              profileStats: data.data);
        }
        if (data is DomainFail) {
          return state.copyWith(profileStatsStatus: ProfileStatus.fail);
        }
        return state;
      },
    );
  }
}
