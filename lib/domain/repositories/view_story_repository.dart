import '../models/common/domain_result.dart';

abstract class ViewStoryRepository {
  Stream<DomainResult> unpublish(int storyId, bool state);

  Stream<DomainResult> createQuote(int storyId, String body);
}
