import '../models/common/domain_result.dart';
import '../models/ui/story.dart';

abstract class StoriesRepository {
  Future<List<Story>> getStories(int categoryId);


  Stream<DomainResult> loadStories(int categoryId, int page);

  Stream<DomainResult> getCategories();

  Future<void> setAsRead(int storyId);
}
