import '../models/network/auth_response.dart';

abstract class AuthNetworkDataSource {
  Future<AuthResponse> login(String username, String password, String fcmToken);

  Future<AuthResponse> register(
      String username, String password, String fcmToken);
}
