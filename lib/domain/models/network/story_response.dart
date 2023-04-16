import 'package:json_annotation/json_annotation.dart';

part 'story_response.g.dart';

@JsonSerializable()
class StoryResponse {
  final int id;
  final String body;
  final String timeCreate;
  final int categoryId;
  final StoryAuthorResponse author;
  final String title;

  const StoryResponse({
    required this.id,
    required this.body,
    required this.timeCreate,
    required this.categoryId,
    required this.author,
    required this.title,
  });

  factory StoryResponse.fromJson(Map<String, dynamic> json) =>
      _$StoryResponseFromJson(json);
}

@JsonSerializable()
class StoryAuthorResponse {
  final String username;
  final int userid;

  const StoryAuthorResponse({
    required this.username,
    required this.userid,
  });

  factory StoryAuthorResponse.fromJson(Map<String, dynamic> json) =>
      _$StoryAuthorResponseFromJson(json);
}
