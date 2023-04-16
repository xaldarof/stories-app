import 'package:jokes_app/domain/data_sources/profile_network_data_source.dart';
import 'package:jokes_app/domain/mappers/profile_mapper.dart';
import 'package:jokes_app/domain/models/common/domain_result.dart';
import 'package:jokes_app/domain/models/ui/profile.dart';
import 'package:jokes_app/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileNetworkDataSource _networkDataSource;
  final ProfileMapper _profileMapper;

  @override
  Stream<DomainResult> getProfile() async* {
    try {
      yield DomainLoading();
      final res = await _networkDataSource.getProfile();
      final ui = _profileMapper.map(res);
      yield DomainSuccess<Profile>(data: ui);
    } catch (e) {
      yield DomainFail();
    }
  }

  ProfileRepositoryImpl({
    required ProfileNetworkDataSource networkDataSource,
    required ProfileMapper profileMapper,
  })  : _networkDataSource = networkDataSource,
        _profileMapper = profileMapper;
}
