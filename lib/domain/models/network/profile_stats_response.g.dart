// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_stats_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileStatsResponse _$ProfileStatsResponseFromJson(
        Map<String, dynamic> json) =>
    ProfileStatsResponse(
      readStoriesCount: json['readStoriesCount'] as int,
      storyCount: json['storyCount'] as int,
      viewReachCount: json['viewReachCount'] as int,
    );

Map<String, dynamic> _$ProfileStatsResponseToJson(
        ProfileStatsResponse instance) =>
    <String, dynamic>{
      'readStoriesCount': instance.readStoriesCount,
      'storyCount': instance.storyCount,
      'viewReachCount': instance.viewReachCount,
    };
