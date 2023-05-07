import 'package:jokes_app/domain/data_sources/profile_cache_data_source.dart';
import 'package:jokes_app/domain/data_sources/profile_network_data_source.dart';
import 'package:jokes_app/domain/mappers/notification_mapper.dart';
import 'package:jokes_app/domain/mappers/profile_mapper.dart';
import 'package:jokes_app/domain/mappers/profile_stats_mapper.dart';
import 'package:jokes_app/domain/models/common/domain_result.dart';
import 'package:jokes_app/domain/models/ui/notification.dart';
import 'package:jokes_app/domain/models/ui/profile.dart';
import 'package:jokes_app/domain/models/ui/profile_stats.dart';
import 'package:jokes_app/domain/repositories/profile_repository.dart';

import '../../domain/mappers/category_mapper.dart';
import '../../domain/mappers/story_mapper.dart';
import '../../domain/models/ui/category.dart';
import '../../domain/models/ui/story.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileNetworkDataSource _networkDataSource;
  final ProfileCacheDataSource _cacheDataSource;
  final UserMapper _profileMapper;
  final ProfileStatsMapper _profileStatsMapper;
  final StoryMapper _storyMapper;
  final CategoryMapper _categoryMapper;
  final NotificationMapper _notificationMapper;

  @override
  Stream<DomainResult> getProfile() async* {
    try {
      yield DomainLoading();
      final res = await _networkDataSource.getProfile();
      final ui = _profileMapper.map(res);
      yield DomainSuccess<User>(data: ui);
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
  Stream<DomainResult> getStories(
      int userId, int? categoryId, int page) async* {
    try {
      yield DomainLoading();
      final res = await _networkDataSource.getStories(userId, categoryId, page);
      if (res != null) {
        final mapped = res.map((e) => _storyMapper.map(e));
        yield DomainSuccess<List<Story>>(data: mapped.toList());
      }
    } catch (e) {
      yield DomainFail();
    }
  }

  @override
  Stream<DomainResult> getCategories(int userId) async* {
    try {
      yield DomainLoading();
      final res = await _networkDataSource.getCategories(userId);
      if (res != null) {
        final mapped = res.map((e) => _categoryMapper.map(e));
        yield DomainSuccess<List<Category>>(data: mapped.toList());
      }
    } catch (e) {
      yield DomainFail();
    }
  }

  @override
  Future<void> setAsRead(int storyId) async {
    try {
      _networkDataSource.setAsRead(storyId);
    } catch (e) {
      //
    }
  }

  @override
  Future<void> logout() async {
    await _cacheDataSource.clearAllCache();
  }

  @override
  Stream<DomainResult> getNotifications() async* {
    try {
      yield DomainLoading();
      final res = await _networkDataSource.getNotifications();
      final ui = res.map((e) => _notificationMapper.map(e));
      yield DomainSuccess<List<UserNotification>>(data: ui.toList());
    } catch (e) {
      yield DomainFail();
    }
  }

  ProfileRepositoryImpl({
    required ProfileNetworkDataSource networkDataSource,
    required ProfileCacheDataSource cacheDataSource,
    required UserMapper profileMapper,
    required ProfileStatsMapper profileStatsMapper,
    required StoryMapper storyMapper,
    required CategoryMapper categoryMapper,
    required NotificationMapper notificationMapper,
  })  : _networkDataSource = networkDataSource,
        _cacheDataSource = cacheDataSource,
        _profileMapper = profileMapper,
        _profileStatsMapper = profileStatsMapper,
        _storyMapper = storyMapper,
        _categoryMapper = categoryMapper,
        _notificationMapper = notificationMapper;

  @override
  Stream<DomainResult> setNotificationRead(int notificationId) async* {
    try {
      yield DomainLoading();
      final res = await _networkDataSource.setNotificationRead(notificationId);
      if (res) {
        yield DomainSuccess();
      } else {
        yield DomainFail();
      }
    } catch (e) {
      yield DomainFail();
    }
  }
}
