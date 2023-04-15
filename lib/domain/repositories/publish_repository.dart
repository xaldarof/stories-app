import '../models/common/domain_result.dart';

abstract class PublishRepository {
  Stream<DomainResult> publishStory(String body, String title);
}
