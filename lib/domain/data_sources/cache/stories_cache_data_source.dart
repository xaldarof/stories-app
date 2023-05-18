import '../../../data/database/app_database.dart';

abstract class StoriesCacheDataSource {
  Future<List<StoryCache>> getStories(int categoryId);

  Future<void> insertStory(List<StoryCache> stories);

  Future<void> clearStories(int categoryId);
}
