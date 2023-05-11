import 'package:jokes_app/data/api/api_client.dart';

import '../../../domain/data_sources/network/view_story_network_data_source.dart';

class ViewStoryNetworkDataSourceImpl extends ViewStoryNetworkDataSource {
  final DioClient _client;

  @override
  Future<bool> unpublish(int storyId, bool state) async {
    final response = await _client.put(
      "api/v1/story/visible/$storyId",
      queryParameters: {
        "state": state == true ? 1 : 0,
      },
    );
    return response.isSuccessful;
  }

  ViewStoryNetworkDataSourceImpl({
    required DioClient client,
  }) : _client = client;

  @override
  Future<bool> createQuote(int storyId, String body) async {
    final response = await _client.post(
      "api/v1/story/quotes",
      data: {
        "storyId": storyId,
        "body": body,
      },
    );
    return response.isSuccessful;
  }

  @override
  Future<bool> report(int storyId) async {
    final res = await _client.post(
      "api/v1/stories/report",
      data: {
        "storyId": storyId,
      },
    );
    return res.isSuccessful;
  }
}
