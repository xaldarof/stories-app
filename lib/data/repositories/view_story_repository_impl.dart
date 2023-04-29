import 'package:jokes_app/domain/data_sources/view_story_network_data_source.dart';
import 'package:jokes_app/domain/models/common/domain_result.dart';
import 'package:jokes_app/domain/repositories/view_story_repository.dart';

class ViewStoryRepositoryImpl extends ViewStoryRepository {
  final ViewStoryNetworkDataSource _networkDataSource;

  @override
  Stream<DomainResult> unpublish(int storyId, bool state) async* {
    try {
      yield DomainLoading();
      final res = await _networkDataSource.unpublish(storyId, state);
      if (res) {
        yield DomainSuccess();
      } else {
        yield DomainFail();
      }
    } catch (e) {
      yield DomainFail();
    }
  }

  ViewStoryRepositoryImpl({
    required ViewStoryNetworkDataSource networkDataSource,
  }) : _networkDataSource = networkDataSource;

  @override
  Stream<DomainResult> createQuote(int storyId, String body) async* {
    try {
      yield DomainLoading();
      final res = await _networkDataSource.createQuote(storyId, body);
      if (res) {
        yield DomainSuccess();
      } else {
        yield DomainFail();
      }
    } catch (e) {
      yield DomainFail();
    }
  }
}
