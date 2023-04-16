import 'dart:convert';

import 'package:jokes_app/data/api/api_client.dart';
import 'package:jokes_app/domain/data_sources/auth_network_data_source.dart';
import 'package:jokes_app/domain/models/network/auth_response.dart';

class AuthNetworkDataSourceImpl extends AuthNetworkDataSource {
  final DioClient _client;

  @override
  Future<AuthResponse> login(String username, String password) async {
    final response = await _client.post(
      "api/token/",
      data: {
        "username": username,
        "password": password,
      },
    );
    final decoded = AuthResponse.fromJson(jsonDecode(response.data));
    return decoded;
  }

  @override
  Future<AuthResponse> register(String username, String password) async {
    final response = await _client.post(
      "api/register/",
      data: {
        "username": username,
        "password": password,
      },
    );
    final decoded = AuthResponse.fromJson(jsonDecode(response.data));
    return decoded;
  }

  AuthNetworkDataSourceImpl({
    required DioClient client,
  }) : _client = client;
}
