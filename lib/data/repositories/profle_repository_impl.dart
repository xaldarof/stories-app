import 'package:jokes_app/domain/data_sources/profile_network_data_source.dart';
import 'package:jokes_app/domain/mappers/profile_mapper.dart';
import 'package:jokes_app/domain/mappers/profile_stats_mapper.dart';
import 'package:jokes_app/domain/models/common/domain_result.dart';
import 'package:jokes_app/domain/models/ui/profile.dart';
import 'package:jokes_app/domain/models/ui/profile_stats.dart';
import 'package:jokes_app/domain/repositories/profile_repository.dart';

import '../../domain/mappers/category_mapper.dart';
import '../../domain/mappers/story_mapper.dart';
import '../../domain/models/ui/category.dart';
import '../../domain/models/ui/story.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileNetworkDataSource _networkDataSource;
  final ProfileMapper _profileMapper;
  final ProfileStatsMapper _profileStatsMapper;
  final StoryMapper _storyMapper;
  final CategoryMapper _categoryMapper;

  @override
  Stream<DomainResult> getProfile() async* {
    try {
      yield DomainLoading();
      final res = await _networkDataSource.getProfile();
      final ui = _profileMapper.map(res);
      yield DomainSuccess<Profile>(data: ui);
    } catch (e) {
      yield DomainFail();
    }
  }

  @override
  Stream<DomainResult> getStats() async* {
    try {
      yield DomainLoading();
      final res = await _networkDataSource.getStats();
      final ui = _profileStatsMapper.map(res);
      yield DomainSuccess<ProfileStats>(data: ui);
    } catch (e) {
      yield DomainFail();
    }
  }

  @override
  Stream<DomainResult> getStories(int? categoryId, int page) async* {
    try {
      yield DomainLoading();
      final res = await _networkDataSource.getStories(categoryId, page);
      if (res != null) {
        final mapped = res.map((e) => _storyMapper.map(e));
        yield DomainSuccess<List<Story>>(data: mapped.toList());
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

  ProfileRepositoryImpl({
    required ProfileNetworkDataSource networkDataSource,
    required ProfileMapper profileMapper,
    required ProfileStatsMapper profileStatsMapper,
    required StoryMapper storyMapper,
    required CategoryMapper categoryMapper,
  })  : _networkDataSource = networkDataSource,
        _profileMapper = profileMapper,
        _profileStatsMapper = profileStatsMapper,
        _storyMapper = storyMapper,
        _categoryMapper = categoryMapper;
}