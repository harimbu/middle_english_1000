// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class WordData extends DataClass implements Insertable<WordData> {
  final int id;
  final String title;
  final String kor;
  final String eng;
  final int? done;
  final int? showing;
  final int? adding;
  WordData(
      {required this.id,
      required this.title,
      required this.kor,
      required this.eng,
      this.done,
      this.showing,
      this.adding});
  factory WordData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return WordData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      kor: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}kor'])!,
      eng: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}eng'])!,
      done: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}done']),
      showing: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}showing']),
      adding: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}adding']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['kor'] = Variable<String>(kor);
    map['eng'] = Variable<String>(eng);
    if (!nullToAbsent || done != null) {
      map['done'] = Variable<int?>(done);
    }
    if (!nullToAbsent || showing != null) {
      map['showing'] = Variable<int?>(showing);
    }
    if (!nullToAbsent || adding != null) {
      map['adding'] = Variable<int?>(adding);
    }
    return map;
  }

  WordCompanion toCompanion(bool nullToAbsent) {
    return WordCompanion(
      id: Value(id),
      title: Value(title),
      kor: Value(kor),
      eng: Value(eng),
      done: done == null && nullToAbsent ? const Value.absent() : Value(done),
      showing: showing == null && nullToAbsent
          ? const Value.absent()
          : Value(showing),
      adding:
          adding == null && nullToAbsent ? const Value.absent() : Value(adding),
    );
  }

  factory WordData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WordData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      kor: serializer.fromJson<String>(json['kor']),
      eng: serializer.fromJson<String>(json['eng']),
      done: serializer.fromJson<int?>(json['done']),
      showing: serializer.fromJson<int?>(json['showing']),
      adding: serializer.fromJson<int?>(json['adding']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'kor': serializer.toJson<String>(kor),
      'eng': serializer.toJson<String>(eng),
      'done': serializer.toJson<int?>(done),
      'showing': serializer.toJson<int?>(showing),
      'adding': serializer.toJson<int?>(adding),
    };
  }

  WordData copyWith(
          {int? id,
          String? title,
          String? kor,
          String? eng,
          int? done,
          int? showing,
          int? adding}) =>
      WordData(
        id: id ?? this.id,
        title: title ?? this.title,
        kor: kor ?? this.kor,
        eng: eng ?? this.eng,
        done: done ?? this.done,
        showing: showing ?? this.showing,
        adding: adding ?? this.adding,
      );
  @override
  String toString() {
    return (StringBuffer('WordData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('kor: $kor, ')
          ..write('eng: $eng, ')
          ..write('done: $done, ')
          ..write('showing: $showing, ')
          ..write('adding: $adding')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, kor, eng, done, showing, adding);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WordData &&
          other.id == this.id &&
          other.title == this.title &&
          other.kor == this.kor &&
          other.eng == this.eng &&
          other.done == this.done &&
          other.showing == this.showing &&
          other.adding == this.adding);
}

class WordCompanion extends UpdateCompanion<WordData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> kor;
  final Value<String> eng;
  final Value<int?> done;
  final Value<int?> showing;
  final Value<int?> adding;
  const WordCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.kor = const Value.absent(),
    this.eng = const Value.absent(),
    this.done = const Value.absent(),
    this.showing = const Value.absent(),
    this.adding = const Value.absent(),
  });
  WordCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String kor,
    required String eng,
    this.done = const Value.absent(),
    this.showing = const Value.absent(),
    this.adding = const Value.absent(),
  })  : title = Value(title),
        kor = Value(kor),
        eng = Value(eng);
  static Insertable<WordData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? kor,
    Expression<String>? eng,
    Expression<int?>? done,
    Expression<int?>? showing,
    Expression<int?>? adding,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (kor != null) 'kor': kor,
      if (eng != null) 'eng': eng,
      if (done != null) 'done': done,
      if (showing != null) 'showing': showing,
      if (adding != null) 'adding': adding,
    });
  }

  WordCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? kor,
      Value<String>? eng,
      Value<int?>? done,
      Value<int?>? showing,
      Value<int?>? adding}) {
    return WordCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      kor: kor ?? this.kor,
      eng: eng ?? this.eng,
      done: done ?? this.done,
      showing: showing ?? this.showing,
      adding: adding ?? this.adding,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (kor.present) {
      map['kor'] = Variable<String>(kor.value);
    }
    if (eng.present) {
      map['eng'] = Variable<String>(eng.value);
    }
    if (done.present) {
      map['done'] = Variable<int?>(done.value);
    }
    if (showing.present) {
      map['showing'] = Variable<int?>(showing.value);
    }
    if (adding.present) {
      map['adding'] = Variable<int?>(adding.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WordCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('kor: $kor, ')
          ..write('eng: $eng, ')
          ..write('done: $done, ')
          ..write('showing: $showing, ')
          ..write('adding: $adding')
          ..write(')'))
        .toString();
  }
}

class $WordTable extends Word with TableInfo<$WordTable, WordData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WordTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _korMeta = const VerificationMeta('kor');
  @override
  late final GeneratedColumn<String?> kor = GeneratedColumn<String?>(
      'kor', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _engMeta = const VerificationMeta('eng');
  @override
  late final GeneratedColumn<String?> eng = GeneratedColumn<String?>(
      'eng', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _doneMeta = const VerificationMeta('done');
  @override
  late final GeneratedColumn<int?> done = GeneratedColumn<int?>(
      'done', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _showingMeta = const VerificationMeta('showing');
  @override
  late final GeneratedColumn<int?> showing = GeneratedColumn<int?>(
      'showing', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _addingMeta = const VerificationMeta('adding');
  @override
  late final GeneratedColumn<int?> adding = GeneratedColumn<int?>(
      'adding', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, kor, eng, done, showing, adding];
  @override
  String get aliasedName => _alias ?? 'word';
  @override
  String get actualTableName => 'word';
  @override
  VerificationContext validateIntegrity(Insertable<WordData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('kor')) {
      context.handle(
          _korMeta, kor.isAcceptableOrUnknown(data['kor']!, _korMeta));
    } else if (isInserting) {
      context.missing(_korMeta);
    }
    if (data.containsKey('eng')) {
      context.handle(
          _engMeta, eng.isAcceptableOrUnknown(data['eng']!, _engMeta));
    } else if (isInserting) {
      context.missing(_engMeta);
    }
    if (data.containsKey('done')) {
      context.handle(
          _doneMeta, done.isAcceptableOrUnknown(data['done']!, _doneMeta));
    }
    if (data.containsKey('showing')) {
      context.handle(_showingMeta,
          showing.isAcceptableOrUnknown(data['showing']!, _showingMeta));
    }
    if (data.containsKey('adding')) {
      context.handle(_addingMeta,
          adding.isAcceptableOrUnknown(data['adding']!, _addingMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WordData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return WordData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $WordTable createAlias(String alias) {
    return $WordTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $WordTable word = $WordTable(this);
  late final WordDao wordDao = WordDao(this as MyDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [word];
}
