// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_quote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryQuoteResponse _$StoryQuoteResponseFromJson(Map<String, dynamic> json) =>
    StoryQuoteResponse(
      id: json['id'] as int,
      storyId: json['storyId'] as int,
      body: json['body'] as String,
      timeCreate: json['timeCreate'] as String,
      author: StoryQuoteAuthorResponse.fromJson(
          json['author'] as Map<String, dynamic>),
      isOwner: json['isOwner'] as bool,
    );

Map<String, dynamic> _$StoryQuoteResponseToJson(StoryQuoteResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'storyId': instance.storyId,
      'body': instance.body,
      'author': instance.author,
      'timeCreate': instance.timeCreate,
      'isOwner': instance.isOwner,
    };

StoryQuoteAuthorResponse _$StoryQuoteAuthorResponseFromJson(
        Map<String, dynamic> json) =>
    StoryQuoteAuthorResponse(
      username: json['username'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$StoryQuoteAuthorResponseToJson(
        StoryQuoteAuthorResponse instance) =>
    <String, dynamic>{
      'username': instance.username,
      'id': instance.id,
    };
