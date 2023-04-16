import 'package:encrypt_shared_preferences/enc_shared_pref.dart';
import 'package:jokes_app/common/resource/keys.dart';
import 'package:jokes_app/domain/data_sources/auth_network_data_source.dart';
import 'package:jokes_app/domain/models/common/domain_result.dart';
import 'package:jokes_app/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthNetworkDataSource _networkDataSource;
  final EncryptedSharedPreferences _preferences;

  @override
  Stream<DomainResult> login(String username, String password) async* {
    try {
      yield DomainLoading();
      final res = await _networkDataSource.login(username, password);
      _preferences.setString(Keys.token, res.access);

      yield DomainSuccess();
    } catch (e) {
      yield DomainFail();
    }
  }

  @override
  Stream<DomainResult> register(String username, String password) async* {
    try {
      yield DomainLoading();
      final res = await _networkDataSource.register(username, password);
      _preferences.setString(Keys.token, res.access);

      yield DomainSuccess();
    } catch (e) {
      yield DomainFail();
    }
  }

  AuthRepositoryImpl({
    required AuthNetworkDataSource networkDataSource,
    required EncryptedSharedPreferences preferences,
  })  : _networkDataSource = networkDataSource,
        _preferences = preferences;
}
