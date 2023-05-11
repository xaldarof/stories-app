import 'package:jokes_app/domain/models/network/story_quote_response.dart';

abstract class StoryQuotesNetworkDataSource {
  Future<List<StoryQuoteResponse>> getQuotes(int storyId);

  Future<bool> createQuote(int storyId, String body);
}
