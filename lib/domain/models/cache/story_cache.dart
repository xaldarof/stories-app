import 'package:drift/drift.dart';

@DataClassName('StoryCache')
class StoryCacheTable extends Table {
  IntColumn get id => integer()();

  TextColumn get body => text()();

  Column<DateTime> get timeCreate => dateTime()();

  IntColumn get categoryId => integer()();

  IntColumn get authorId => integer()();

  TextColumn get authorName => text()();

  TextColumn get title => text()();

  IntColumn get viewCount => integer()();

  BoolColumn get isPremium => boolean()();

  BoolColumn get isFrozen => boolean()();

  BoolColumn get isOwner => boolean()();

  BoolColumn get isPublished => boolean()();

  @override
  Set<Column<Object>>? get primaryKey => {
        id,
      };
}
