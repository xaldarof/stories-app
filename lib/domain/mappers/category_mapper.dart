import 'package:jokes_app/domain/mappers/base_mapper.dart';
import 'package:jokes_app/domain/models/network/category_response.dart';
import 'package:jokes_app/domain/models/ui/category.dart';

class CategoryMapper extends Mapper<CategoryResponse, Category> {
  @override
  Category map(CategoryResponse data) {
    return Category(id: data.id, name: "#${data.name}");
  }
}
