import 'package:json_annotation/json_annotation.dart';

part 'profile_stats_response.g.dart';

@JsonSerializable()
class ProfileStatsResponse {
  final int readStoriesCount;
  final int storyCount;
  final int viewReachCount;
  final int unreadNotificationCount;

  const ProfileStatsResponse({
    required this.readStoriesCount,
    required this.storyCount,
    required this.viewReachCount,
    required this.unreadNotificationCount,
  });

  factory ProfileStatsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileStatsResponseFromJson(json);
}
