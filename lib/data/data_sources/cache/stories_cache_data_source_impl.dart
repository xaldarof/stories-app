import 'package:jokes_app/data/dao/story_category_dao.dart';
import 'package:jokes_app/data/dao/story_dao.dart';
import 'package:jokes_app/data/database/app_database.dart';

import '../../../domain/data_sources/cache/stories_cache_data_source.dart';

class StoriesCacheDataSourceImpl extends StoriesCacheDataSource {
  final StoryDao _storyDao;
  final StoryCategoryDao _storyCategoryDao;

  @override
  Future<List<StoryCache>> getStories(int categoryId) {
    return _storyDao.getStories(categoryId);
  }

  @override
  Future<void> clearStories(int categoryId) {
    return _storyDao.clearStories(categoryId);
  }

  @override
  Future<void> insertStory(List<StoryCache> stories) {
    return _storyDao.insertStories(stories);
  }

  @override
  Future<void> clearCategories() {
    return _storyCategoryDao.clearCategories();
  }

  StoriesCacheDataSourceImpl({
    required StoryDao storyDao,
    required StoryCategoryDao storyCategoryDao,
  })  : _storyDao = storyDao,
        _storyCategoryDao = storyCategoryDao;

  @override
  Future<void> insertCategories(List<StoryCategoryCache> mapped) {
    return _storyCategoryDao.insertCategories(mapped);
  }
}
