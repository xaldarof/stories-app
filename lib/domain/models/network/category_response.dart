import 'package:json_annotation/json_annotation.dart';

part 'category_response.g.dart';

@JsonSerializable()
class CategoryResponse {
  final int id;
  final String name;
  final int count;

  const CategoryResponse({
    required this.id,
    required this.name,
    required this.count,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);
}
