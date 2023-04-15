import 'package:jokes_app/domain/data_sources/publish_network_data_source.dart';
import 'package:jokes_app/domain/models/common/domain_result.dart';
import 'package:jokes_app/domain/repositories/publish_repository.dart';

class PublishRepositoryImpl extends PublishRepository {
  final PublishNetworkDataSource _networkDataSource;

  @override
  Stream<DomainResult> publishStory(String body, String title) async* {
    try {
      yield DomainLoading();
      final res = await _networkDataSource.publishStory(body, title);

      if (res) {
        yield DomainSuccess();
      } else {
        yield DomainFail();
      }
    } catch (e) {
      yield DomainFail();
    }
  }

  PublishRepositoryImpl({
    required PublishNetworkDataSource networkDataSource,
  }) : _networkDataSource = networkDataSource;
}
