import '../models/common/domain_result.dart';

abstract class GlobalRepository {
  Stream<DomainResult> getTopUsers();
}
