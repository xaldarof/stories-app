// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryResponse _$StoryResponseFromJson(Map<String, dynamic> json) =>
    StoryResponse(
      id: json['id'] as int,
      body: json['body'] as String,
      timeCreate: json['timeCreate'] as String,
      categoryId: json['categoryId'] as int,
      author:
          StoryAuthorResponse.fromJson(json['author'] as Map<String, dynamic>),
      title: json['title'] as String,
      viewCount: json['viewCount'] as int,
      isFrozen: json['isFrozen'] as bool,
      isPremium: json['isPremium'] as bool,
      isOwner: json['isOwner'] as bool,
    );

Map<String, dynamic> _$StoryResponseToJson(StoryResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'body': instance.body,
      'timeCreate': instance.timeCreate,
      'categoryId': instance.categoryId,
      'author': instance.author,
      'title': instance.title,
      'viewCount': instance.viewCount,
    };

StoryAuthorResponse _$StoryAuthorResponseFromJson(Map<String, dynamic> json) =>
    StoryAuthorResponse(
      username: json['username'] as String,
      userid: json['userid'] as int,
    );

Map<String, dynamic> _$StoryAuthorResponseToJson(
        StoryAuthorResponse instance) =>
    <String, dynamic>{
      'username': instance.username,
      'userid': instance.userid,
    };
