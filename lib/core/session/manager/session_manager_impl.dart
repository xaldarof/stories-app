import 'package:encrypt_shared_preferences/enc_shared_pref.dart';
import 'package:jokes_app/core/session/manager/session_manager.dart';

import '../../../common/resource/keys.dart';

class SessionManagerImpl extends SessionManager {
  final EncryptedSharedPreferences _preferences;

  SessionManagerImpl({
    required EncryptedSharedPreferences preferences,
  }) : _preferences = preferences;

  @override
  Future<void> endRemoteSession() async {
    //end remote session
  }

  @override
  Future<void> endLocalSession() async {
    await _preferences.clear();
  }

  @override
  String get authorization => "Authorization";

  @override
  int get timeout => 30000;

  @override
  bool validate(int code) {
    if (code >= 200 && code <= 400) {
      return true;
    } else {
      return false;
    }
  }

  @override
  String? get accessToken => _preferences.getString(Keys.token) != null
      ? "Bearer ${_preferences.getString(Keys.token)}"
      : null;
}
