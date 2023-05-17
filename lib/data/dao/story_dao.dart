import 'package:drift/drift.dart';
import 'package:jokes_app/data/database/app_database.dart';
import 'package:jokes_app/domain/models/cache/story_cache.dart';

part 'story_dao.g.dart';

@DriftAccessor(tables: [
  StoryCacheTable,
])
class StoryDao extends DatabaseAccessor<AppDatabase> with _$StoryDaoMixin {
  StoryDao(super.attachedDatabase);

  Stream<List<StoryCache>> getStories(int categoryId) {
    return (select(storyCacheTable)
          ..where((tbl) => tbl.categoryId.equals(categoryId)))
        .watch();
  }

  Future<void> insertStories(List<StoryCache> stories) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(storyCacheTable, stories);
    });
  }

  Future<int> clearStories() async {
    return await delete(storyCacheTable).go();
  }
}
