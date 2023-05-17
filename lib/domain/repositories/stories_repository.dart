import '../models/common/domain_result.dart';
import '../models/ui/story.dart';

abstract class StoriesRepository {
  Stream<List<Story>> getStories(int categoryId);

  Future<void> clearStoriesCache();

  Stream<DomainResult> loadStories(int? categoryId, int page);

  Stream<DomainResult> getCategories();

  Future<void> setAsRead(int storyId);
}
