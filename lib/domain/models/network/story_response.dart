import 'package:json_annotation/json_annotation.dart';

part 'story_response.g.dart';

@JsonSerializable()
class StoryResponse {
  final int id;
  final String body;
  @JsonKey(name: 'time_create')
  final String timeCreate;
  @JsonKey(name: 'category')
  final int categoryId;

  const StoryResponse({
    required this.id,
    required this.body,
    required this.timeCreate,
    required this.categoryId,
  });

  factory StoryResponse.fromJson(Map<String, dynamic> json) =>
      _$StoryResponseFromJson(json);
}
