import 'package:encrypt_shared_preferences/enc_shared_pref.dart';
import 'package:get_it/get_it.dart';
import 'package:jokes_app/data/api/api_client.dart';
import 'package:jokes_app/data/data_sources/stories_network_data_source_impl.dart';
import 'package:jokes_app/data/repositories/stories_repository_impl.dart';
import 'package:jokes_app/domain/mappers/category_mapper.dart';
import 'package:jokes_app/domain/mappers/story_mapper.dart';

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
}

void _setUpDataSources() {
  injector.registerSingleton<StoriesNetworkDataSource>(
      StoriesNetworkDataSourceImpl(client: injector.get()));
}
