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
  final CategoryCacheToUiMapper _categoryCacheToUiMapper;
  final CategoryResponseToCacheMapper _categoryResponseToCacheMapper;

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
  Future<List<Story>> getStories(int categoryId) async {
    final res = await _cacheDataSource.getStories(categoryId);
    return res
        .toList()
        .map((event) => _storyCacheToUiMapper.map(event))
        .toList();
  }

  @override
  Stream<DomainResult> loadStories(int categoryId, int page) async* {
    try {
      yield DomainLoading();
      final res = await _networkDataSource.getStories(categoryId, page);
      if (res != null) {
        final mapped =
            res.map((e) => _storyResponseToCacheMapper.map(e)).toList();
        if (page == 1) {
          await _cacheDataSource.clearStories(categoryId);
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
  Stream<DomainResult> loadCategories() async* {
    try {
      yield DomainLoading();
      final res = await _networkDataSource.getCategories();
      if (res != null) {
        final mapped =
            res.map((e) => _categoryResponseToCacheMapper.map(e)).toList();
        await _cacheDataSource.clearCategories();
        await _cacheDataSource.insertCategories(mapped);
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
    required CategoryCacheToUiMapper categoryCacheToUiMapper,
    required CategoryResponseToCacheMapper categoryResponseToCacheMapper,
  })  : _networkDataSource = networkDataSource,
        _cacheDataSource = cacheDataSource,
        _storyMapper = storyMapper,
        _categoryMapper = categoryMapper,
        _storyResponseToCacheMapper = storyResponseToCacheMapper,
        _storyCacheToUiMapper = storyCacheToUiMapper,
        _categoryCacheToUiMapper = categoryCacheToUiMapper,
        _categoryResponseToCacheMapper = categoryResponseToCacheMapper;
}
