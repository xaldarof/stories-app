import 'package:jokes_app/domain/mappers/profile_mapper.dart';
import 'package:jokes_app/domain/models/common/domain_result.dart';
import 'package:jokes_app/domain/models/ui/profile.dart';
import 'package:jokes_app/domain/repositories/global_repository.dart';

import '../../domain/data_sources/global_network_data_source.dart';

class GlobalRepositoryImpl extends GlobalRepository {
  final GlobalNetworkDataSource _networkDataSource;
  final UserMapper _userMapper;

  @override
  Stream<DomainResult> getTopUsers() async* {
    try {
      yield DomainLoading();
      final res = await _networkDataSource.getTopUsers();
      final ui = res.map((e) => _userMapper.map(e));
      yield DomainSuccess<List<User>>(data: ui.toList());
    } catch (e) {
      yield DomainFail();
    }
  }

  GlobalRepositoryImpl({
    required GlobalNetworkDataSource networkDataSource,
    required UserMapper userMapper,
  })  : _networkDataSource = networkDataSource,
        _userMapper = userMapper;
}
