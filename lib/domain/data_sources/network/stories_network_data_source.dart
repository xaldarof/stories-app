import 'package:jokes_app/domain/models/network/story_response.dart';

import '../../models/network/category_response.dart';

abstract class StoriesNetworkDataSource {
  Future<List<StoryResponse>?> getStories(int? categoryId, int page);

  Future<List<CategoryResponse>?> getCategories();

  Future<void> setAsRead(int storyId);
}
