import 'package:jokes_app/domain/mappers/base_mapper.dart';
import 'package:jokes_app/domain/models/network/profile_stats_response.dart';
import 'package:jokes_app/domain/models/ui/profile_stats.dart';

class ProfileStatsMapper extends Mapper<ProfileStatsResponse, ProfileStats> {
  @override
  ProfileStats map(ProfileStatsResponse data) {
    return ProfileStats(
        readStoriesCount: data.readStoriesCount,
        storyCount: data.storyCount,
        unreadNotificationCount: data.unreadNotificationCount,
        viewReachCount: data.viewReachCount);
  }
}
