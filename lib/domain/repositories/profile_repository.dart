import '../models/common/domain_result.dart';

abstract class ProfileRepository {
  Stream<DomainResult> getProfile();

  Stream<DomainResult> getStats();

  Stream<DomainResult> getStories(int? categoryId, int page);
  Stream<DomainResult> getCategories();
}
