import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/models/common/domain_result.dart';
import '../../../domain/models/ui/profile.dart';
import '../../../domain/repositories/profile_repository.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository _repository;

  ProfileBloc(this._repository) : super(const ProfileState()) {
    on<GetProfile>(_getProfile);
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
}
