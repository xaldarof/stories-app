import 'package:jokes_app/data/dao/story_dao.dart';
import 'package:jokes_app/data/database/app_database.dart';

import '../../../domain/data_sources/cache/stories_cache_data_source.dart';

class StoriesCacheDataSourceImpl extends StoriesCacheDataSource {
  final StoryDao _storyDao;

  @override
  Stream<List<StoryCache>> getStories(int categoryId) {
    return _storyDao.getStories(categoryId);
  }

  @override
  Future<void> clearStories() {
    return _storyDao.clearStories();
  }

  @override
  Future<void> insertStory(List<StoryCache> stories) {
    return _storyDao.insertStories(stories);
  }

  StoriesCacheDataSourceImpl({
    required StoryDao storyDao,
  }) : _storyDao = storyDao;
}
