import 'package:encrypt_shared_preferences/enc_shared_pref.dart';
import 'package:jokes_app/common/resource/keys.dart';
import 'package:jokes_app/domain/data_sources/main_data_source.dart';
import 'package:jokes_app/domain/models/common/app_state.dart';
import 'package:jokes_app/domain/repositories/main_repository.dart';

class MainRepositoryImpl extends MainRepository {
  final MainDataSource _dataSource;
  final EncryptedSharedPreferences _preferences;

  @override
  Stream<AppState> getAppState() async* {
    yield* _dataSource.getToken().map((event) {
      final token = _preferences.getString(event);
      return token == null ? AppState.unAuthorized : AppState.logged;
    });
  }

  MainRepositoryImpl({
    required MainDataSource dataSource,
    required EncryptedSharedPreferences preferences,
  })  : _dataSource = dataSource,
        _preferences = preferences;

  @override
  Future<bool> isAuthorized() async {
    return _preferences.getString(Keys.token) == null ? false : true;
  }
}
