abstract class ViewStoryNetworkDataSource {
  Future<bool> unpublish(int storyId, bool state);

  Future<bool> createQuote(int storyId, String body);

  Future<bool> report(int storyId);
}
