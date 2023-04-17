import 'dart:convert';

import 'package:jokes_app/data/api/api_client.dart';
import 'package:jokes_app/domain/data_sources/profile_network_data_source.dart';
import 'package:jokes_app/domain/models/network/profile_response.dart';
import 'package:jokes_app/domain/models/network/profile_stats_response.dart';

class ProfileNetworkDataSourceImpl extends ProfileNetworkDataSource {
  final DioClient _client;

  @override
  Future<ProfileResponse> getProfile() async {
    final response = await _client.get("api/profile/");
    final decoded = ProfileResponse.fromJson(jsonDecode(response.data));
    return decoded;
  }

  ProfileNetworkDataSourceImpl({
    required DioClient client,
  }) : _client = client;

  @override
  Future<ProfileStatsResponse> getStats() async {
    final response = await _client.get("api/v1/stories/stats");
    final decoded = ProfileStatsResponse.fromJson(jsonDecode(response.data));
    return decoded;
  }
}
