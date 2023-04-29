import 'dart:convert';

import 'package:jokes_app/data/api/api_client.dart';
import 'package:jokes_app/domain/data_sources/story_quotes_network_data_source.dart';
import 'package:jokes_app/domain/models/common/base_response.dart';
import 'package:jokes_app/domain/models/network/story_quote_response.dart';

class StoryQuotesNetworkDataSourceImpl extends StoryQuotesNetworkDataSource {
  final DioClient _client;

  @override
  Future<bool> createQuote(int storyId, String body) async {
    final response = await _client.post(
      "api/v1/story/quotes",
      queryParameters: {
        "storyId": storyId,
        "body": body,
      },
    );
    return response.isSuccessful;
  }

  @override
  Future<List<StoryQuoteResponse>> getQuotes(int storyId) async {
    final response = await _client.get(
      "api/v1/story/quotes",
      queryParameters: {
        "storyId": storyId,
      },
    );
    final decoded = BaseListResponse.fromJson(jsonDecode(response.data));
    final list = decoded.data.map((e) => StoryQuoteResponse.fromJson(e));
    return list.toList();
  }

  StoryQuotesNetworkDataSourceImpl({
    required DioClient client,
  }) : _client = client;
}
