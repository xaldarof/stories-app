import '../models/common/domain_result.dart';

abstract class AuthRepository {
  Stream<DomainResult> login(String username, String password);

  Stream<DomainResult> register(String username, String password);
}
