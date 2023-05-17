import '../../../data/database/app_database.dart';

abstract class StoriesCacheDataSource {
  Stream<List<StoryCache>> getStories(int categoryId);

  Future<void> insertStory(List<StoryCache> stories);

  Future<void> clearStories();
}
