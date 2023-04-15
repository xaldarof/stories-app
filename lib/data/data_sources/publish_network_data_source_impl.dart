import 'package:jokes_app/data/api/api_client.dart';
import 'package:jokes_app/domain/data_sources/publish_network_data_source.dart';

class PublishNetworkDataSourceImpl extends PublishNetworkDataSource {
  final DioClient _client;

  @override
  Future<bool> publishStory(String body, String title) async {
    final response = await _client.post(
      "api/v1/stories/",
      data: {
        "body": body,
        "title": title,
        "categoryId": 1,
      },
    );
    return response.isSuccessful;
  }

  PublishNetworkDataSourceImpl({
    required DioClient client,
  }) : _client = client;
}
