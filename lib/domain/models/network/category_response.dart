import 'package:json_annotation/json_annotation.dart';

part 'category_response.g.dart';

@JsonSerializable()
class CategoryResponse {
  final int id;
  final String name;

  const CategoryResponse({
    required this.id,
    required this.name,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);
}
