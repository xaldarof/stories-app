import 'dart:convert';

import 'package:jokes_app/common/utils/printer.dart';
import 'package:jokes_app/domain/data_sources/stories_network_data_source.dart';
import 'package:jokes_app/domain/models/common/base_response.dart';
import 'package:jokes_app/domain/models/network/category_response.dart';
import 'package:jokes_app/domain/models/network/story_response.dart';

import '../api/api_client.dart';

class StoriesNetworkDataSourceImpl extends StoriesNetworkDataSource {
  final DioClient _client;

  @override
  Future<List<StoryResponse>?> getStories(int? categoryId, int page) async {
    try {
      final response = await _client.get(
        "api/v1/stories",
        queryParameters: {
          "categoryId": categoryId,
          "page": page,
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

  StoriesNetworkDataSourceImpl({
    required DioClient client,
  }) : _client = client;

  @override
  Future<List<CategoryResponse>?> getCategories() async {
    try {
      final response = await _client.get("api/v1/categories");
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
      data: {"story_id": storyId},
    );
  }
}
