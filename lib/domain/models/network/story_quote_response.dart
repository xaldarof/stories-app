import 'package:json_annotation/json_annotation.dart';

part 'story_quote_response.g.dart';

@JsonSerializable()
class StoryQuoteResponse {
  final int id;
  final int storyId;
  final String body;
  final StoryQuoteAuthorResponse author;
  final String timeCreate;
  final bool isOwner;

  const StoryQuoteResponse({
    required this.id,
    required this.storyId,
    required this.body,
    required this.timeCreate,
    required this.author,
    required this.isOwner,
  });

  factory StoryQuoteResponse.fromJson(Map<String, dynamic> json) =>
      _$StoryQuoteResponseFromJson(json);
}

@JsonSerializable()
class StoryQuoteAuthorResponse {
  final String username;
  final int id;

  const StoryQuoteAuthorResponse({
    required this.username,
    required this.id,
  });

  factory StoryQuoteAuthorResponse.fromJson(Map<String, dynamic> json) =>
      _$StoryQuoteAuthorResponseFromJson(json);
}
