import '../models/network/category_response.dart';
import '../models/network/profile_response.dart';
import '../models/network/profile_stats_response.dart';
import '../models/network/story_response.dart';

abstract class ProfileNetworkDataSource {
  Future<ProfileResponse> getProfile();

  Future<ProfileStatsResponse> getStats();

  Future<List<StoryResponse>?> getStories(int? categoryId, int page);

  Future<List<CategoryResponse>?> getCategories();
}
