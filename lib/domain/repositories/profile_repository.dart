import '../models/common/domain_result.dart';

abstract class ProfileRepository {
  Stream<DomainResult> getProfile();

  Stream<DomainResult> getStats();

  Stream<DomainResult> getStories(int userId, int? categoryId, int page);

  Stream<DomainResult> getCategories();

  Future<void> setAsRead(int storyId);

  Stream<DomainResult> setNotificationRead(int notificationId);

  Future<void> logout();

  Stream<DomainResult> getNotifications();
}
