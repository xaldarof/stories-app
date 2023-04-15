import 'package:jokes_app/domain/data_sources/stories_network_data_source.dart';
import 'package:jokes_app/domain/models/common/domain_result.dart';
import 'package:jokes_app/domain/models/ui/story.dart';
import 'package:jokes_app/domain/repositories/stories_repository.dart';

import '../../domain/mappers/story_mapper.dart';

class StoriesRepositoryImpl extends StoriesRepository {
  final StoriesNetworkDataSource _networkDataSource;
  final StoryMapper _storyMapper;

  @override
  Stream<DomainResult> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

  @override
  Stream<DomainResult> getStories() async* {
    try {
      final res = await _networkDataSource.getStories();
      if (res != null) {
        final mapped = res.map((e) => _storyMapper.map(e));
        yield DomainSuccess<List<Story>>(data: mapped.toList());
      }
    } catch (e) {
      yield DomainFail();
    }
  }

  StoriesRepositoryImpl({
    required StoriesNetworkDataSource networkDataSource,
    required StoryMapper storyMapper,
  })  : _networkDataSource = networkDataSource,
        _storyMapper = storyMapper;
}
