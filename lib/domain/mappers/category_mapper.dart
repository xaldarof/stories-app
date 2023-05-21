import 'package:jokes_app/data/database/app_database.dart';
import 'package:jokes_app/domain/mappers/base_mapper.dart';
import 'package:jokes_app/domain/models/network/category_response.dart';
import 'package:jokes_app/domain/models/ui/category.dart';

class CategoryMapper extends Mapper<CategoryResponse, Category> {
  @override
  Category map(CategoryResponse data) {
    return Category(
      id: data.id,
      name: "#${data.name}(${data.count})",
      count: data.count,
    );
  }
}

class CategoryResponseToCacheMapper
    extends Mapper<CategoryResponse, StoryCategoryCache> {
  @override
  StoryCategoryCache map(CategoryResponse data) {
    return StoryCategoryCache(id: data.id, count: data.count, name: data.name);
  }
}

class CategoryCacheToUiMapper extends Mapper<StoryCategoryCache, Category> {
  @override
  Category map(StoryCategoryCache data) {
    return Category(id: data.id, name: data.name, count: data.count);
  }
}
