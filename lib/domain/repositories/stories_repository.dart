import '../models/common/domain_result.dart';

abstract class StoriesRepository {
  Stream<DomainResult> getStories();

  Stream<DomainResult> getCategories();
}
