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
  String? get accessToken => "Bearer ${_preferences.getString(Keys.token)}";
}
