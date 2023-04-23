import 'package:encrypt_shared_preferences/enc_shared_pref.dart';
import 'package:jokes_app/domain/data_sources/profile_cache_data_source.dart';

class ProfileCacheDataSourceImpl extends ProfileCacheDataSource {
  final EncryptedSharedPreferences _preferences;

  @override
  Future<void> clearAllCache() {
    return _preferences.clear();
  }

  ProfileCacheDataSourceImpl({
    required EncryptedSharedPreferences preferences,
  }) : _preferences = preferences;
}
