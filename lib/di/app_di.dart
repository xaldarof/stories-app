import 'package:encrypt_shared_preferences/enc_shared_pref.dart';
import 'package:get_it/get_it.dart';
import 'package:jokes_app/data/api/api_client.dart';
import 'package:jokes_app/data/data_sources/auth_network_data_source_impl.dart';
import 'package:jokes_app/data/data_sources/publish_network_data_source_impl.dart';
import 'package:jokes_app/data/data_sources/stories_network_data_source_impl.dart';
import 'package:jokes_app/data/repositories/auth_repository_impl.dart';
import 'package:jokes_app/data/repositories/publish_repository_impl.dart';
import 'package:jokes_app/data/repositories/stories_repository_impl.dart';
import 'package:jokes_app/domain/data_sources/auth_network_data_source.dart';
import 'package:jokes_app/domain/data_sources/publish_network_data_source.dart';
import 'package:jokes_app/domain/mappers/category_mapper.dart';
import 'package:jokes_app/domain/mappers/story_mapper.dart';
import 'package:jokes_app/domain/repositories/auth_repository.dart';
import 'package:jokes_app/domain/repositories/main_repository.dart';
import 'package:jokes_app/domain/repositories/publish_repository.dart';

import '../data/data_sources/main_data_source_impl.dart';
import '../data/repositories/main_repository_impl.dart';
import '../domain/data_sources/main_data_source.dart';
import '../domain/data_sources/stories_network_data_source.dart';
import '../domain/repositories/stories_repository.dart';

final injector = GetIt.instance;

Future<void> setUpDependencies() async {
  injector.registerSingleton<EncryptedSharedPreferences>(
      await EncryptedSharedPreferences.getInstance());
  injector.registerSingleton<DioClient>(DioClient());

  _setUpDataSources();
  _setUpRepos();
}

void _setUpRepos() {
  injector.registerSingleton<StoriesRepository>(StoriesRepositoryImpl(
      networkDataSource: injector.get(),
      storyMapper: StoryMapper(),
      categoryMapper: CategoryMapper()));
  injector.registerSingleton<PublishRepository>(
      PublishRepositoryImpl(networkDataSource: injector.get()));
  injector.registerSingleton<AuthRepository>(AuthRepositoryImpl(
      networkDataSource: injector.get(), preferences: injector.get()));
  injector.registerSingleton<MainRepository>(MainRepositoryImpl(
      dataSource: injector.get(), preferences: injector.get()));
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
}
