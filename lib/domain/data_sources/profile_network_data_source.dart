import 'package:jokes_app/domain/models/network/notification_response.dart';

import '../models/network/category_response.dart';
import '../models/network/profile_response.dart';
import '../models/network/profile_stats_response.dart';
import '../models/network/story_response.dart';

abstract class ProfileNetworkDataSource {
  Future<UserResponse> getProfile();

  Future<ProfileStatsResponse> getStats();

  Future<List<StoryResponse>?> getStories(
      int userId, int? categoryId, int page);

  Future<List<CategoryResponse>?> getCategories();

  Future<void> setAsRead(int storyId);

  Future<List<NotificationResponse>> getNotifications();

  Future<bool> setNotificationRead(int notificationId);
}
