import 'package:jokes_app/common/utils/printer.dart';
import 'package:jokes_app/domain/data_sources/cache/stories_cache_data_source.dart';
import 'package:jokes_app/domain/data_sources/network/stories_network_data_source.dart';
import 'package:jokes_app/domain/models/common/domain_result.dart';
import 'package:jokes_app/domain/models/ui/category.dart';
import 'package:jokes_app/domain/models/ui/story.dart';
import 'package:jokes_app/domain/repositories/stories_repository.dart';

import '../../domain/mappers/category_mapper.dart';
import '../../domain/mappers/story_mapper.dart';

class StoriesRepositoryImpl extends StoriesRepository {
  final StoriesNetworkDataSource _networkDataSource;
  final StoriesCacheDataSource _cacheDataSource;
  final StoryResponseToUiMapper _storyMapper;
  final CategoryMapper _categoryMapper;
  final StoryResponseToCacheMapper _storyResponseToCacheMapper;
  final StoryCacheToUiMapper _storyCacheToUiMapper;
  bool initialLoad = true;

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
  Stream<List<Story>> getStories(int categoryId) {
    return _cacheDataSource.getStories(categoryId).map(
        (event) => event.map((e) => _storyCacheToUiMapper.map(e)).toList());
  }

  @override
  Stream<DomainResult> loadStories(int? categoryId, int page) async* {
    try {
      yield DomainLoading();
      final res = await _networkDataSource.getStories(categoryId, page);
      if (res != null) {
        final mapped =
            res.map((e) => _storyResponseToCacheMapper.map(e)).toList();
        if(initialLoad) {
          initialLoad = false;
          await _cacheDataSource.clearStories();
        }
        await _cacheDataSource.insertStory(mapped);
        yield DomainSuccess<int>(data: mapped.length);
      }
    } catch (e) {
      printMessage("Error ${e.toString()}");
      yield DomainFail();
    }
  }

  @override
  Future<void> setAsRead(int storyId) async {
    try {
      _networkDataSource.setAsRead(storyId);
    } catch (e) {
      //
    }
  }

  StoriesRepositoryImpl({
    required StoriesNetworkDataSource networkDataSource,
    required StoriesCacheDataSource cacheDataSource,
    required StoryResponseToUiMapper storyMapper,
    required CategoryMapper categoryMapper,
    required StoryResponseToCacheMapper storyResponseToCacheMapper,
    required StoryCacheToUiMapper storyCacheToUiMapper,
  })  : _networkDataSource = networkDataSource,
        _cacheDataSource = cacheDataSource,
        _storyMapper = storyMapper,
        _categoryMapper = categoryMapper,
        _storyResponseToCacheMapper = storyResponseToCacheMapper,
        _storyCacheToUiMapper = storyCacheToUiMapper;

  @override
  Future<void> clearStoriesCache() {
    return _cacheDataSource.clearStories();
  }
}
