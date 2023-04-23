import 'package:jokes_app/data/api/api_client.dart';

import '../../domain/data_sources/view_story_network_data_source.dart';

class ViewStoryNetworkDataSourceImpl extends ViewStoryNetworkDataSource {
  final DioClient _client;

  @override
  Future<bool> unpublish(int storyId) async {
    final response = await _client.put("api/v1/story/unpublish/$storyId/");
    return response.isSuccessful;
  }

  ViewStoryNetworkDataSourceImpl({
    required DioClient client,
  }) : _client = client; //
}
