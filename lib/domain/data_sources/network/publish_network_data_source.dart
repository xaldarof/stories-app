import '../../models/network/category_response.dart';

abstract class PublishNetworkDataSource {
  Future<bool> publishStory(String body, String title, int categoryId);

  Future<List<CategoryResponse>?> getCategories();
}
