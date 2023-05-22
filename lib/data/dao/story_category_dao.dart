import 'package:drift/drift.dart';
import 'package:jokes_app/data/database/app_database.dart';

import '../../domain/models/cache/story_category_cache.dart';

part 'story_category_dao.g.dart';

@DriftAccessor(
  tables: [
    StoryCategoryCacheTable,
  ],
)
class StoryCategoryDao extends DatabaseAccessor<AppDatabase>
    with _$StoryCategoryDaoMixin {
  StoryCategoryDao(super.attachedDatabase);

  Future<List<StoryCategoryCache>> getCategories() {
    return select(storyCategoryCacheTable).get();
  }

  Future<void> insertCategories(List<StoryCategoryCache> categories) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(storyCategoryCacheTable, categories);
    });
  }

  Future<int> clearCategories() async {
    return await delete(storyCategoryCacheTable).go();
  }
}
