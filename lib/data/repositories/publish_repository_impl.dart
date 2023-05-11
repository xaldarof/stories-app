import 'package:jokes_app/domain/data_sources/network/publish_network_data_source.dart';
import 'package:jokes_app/domain/models/common/domain_result.dart';
import 'package:jokes_app/domain/repositories/publish_repository.dart';

import '../../domain/mappers/category_mapper.dart';
import '../../domain/models/ui/category.dart';

class PublishRepositoryImpl extends PublishRepository {
  final PublishNetworkDataSource _networkDataSource;
  final CategoryMapper _categoryMapper;

  @override
  Stream<DomainResult> publishStory(
      String body, String title, int categoryId) async* {
    try {
      yield DomainLoading();
      final res =
          await _networkDataSource.publishStory(body, title, categoryId);

      if (res) {
        yield DomainSuccess();
      } else {
        yield DomainFail();
      }
    } catch (e) {
      yield DomainFail();
    }
  }

  @override
  Stream<DomainResult> getCategories() async* {
    try {
      yield DomainLoading();
      final res = await _networkDataSource.getCategories();
      if (res != null) {
        final mapped = res.map((e) => _categoryMapper.map(e));
        yield DomainSuccess<List<Category>>(data: mapped.toList());
      }
    } catch (e) {
      yield DomainFail();
    }
  }

  PublishRepositoryImpl({
    required PublishNetworkDataSource networkDataSource,
    required CategoryMapper categoryMapper,
  })  : _networkDataSource = networkDataSource,
        _categoryMapper = categoryMapper;
}
