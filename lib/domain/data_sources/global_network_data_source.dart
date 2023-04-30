import '../models/network/profile_response.dart';

abstract class GlobalNetworkDataSource {
  Future<List<UserResponse>> getTopUsers();
}
