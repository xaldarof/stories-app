import 'dart:convert';

import 'package:jokes_app/data/api/api_client.dart';
import 'package:jokes_app/domain/data_sources/network/publish_network_data_source.dart';
import 'package:jokes_app/domain/models/network/category_response.dart';

import '../../../common/utils/printer.dart';
import '../../../domain/models/common/base_response.dart';

class PublishNetworkDataSourceImpl extends PublishNetworkDataSource {
  final DioClient _client;

  @override
  Future<bool> publishStory(String body, String title, int categoryId) async {
    final response = await _client.post(
      "api/v1/stories/",
      data: {
        "body": body,
        "title": title,
        "categoryId": categoryId,
      },
    );
    return response.isSuccessful;
  }

  PublishNetworkDataSourceImpl({
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
}
