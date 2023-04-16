import '../models/network/auth_response.dart';

abstract class AuthNetworkDataSource {
  Future<AuthResponse> login(String username, String password);

  Future<AuthResponse> register(String username, String password);
}
