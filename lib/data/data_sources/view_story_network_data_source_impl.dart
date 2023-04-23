import 'package:jokes_app/data/api/api_client.dart';

import '../../domain/data_sources/view_story_network_data_source.dart';

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
}
