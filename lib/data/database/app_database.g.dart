// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $StoryCacheTableTable extends StoryCacheTable
    with TableInfo<$StoryCacheTableTable, StoryCache> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StoryCacheTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
      'body', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timeCreateMeta =
      const VerificationMeta('timeCreate');
  @override
  late final GeneratedColumn<DateTime> timeCreate = GeneratedColumn<DateTime>(
      'time_create', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _authorIdMeta =
      const VerificationMeta('authorId');
  @override
  late final GeneratedColumn<int> authorId = GeneratedColumn<int>(
      'author_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _authorNameMeta =
      const VerificationMeta('authorName');
  @override
  late final GeneratedColumn<String> authorName = GeneratedColumn<String>(
      'author_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _viewCountMeta =
      const VerificationMeta('viewCount');
  @override
  late final GeneratedColumn<int> viewCount = GeneratedColumn<int>(
      'view_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isPremiumMeta =
      const VerificationMeta('isPremium');
  @override
  late final GeneratedColumn<bool> isPremium =
      GeneratedColumn<bool>('is_premium', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_premium" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _isFrozenMeta =
      const VerificationMeta('isFrozen');
  @override
  late final GeneratedColumn<bool> isFrozen =
      GeneratedColumn<bool>('is_frozen', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_frozen" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _isOwnerMeta =
      const VerificationMeta('isOwner');
  @override
  late final GeneratedColumn<bool> isOwner =
      GeneratedColumn<bool>('is_owner', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_owner" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _isPublishedMeta =
      const VerificationMeta('isPublished');
  @override
  late final GeneratedColumn<bool> isPublished =
      GeneratedColumn<bool>('is_published', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_published" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        body,
        timeCreate,
        categoryId,
        authorId,
        authorName,
        title,
        viewCount,
        isPremium,
        isFrozen,
        isOwner,
        isPublished
      ];
  @override
  String get aliasedName => _alias ?? 'story_cache_table';
  @override
  String get actualTableName => 'story_cache_table';
  @override
  VerificationContext validateIntegrity(Insertable<StoryCache> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body']!, _bodyMeta));
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('time_create')) {
      context.handle(
          _timeCreateMeta,
          timeCreate.isAcceptableOrUnknown(
              data['time_create']!, _timeCreateMeta));
    } else if (isInserting) {
      context.missing(_timeCreateMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('author_id')) {
      context.handle(_authorIdMeta,
          authorId.isAcceptableOrUnknown(data['author_id']!, _authorIdMeta));
    } else if (isInserting) {
      context.missing(_authorIdMeta);
    }
    if (data.containsKey('author_name')) {
      context.handle(
          _authorNameMeta,
          authorName.isAcceptableOrUnknown(
              data['author_name']!, _authorNameMeta));
    } else if (isInserting) {
      context.missing(_authorNameMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('view_count')) {
      context.handle(_viewCountMeta,
          viewCount.isAcceptableOrUnknown(data['view_count']!, _viewCountMeta));
    } else if (isInserting) {
      context.missing(_viewCountMeta);
    }
    if (data.containsKey('is_premium')) {
      context.handle(_isPremiumMeta,
          isPremium.isAcceptableOrUnknown(data['is_premium']!, _isPremiumMeta));
    } else if (isInserting) {
      context.missing(_isPremiumMeta);
    }
    if (data.containsKey('is_frozen')) {
      context.handle(_isFrozenMeta,
          isFrozen.isAcceptableOrUnknown(data['is_frozen']!, _isFrozenMeta));
    } else if (isInserting) {
      context.missing(_isFrozenMeta);
    }
    if (data.containsKey('is_owner')) {
      context.handle(_isOwnerMeta,
          isOwner.isAcceptableOrUnknown(data['is_owner']!, _isOwnerMeta));
    } else if (isInserting) {
      context.missing(_isOwnerMeta);
    }
    if (data.containsKey('is_published')) {
      context.handle(
          _isPublishedMeta,
          isPublished.isAcceptableOrUnknown(
              data['is_published']!, _isPublishedMeta));
    } else if (isInserting) {
      context.missing(_isPublishedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StoryCache map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StoryCache(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      body: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}body'])!,
      timeCreate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}time_create'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
      authorId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}author_id'])!,
      authorName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author_name'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      viewCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}view_count'])!,
      isPremium: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_premium'])!,
      isFrozen: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_frozen'])!,
      isOwner: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_owner'])!,
      isPublished: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_published'])!,
    );
  }

  @override
  $StoryCacheTableTable createAlias(String alias) {
    return $StoryCacheTableTable(attachedDatabase, alias);
  }
}

class StoryCache extends DataClass implements Insertable<StoryCache> {
  final int id;
  final String body;
  final DateTime timeCreate;
  final int categoryId;
  final int authorId;
  final String authorName;
  final String title;
  final int viewCount;
  final bool isPremium;
  final bool isFrozen;
  final bool isOwner;
  final bool isPublished;
  const StoryCache(
      {required this.id,
      required this.body,
      required this.timeCreate,
      required this.categoryId,
      required this.authorId,
      required this.authorName,
      required this.title,
      required this.viewCount,
      required this.isPremium,
      required this.isFrozen,
      required this.isOwner,
      required this.isPublished});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['body'] = Variable<String>(body);
    map['time_create'] = Variable<DateTime>(timeCreate);
    map['category_id'] = Variable<int>(categoryId);
    map['author_id'] = Variable<int>(authorId);
    map['author_name'] = Variable<String>(authorName);
    map['title'] = Variable<String>(title);
    map['view_count'] = Variable<int>(viewCount);
    map['is_premium'] = Variable<bool>(isPremium);
    map['is_frozen'] = Variable<bool>(isFrozen);
    map['is_owner'] = Variable<bool>(isOwner);
    map['is_published'] = Variable<bool>(isPublished);
    return map;
  }

  StoryCacheTableCompanion toCompanion(bool nullToAbsent) {
    return StoryCacheTableCompanion(
      id: Value(id),
      body: Value(body),
      timeCreate: Value(timeCreate),
      categoryId: Value(categoryId),
      authorId: Value(authorId),
      authorName: Value(authorName),
      title: Value(title),
      viewCount: Value(viewCount),
      isPremium: Value(isPremium),
      isFrozen: Value(isFrozen),
      isOwner: Value(isOwner),
      isPublished: Value(isPublished),
    );
  }

  factory StoryCache.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StoryCache(
      id: serializer.fromJson<int>(json['id']),
      body: serializer.fromJson<String>(json['body']),
      timeCreate: serializer.fromJson<DateTime>(json['timeCreate']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      authorId: serializer.fromJson<int>(json['authorId']),
      authorName: serializer.fromJson<String>(json['authorName']),
      title: serializer.fromJson<String>(json['title']),
      viewCount: serializer.fromJson<int>(json['viewCount']),
      isPremium: serializer.fromJson<bool>(json['isPremium']),
      isFrozen: serializer.fromJson<bool>(json['isFrozen']),
      isOwner: serializer.fromJson<bool>(json['isOwner']),
      isPublished: serializer.fromJson<bool>(json['isPublished']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'body': serializer.toJson<String>(body),
      'timeCreate': serializer.toJson<DateTime>(timeCreate),
      'categoryId': serializer.toJson<int>(categoryId),
      'authorId': serializer.toJson<int>(authorId),
      'authorName': serializer.toJson<String>(authorName),
      'title': serializer.toJson<String>(title),
      'viewCount': serializer.toJson<int>(viewCount),
      'isPremium': serializer.toJson<bool>(isPremium),
      'isFrozen': serializer.toJson<bool>(isFrozen),
      'isOwner': serializer.toJson<bool>(isOwner),
      'isPublished': serializer.toJson<bool>(isPublished),
    };
  }

  StoryCache copyWith(
          {int? id,
          String? body,
          DateTime? timeCreate,
          int? categoryId,
          int? authorId,
          String? authorName,
          String? title,
          int? viewCount,
          bool? isPremium,
          bool? isFrozen,
          bool? isOwner,
          bool? isPublished}) =>
      StoryCache(
        id: id ?? this.id,
        body: body ?? this.body,
        timeCreate: timeCreate ?? this.timeCreate,
        categoryId: categoryId ?? this.categoryId,
        authorId: authorId ?? this.authorId,
        authorName: authorName ?? this.authorName,
        title: title ?? this.title,
        viewCount: viewCount ?? this.viewCount,
        isPremium: isPremium ?? this.isPremium,
        isFrozen: isFrozen ?? this.isFrozen,
        isOwner: isOwner ?? this.isOwner,
        isPublished: isPublished ?? this.isPublished,
      );
  @override
  String toString() {
    return (StringBuffer('StoryCache(')
          ..write('id: $id, ')
          ..write('body: $body, ')
          ..write('timeCreate: $timeCreate, ')
          ..write('categoryId: $categoryId, ')
          ..write('authorId: $authorId, ')
          ..write('authorName: $authorName, ')
          ..write('title: $title, ')
          ..write('viewCount: $viewCount, ')
          ..write('isPremium: $isPremium, ')
          ..write('isFrozen: $isFrozen, ')
          ..write('isOwner: $isOwner, ')
          ..write('isPublished: $isPublished')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, body, timeCreate, categoryId, authorId,
      authorName, title, viewCount, isPremium, isFrozen, isOwner, isPublished);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StoryCache &&
          other.id == this.id &&
          other.body == this.body &&
          other.timeCreate == this.timeCreate &&
          other.categoryId == this.categoryId &&
          other.authorId == this.authorId &&
          other.authorName == this.authorName &&
          other.title == this.title &&
          other.viewCount == this.viewCount &&
          other.isPremium == this.isPremium &&
          other.isFrozen == this.isFrozen &&
          other.isOwner == this.isOwner &&
          other.isPublished == this.isPublished);
}

class StoryCacheTableCompanion extends UpdateCompanion<StoryCache> {
  final Value<int> id;
  final Value<String> body;
  final Value<DateTime> timeCreate;
  final Value<int> categoryId;
  final Value<int> authorId;
  final Value<String> authorName;
  final Value<String> title;
  final Value<int> viewCount;
  final Value<bool> isPremium;
  final Value<bool> isFrozen;
  final Value<bool> isOwner;
  final Value<bool> isPublished;
  const StoryCacheTableCompanion({
    this.id = const Value.absent(),
    this.body = const Value.absent(),
    this.timeCreate = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.authorId = const Value.absent(),
    this.authorName = const Value.absent(),
    this.title = const Value.absent(),
    this.viewCount = const Value.absent(),
    this.isPremium = const Value.absent(),
    this.isFrozen = const Value.absent(),
    this.isOwner = const Value.absent(),
    this.isPublished = const Value.absent(),
  });
  StoryCacheTableCompanion.insert({
    this.id = const Value.absent(),
    required String body,
    required DateTime timeCreate,
    required int categoryId,
    required int authorId,
    required String authorName,
    required String title,
    required int viewCount,
    required bool isPremium,
    required bool isFrozen,
    required bool isOwner,
    required bool isPublished,
  })  : body = Value(body),
        timeCreate = Value(timeCreate),
        categoryId = Value(categoryId),
        authorId = Value(authorId),
        authorName = Value(authorName),
        title = Value(title),
        viewCount = Value(viewCount),
        isPremium = Value(isPremium),
        isFrozen = Value(isFrozen),
        isOwner = Value(isOwner),
        isPublished = Value(isPublished);
  static Insertable<StoryCache> custom({
    Expression<int>? id,
    Expression<String>? body,
    Expression<DateTime>? timeCreate,
    Expression<int>? categoryId,
    Expression<int>? authorId,
    Expression<String>? authorName,
    Expression<String>? title,
    Expression<int>? viewCount,
    Expression<bool>? isPremium,
    Expression<bool>? isFrozen,
    Expression<bool>? isOwner,
    Expression<bool>? isPublished,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (body != null) 'body': body,
      if (timeCreate != null) 'time_create': timeCreate,
      if (categoryId != null) 'category_id': categoryId,
      if (authorId != null) 'author_id': authorId,
      if (authorName != null) 'author_name': authorName,
      if (title != null) 'title': title,
      if (viewCount != null) 'view_count': viewCount,
      if (isPremium != null) 'is_premium': isPremium,
      if (isFrozen != null) 'is_frozen': isFrozen,
      if (isOwner != null) 'is_owner': isOwner,
      if (isPublished != null) 'is_published': isPublished,
    });
  }

  StoryCacheTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? body,
      Value<DateTime>? timeCreate,
      Value<int>? categoryId,
      Value<int>? authorId,
      Value<String>? authorName,
      Value<String>? title,
      Value<int>? viewCount,
      Value<bool>? isPremium,
      Value<bool>? isFrozen,
      Value<bool>? isOwner,
      Value<bool>? isPublished}) {
    return StoryCacheTableCompanion(
      id: id ?? this.id,
      body: body ?? this.body,
      timeCreate: timeCreate ?? this.timeCreate,
      categoryId: categoryId ?? this.categoryId,
      authorId: authorId ?? this.authorId,
      authorName: authorName ?? this.authorName,
      title: title ?? this.title,
      viewCount: viewCount ?? this.viewCount,
      isPremium: isPremium ?? this.isPremium,
      isFrozen: isFrozen ?? this.isFrozen,
      isOwner: isOwner ?? this.isOwner,
      isPublished: isPublished ?? this.isPublished,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (timeCreate.present) {
      map['time_create'] = Variable<DateTime>(timeCreate.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (authorId.present) {
      map['author_id'] = Variable<int>(authorId.value);
    }
    if (authorName.present) {
      map['author_name'] = Variable<String>(authorName.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (viewCount.present) {
      map['view_count'] = Variable<int>(viewCount.value);
    }
    if (isPremium.present) {
      map['is_premium'] = Variable<bool>(isPremium.value);
    }
    if (isFrozen.present) {
      map['is_frozen'] = Variable<bool>(isFrozen.value);
    }
    if (isOwner.present) {
      map['is_owner'] = Variable<bool>(isOwner.value);
    }
    if (isPublished.present) {
      map['is_published'] = Variable<bool>(isPublished.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StoryCacheTableCompanion(')
          ..write('id: $id, ')
          ..write('body: $body, ')
          ..write('timeCreate: $timeCreate, ')
          ..write('categoryId: $categoryId, ')
          ..write('authorId: $authorId, ')
          ..write('authorName: $authorName, ')
          ..write('title: $title, ')
          ..write('viewCount: $viewCount, ')
          ..write('isPremium: $isPremium, ')
          ..write('isFrozen: $isFrozen, ')
          ..write('isOwner: $isOwner, ')
          ..write('isPublished: $isPublished')
          ..write(')'))
        .toString();
  }
}

class $StoryCategoryCacheTableTable extends StoryCategoryCacheTable
    with TableInfo<$StoryCategoryCacheTableTable, StoryCategoryCache> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StoryCategoryCacheTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _countMeta = const VerificationMeta('count');
  @override
  late final GeneratedColumn<int> count = GeneratedColumn<int>(
      'count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, count, name];
  @override
  String get aliasedName => _alias ?? 'story_category_cache_table';
  @override
  String get actualTableName => 'story_category_cache_table';
  @override
  VerificationContext validateIntegrity(Insertable<StoryCategoryCache> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('count')) {
      context.handle(
          _countMeta, count.isAcceptableOrUnknown(data['count']!, _countMeta));
    } else if (isInserting) {
      context.missing(_countMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StoryCategoryCache map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StoryCategoryCache(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      count: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}count'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $StoryCategoryCacheTableTable createAlias(String alias) {
    return $StoryCategoryCacheTableTable(attachedDatabase, alias);
  }
}

class StoryCategoryCache extends DataClass
    implements Insertable<StoryCategoryCache> {
  final int id;
  final int count;
  final String name;
  const StoryCategoryCache(
      {required this.id, required this.count, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['count'] = Variable<int>(count);
    map['name'] = Variable<String>(name);
    return map;
  }

  StoryCategoryCacheTableCompanion toCompanion(bool nullToAbsent) {
    return StoryCategoryCacheTableCompanion(
      id: Value(id),
      count: Value(count),
      name: Value(name),
    );
  }

  factory StoryCategoryCache.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StoryCategoryCache(
      id: serializer.fromJson<int>(json['id']),
      count: serializer.fromJson<int>(json['count']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'count': serializer.toJson<int>(count),
      'name': serializer.toJson<String>(name),
    };
  }

  StoryCategoryCache copyWith({int? id, int? count, String? name}) =>
      StoryCategoryCache(
        id: id ?? this.id,
        count: count ?? this.count,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('StoryCategoryCache(')
          ..write('id: $id, ')
          ..write('count: $count, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, count, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StoryCategoryCache &&
          other.id == this.id &&
          other.count == this.count &&
          other.name == this.name);
}

class StoryCategoryCacheTableCompanion
    extends UpdateCompanion<StoryCategoryCache> {
  final Value<int> id;
  final Value<int> count;
  final Value<String> name;
  const StoryCategoryCacheTableCompanion({
    this.id = const Value.absent(),
    this.count = const Value.absent(),
    this.name = const Value.absent(),
  });
  StoryCategoryCacheTableCompanion.insert({
    this.id = const Value.absent(),
    required int count,
    required String name,
  })  : count = Value(count),
        name = Value(name);
  static Insertable<StoryCategoryCache> custom({
    Expression<int>? id,
    Expression<int>? count,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (count != null) 'count': count,
      if (name != null) 'name': name,
    });
  }

  StoryCategoryCacheTableCompanion copyWith(
      {Value<int>? id, Value<int>? count, Value<String>? name}) {
    return StoryCategoryCacheTableCompanion(
      id: id ?? this.id,
      count: count ?? this.count,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (count.present) {
      map['count'] = Variable<int>(count.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StoryCategoryCacheTableCompanion(')
          ..write('id: $id, ')
          ..write('count: $count, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $StoryCacheTableTable storyCacheTable =
      $StoryCacheTableTable(this);
  late final $StoryCategoryCacheTableTable storyCategoryCacheTable =
      $StoryCategoryCacheTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [storyCacheTable, storyCategoryCacheTable];
}
