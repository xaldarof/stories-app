
import '../session.dart';

abstract class SessionManager extends Session {
  Future<void> endRemoteSession();

  Future<void> endLocalSession();
}
