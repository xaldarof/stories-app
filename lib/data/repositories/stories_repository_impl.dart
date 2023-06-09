import 'package:jokes_app/domain/data_sources/network/stories_network_data_source.dart';
import 'package:jokes_app/domain/models/common/domain_result.dart';
import 'package:jokes_app/domain/models/ui/category.dart';
import 'package:jokes_app/domain/models/ui/story.dart';
import 'package:jokes_app/domain/repositories/stories_repository.dart';

import '../../domain/mappers/category_mapper.dart';
import '../../domain/mappers/story_mapper.dart';

class StoriesRepositoryImpl extends StoriesRepository {
  final StoriesNetworkDataSource _networkDataSource;
  final StoryResponseToUiMapper _storyMapper;
  final CategoryMapper _categoryMapper;

  @override
  Stream<DomainResult> getCategories() async* {
    try {
      yield DomainLoading();
      final res = await _networkDataSource.getCategories();
      if (res != null) {
        final mapped = res.map((e) => _categoryMapper.map(e));
        yield DomainSuccess<List<Category>>(data: mapped.toList());
      }
    } catch (e) {
      yield DomainFail();
    }
  }

  @override
  Stream<DomainResult> getStories(int? categoryId, int page) async* {
    try {
      yield DomainLoading();
      final res = await _networkDataSource.getStories(categoryId, page);
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
    required StoryResponseToUiMapper storyMapper,
    required CategoryMapper categoryMapper,
  })  : _networkDataSource = networkDataSource,
        _storyMapper = storyMapper,
        _categoryMapper = categoryMapper;

  @override
  Future<void> setAsRead(int storyId) async {
    try {
      _networkDataSource.setAsRead(storyId);
    } catch (e) {
      //
    }
  }
}
