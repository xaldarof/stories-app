// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryResponse _$StoryResponseFromJson(Map<String, dynamic> json) =>
    StoryResponse(
      id: json['id'] as int,
      body: json['body'] as String,
      timeCreate: json['time_create'] as String,
      categoryId: json['category'] as int,
    );

Map<String, dynamic> _$StoryResponseToJson(StoryResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'body': instance.body,
      'time_create': instance.timeCreate,
      'category': instance.categoryId,
    };
