import 'package:encrypt_shared_preferences/provider.dart';
import 'package:jokes_app/common/resource/keys.dart';
import 'package:jokes_app/domain/data_sources/cache/main_data_source.dart';
import 'package:jokes_app/domain/data_sources/network/main_network_data_source.dart';
import 'package:jokes_app/domain/models/common/app_state.dart';
import 'package:jokes_app/domain/repositories/main_repository.dart';

class MainRepositoryImpl extends MainRepository {
  final MainDataSource _dataSource;
  final MainNetworkDataSource _networkDataSource;
  final EncryptedSharedPreferences _preferences;

  @override
  Stream<AppState> getAppState() async* {
    yield* _dataSource.getToken().map((event) {
      final token = _preferences.getString(Keys.token);
      return token == null ? AppState.unAuthorized : AppState.logged;
    });
  }

  @override
  Future<bool> isAuthorized() async {
    return _preferences.getString(Keys.token) == null ? false : true;
  }

  @override
  Future<bool> refreshFCMToken(String token) async {
    try {
      final res = await _networkDataSource.refreshFCMToken(token);
      return res;
    } catch (e) {
      return false;
    }
  }

  MainRepositoryImpl({
    required MainDataSource dataSource,
    required MainNetworkDataSource networkDataSource,
    required EncryptedSharedPreferences preferences,
  })  : _dataSource = dataSource,
        _networkDataSource = networkDataSource,
        _preferences = preferences;
}
