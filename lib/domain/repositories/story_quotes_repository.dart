abstract class StoryQuotesRepository {
  Stream getQuotes(int storyId);

  Stream createQuote(int storyId, String body);
}
