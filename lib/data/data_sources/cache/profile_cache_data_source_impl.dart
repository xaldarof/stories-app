import 'package:encrypt_shared_preferences/provider.dart';
import 'package:jokes_app/domain/data_sources/cache/profile_cache_data_source.dart';

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
