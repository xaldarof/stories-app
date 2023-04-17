import '../models/network/profile_response.dart';
import '../models/network/profile_stats_response.dart';

abstract class ProfileNetworkDataSource {
  Future<ProfileResponse> getProfile();

  Future<ProfileStatsResponse> getStats();
}
