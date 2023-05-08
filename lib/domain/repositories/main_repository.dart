import '../models/common/app_state.dart';

abstract class MainRepository {
  Stream<AppState> getAppState();

  Future<bool> isAuthorized();

  Future<bool> refreshFCMToken(String token);
}
