import 'dart:convert';

import 'package:jokes_app/data/api/api_client.dart';
import 'package:jokes_app/domain/data_sources/network/global_network_data_source.dart';
import 'package:jokes_app/domain/models/common/base_response.dart';
import 'package:jokes_app/domain/models/network/profile_response.dart';

class GlobalNetworkDataSourceImpl extends GlobalNetworkDataSource {
  final DioClient _client;

  @override
  Future<List<UserResponse>> getTopUsers() async {
    final response = await _client.get("api/v1/users/topusers");
    final decoded = BaseListResponse.fromJson(jsonDecode(response.data));
    final list = decoded.data.map((e) => UserResponse.fromJson(e));
    return list.toList();
  }

  GlobalNetworkDataSourceImpl({
    required DioClient client,
  }) : _client = client;
}
