import '../models/common/domain_result.dart';

abstract class PublishRepository {
  Stream<DomainResult> publishStory(String body, String title, int categoryId);

  Stream<DomainResult> getCategories();
}
