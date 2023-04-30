import 'package:encrypt_shared_preferences/enc_shared_pref.dart';
import 'package:get_it/get_it.dart';
import 'package:jokes_app/core/session/manager/session_manager.dart';
import 'package:jokes_app/core/session/manager/session_manager_impl.dart';
import 'package:jokes_app/data/api/api_client.dart';
import 'package:jokes_app/data/data_sources/auth_network_data_source_impl.dart';
import 'package:jokes_app/data/data_sources/global_network_data_source_impl.dart';
import 'package:jokes_app/data/data_sources/profile_cache_data_source_impl.dart';
import 'package:jokes_app/data/data_sources/profile_network_data_source_impl.dart';
import 'package:jokes_app/data/data_sources/publish_network_data_source_impl.dart';
import 'package:jokes_app/data/data_sources/stories_network_data_source_impl.dart';
import 'package:jokes_app/data/data_sources/view_story_network_data_source_impl.dart';
import 'package:jokes_app/data/repositories/auth_repository_impl.dart';
import 'package:jokes_app/data/repositories/global_repository_impl.dart';
import 'package:jokes_app/data/repositories/profile_repository_impl.dart';
import 'package:jokes_app/data/repositories/publish_repository_impl.dart';
import 'package:jokes_app/data/repositories/stories_repository_impl.dart';
import 'package:jokes_app/data/repositories/view_story_repository_impl.dart';
import 'package:jokes_app/domain/data_sources/auth_network_data_source.dart';
import 'package:jokes_app/domain/data_sources/global_network_data_source.dart';
import 'package:jokes_app/domain/data_sources/profile_cache_data_source.dart';
import 'package:jokes_app/domain/data_sources/profile_network_data_source.dart';
import 'package:jokes_app/domain/data_sources/publish_network_data_source.dart';
import 'package:jokes_app/domain/data_sources/story_quotes_network_data_source.dart';
import 'package:jokes_app/domain/data_sources/view_story_network_data_source.dart';
import 'package:jokes_app/domain/mappers/category_mapper.dart';
import 'package:jokes_app/domain/mappers/profile_mapper.dart';
import 'package:jokes_app/domain/mappers/profile_stats_mapper.dart';
import 'package:jokes_app/domain/mappers/story_mapper.dart';
import 'package:jokes_app/domain/mappers/story_quote_mapper.dart';
import 'package:jokes_app/domain/repositories/auth_repository.dart';
import 'package:jokes_app/domain/repositories/global_repository.dart';
import 'package:jokes_app/domain/repositories/main_repository.dart';
import 'package:jokes_app/domain/repositories/profile_repository.dart';
import 'package:jokes_app/domain/repositories/publish_repository.dart';
import 'package:jokes_app/domain/repositories/story_quotes_repository.dart';
import 'package:jokes_app/domain/repositories/view_story_repository.dart';

import '../data/data_sources/main_data_source_impl.dart';
import '../data/data_sources/story_quotes_network_data_source_impl.dart';
import '../data/repositories/main_repository_impl.dart';
import '../data/repositories/story_quotes_repository_impl.dart';
import '../domain/data_sources/main_data_source.dart';
import '../domain/data_sources/stories_network_data_source.dart';
import '../domain/repositories/stories_repository.dart';

final injector = GetIt.instance;

Future<void> setUpDependencies() async {
  injector.registerSingleton<EncryptedSharedPreferences>(
      await EncryptedSharedPreferences.getInstance());
  injector.registerSingleton<SessionManager>(
      SessionManagerImpl(preferences: injector.get()));
  injector.registerSingleton<AuthInterceptor>(
      AuthInterceptor(sessionManager: injector.get()));
  injector.registerSingleton<DioClient>(DioClient(injector.get()));

  _setUpDataSources();
  _setUpRepos();
}

void _setUpRepos() {
  injector.registerSingleton<StoriesRepository>(StoriesRepositoryImpl(
      networkDataSource: injector.get(),
      storyMapper: StoryMapper(),
      categoryMapper: CategoryMapper()));
  injector.registerSingleton<PublishRepository>(PublishRepositoryImpl(
      networkDataSource: injector.get(), categoryMapper: CategoryMapper()));
  injector.registerSingleton<AuthRepository>(AuthRepositoryImpl(
      networkDataSource: injector.get(), preferences: injector.get()));
  injector.registerSingleton<MainRepository>(MainRepositoryImpl(
      dataSource: injector.get(), preferences: injector.get()));
  injector.registerSingleton<ViewStoryRepository>(
      ViewStoryRepositoryImpl(networkDataSource: injector.get()));
  injector.registerSingleton<StoryQuotesRepository>(StoryQuotesRepositoryImpl(
      networkDataSource: injector.get(), storyQuoteMapper: StoryQuoteMapper()));
  injector.registerSingleton<ProfileRepository>(ProfileRepositoryImpl(
      networkDataSource: injector.get(),
      profileMapper: UserMapper(),
      profileStatsMapper: ProfileStatsMapper(),
      storyMapper: StoryMapper(),
      categoryMapper: CategoryMapper(),
      cacheDataSource: injector.get()));
  injector.registerSingleton<GlobalRepository>(GlobalRepositoryImpl(
      networkDataSource: injector.get(), userMapper: UserMapper()));
}

void _setUpDataSources() {
  injector.registerSingleton<StoriesNetworkDataSource>(
      StoriesNetworkDataSourceImpl(client: injector.get()));
  injector.registerSingleton<PublishNetworkDataSource>(
      PublishNetworkDataSourceImpl(client: injector.get()));
  injector.registerSingleton<AuthNetworkDataSource>(
      AuthNetworkDataSourceImpl(client: injector.get()));
  injector.registerSingleton<MainDataSource>(
      MainDataSourceImpl(preferences: injector.get()));
  injector.registerSingleton<ProfileNetworkDataSource>(
      ProfileNetworkDataSourceImpl(client: injector.get()));
  injector.registerSingleton<ViewStoryNetworkDataSource>(
      ViewStoryNetworkDataSourceImpl(client: injector.get()));
  injector.registerSingleton<ProfileCacheDataSource>(
      ProfileCacheDataSourceImpl(preferences: injector.get()));
  injector.registerSingleton<StoryQuotesNetworkDataSource>(
      StoryQuotesNetworkDataSourceImpl(client: injector.get()));
  injector.registerSingleton<GlobalNetworkDataSource>(
      GlobalNetworkDataSourceImpl(client: injector.get()));
}
