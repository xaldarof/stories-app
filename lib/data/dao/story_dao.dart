import 'package:drift/drift.dart';
import 'package:jokes_app/common/utils/printer.dart';
import 'package:jokes_app/data/database/app_database.dart';
import 'package:jokes_app/domain/models/cache/story_cache.dart';

part 'story_dao.g.dart';

@DriftAccessor(tables: [
  StoryCacheTable,
])
class StoryDao extends DatabaseAccessor<AppDatabase> with _$StoryDaoMixin {
  StoryDao(super.attachedDatabase);

  Future<List<StoryCache>> getStories(int categoryId) {
    printMessage("Dao id : $categoryId");
    return (select(storyCacheTable)
          ..where((tbl) => tbl.categoryId.equals(categoryId)))
        .get();
  }

  Future<void> insertStories(List<StoryCache> stories) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(storyCacheTable, stories);
    });
  }

  Future<int> clearStories(int categoryId) async {
    return await (delete(storyCacheTable)
          ..where((tbl) => tbl.categoryId.equals(categoryId)))
        .go();
  }
}
