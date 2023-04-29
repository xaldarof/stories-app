import 'package:jokes_app/domain/mappers/base_mapper.dart';
import 'package:jokes_app/domain/models/network/story_quote_response.dart';
import 'package:jokes_app/domain/models/ui/story_quote.dart';

class StoryQuoteMapper extends Mapper<StoryQuoteResponse, StoryQuote> {
  @override
  StoryQuote map(StoryQuoteResponse data) {
    return StoryQuote(
      timeCreate: data.timeCreate,
      body: data.body,
      username: data.author.username,
      userId: data.author.id,
      isOwner: data.isOwner,
    );
  }
}
