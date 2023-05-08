import 'package:encrypt_shared_preferences/enc_shared_pref.dart';
import 'package:jokes_app/common/resource/keys.dart';
import 'package:jokes_app/data/api/api_client.dart';
import 'package:jokes_app/domain/data_sources/main_data_source.dart';

class MainDataSourceImpl extends MainDataSource {
  final EncryptedSharedPreferences _preferences;

  @override
  Stream<String> getToken() => _preferences.stream;

  MainDataSourceImpl({
    required EncryptedSharedPreferences preferences,
  }) : _preferences = preferences;
}
