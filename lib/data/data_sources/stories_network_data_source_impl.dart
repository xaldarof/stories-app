import 'dart:convert';

import 'package:jokes_app/domain/data_sources/stories_network_data_source.dart';
import 'package:jokes_app/domain/models/common/base_response.dart';
import 'package:jokes_app/domain/models/network/story_response.dart';

import '../api/api_client.dart';

class StoriesNetworkDataSourceImpl extends StoriesNetworkDataSource {
  final DioClient _client;

  @override
  Future<List<StoryResponse>?> getStories() async {
    try {
      final response = await _client.get("api/v1/stories");
      final decoded = BaseResponse<List<StoryResponse>>.fromJson(
          jsonDecode(response.data), (p0) => StoryResponse.fromJson(p0));
      return decoded.data;
    } catch (e) {
      return null;
    }
  }

  StoriesNetworkDataSourceImpl({
    required DioClient client,
  }) : _client = client;
}
