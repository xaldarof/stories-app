import '../models/network/profile_response.dart';

abstract class ProfileNetworkDataSource {
  Future<ProfileResponse> getProfile();
}
