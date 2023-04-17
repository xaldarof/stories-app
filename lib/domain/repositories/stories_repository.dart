import '../models/common/domain_result.dart';

abstract class StoriesRepository {
  Stream<DomainResult> getStories(int? categoryId, int page);

  Stream<DomainResult> getCategories();

  Future<void> setAsRead(int storyId);
}
