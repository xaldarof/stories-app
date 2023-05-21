import 'package:drift/drift.dart';


@DataClassName('StoryCategoryCache')
class StoryCategoryCacheTable extends Table {
  IntColumn get id => integer()();

  IntColumn get count => integer()();

  TextColumn get name => text()();

  @override
  Set<Column<Object>>? get primaryKey => {
        id,
      };
}
