import 'package:jokes_app/domain/models/network/story_response.dart';

abstract class StoriesNetworkDataSource {
  Future<List<StoryResponse>?> getStories();
}
