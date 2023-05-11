import 'dart:convert';

import 'package:jokes_app/data/api/api_client.dart';
import 'package:jokes_app/domain/data_sources/network/profile_network_data_source.dart';
import 'package:jokes_app/domain/models/network/notification_response.dart';
import 'package:jokes_app/domain/models/network/profile_response.dart';
import 'package:jokes_app/domain/models/network/profile_stats_response.dart';

import '../../../common/utils/printer.dart';
import '../../../domain/models/common/base_response.dart';
import '../../../domain/models/network/category_response.dart';
import '../../../domain/models/network/story_response.dart';

class ProfileNetworkDataSourceImpl extends ProfileNetworkDataSource {
  final DioClient _client;

  @override
  Future<UserResponse> getProfile() async {
    final response = await _client.get("api/profile/");
    final decoded = UserResponse.fromJson(jsonDecode(response.data));
    return decoded;
  }

  ProfileNetworkDataSourceImpl({
    required DioClient client,
  }) : _client = client;

  @override
  Future<ProfileStatsResponse> getStats() async {
    final response = await _client.get("api/v1/stories/stats");
    final decoded = ProfileStatsResponse.fromJson(jsonDecode(response.data));
    return decoded;
  }

  @override
  Future<List<StoryResponse>?> getStories(
      int userId, int? categoryId, int page) async {
    try {
      final response = await _client.get(
        "api/v1/stories/user",
        queryParameters: {
          "categoryId": categoryId,
          "page": page,
          "userId": userId,
        },
      );
      final decoded = BaseListResponse.fromJson(jsonDecode(response.data));
      final list = decoded.data.map((e) => StoryResponse.fromJson(e));
      return list.toList();
    } catch (e) {
      printMessage(e.toString());
      return null;
    }
  }

  @override
  Future<List<CategoryResponse>?> getCategories(int userId) async {
    try {
      final response = await _client.get(
        "api/v1/user/categories/",
        queryParameters: {
          "userId": userId,
        },
      );
      final decoded = BaseListResponse.fromJson(jsonDecode(response.data));
      final list = decoded.data.map((e) => CategoryResponse.fromJson(e));
      return list.toList();
    } catch (e) {
      printMessage(e.toString());
      return null;
    }
  }

  @override
  Future<void> setAsRead(int storyId) {
    return _client.post(
      "api/v1/story/views",
      data: {
        "story_id": storyId,
      },
    );
  }

  @override
  Future<List<NotificationResponse>> getNotifications() async {
    final response = await _client.get("api/v1/user/notification");
    final decoded = BaseListResponse.fromJson(jsonDecode(response.data));
    final list = decoded.data.map((e) => NotificationResponse.fromJson(e));
    return list.toList();
  }

  @override
  Future<bool> setNotificationRead(int notificationId) async {
    final response = await _client.post(
      "api/v1/user/notification",
      data: {
        "id": notificationId,
      },
    );
    return response.isSuccessful;
  }
}
