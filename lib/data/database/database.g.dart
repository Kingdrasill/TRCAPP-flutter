// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Partitura extends DataClass implements Insertable<Partitura> {
  final int id;
  final String name;
  final int size;
  final String partitura;
  Partitura(
      {@required this.id,
      @required this.name,
      @required this.size,
      @required this.partitura});
  factory Partitura.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Partitura(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      size: intType.mapFromDatabaseResponse(data['${effectivePrefix}size']),
      partitura: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}partitura']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || size != null) {
      map['size'] = Variable<int>(size);
    }
    if (!nullToAbsent || partitura != null) {
      map['partitura'] = Variable<String>(partitura);
    }
    return map;
  }

  PartiturasCompanion toCompanion(bool nullToAbsent) {
    return PartiturasCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      size: size == null && nullToAbsent ? const Value.absent() : Value(size),
      partitura: partitura == null && nullToAbsent
          ? const Value.absent()
          : Value(partitura),
    );
  }

  factory Partitura.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Partitura(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      size: serializer.fromJson<int>(json['size']),
      partitura: serializer.fromJson<String>(json['partitura']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'size': serializer.toJson<int>(size),
      'partitura': serializer.toJson<String>(partitura),
    };
  }

  Partitura copyWith({int id, String name, int size, String partitura}) =>
      Partitura(
        id: id ?? this.id,
        name: name ?? this.name,
        size: size ?? this.size,
        partitura: partitura ?? this.partitura,
      );
  @override
  String toString() {
    return (StringBuffer('Partitura(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('size: $size, ')
          ..write('partitura: $partitura')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(name.hashCode, $mrjc(size.hashCode, partitura.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Partitura &&
          other.id == this.id &&
          other.name == this.name &&
          other.size == this.size &&
          other.partitura == this.partitura);
}

class PartiturasCompanion extends UpdateCompanion<Partitura> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> size;
  final Value<String> partitura;
  const PartiturasCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.size = const Value.absent(),
    this.partitura = const Value.absent(),
  });
  PartiturasCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required int size,
    @required String partitura,
  })  : name = Value(name),
        size = Value(size),
        partitura = Value(partitura);
  static Insertable<Partitura> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<int> size,
    Expression<String> partitura,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (size != null) 'size': size,
      if (partitura != null) 'partitura': partitura,
    });
  }

  PartiturasCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<int> size,
      Value<String> partitura}) {
    return PartiturasCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      size: size ?? this.size,
      partitura: partitura ?? this.partitura,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (size.present) {
      map['size'] = Variable<int>(size.value);
    }
    if (partitura.present) {
      map['partitura'] = Variable<String>(partitura.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PartiturasCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('size: $size, ')
          ..write('partitura: $partitura')
          ..write(')'))
        .toString();
  }
}

class $PartiturasTable extends Partituras
    with TableInfo<$PartiturasTable, Partitura> {
  final GeneratedDatabase _db;
  final String _alias;
  $PartiturasTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _sizeMeta = const VerificationMeta('size');
  GeneratedIntColumn _size;
  @override
  GeneratedIntColumn get size => _size ??= _constructSize();
  GeneratedIntColumn _constructSize() {
    return GeneratedIntColumn(
      'size',
      $tableName,
      false,
    );
  }

  final VerificationMeta _partituraMeta = const VerificationMeta('partitura');
  GeneratedTextColumn _partitura;
  @override
  GeneratedTextColumn get partitura => _partitura ??= _constructPartitura();
  GeneratedTextColumn _constructPartitura() {
    return GeneratedTextColumn(
      'partitura',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, size, partitura];
  @override
  $PartiturasTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'partituras';
  @override
  final String actualTableName = 'partituras';
  @override
  VerificationContext validateIntegrity(Insertable<Partitura> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('size')) {
      context.handle(
          _sizeMeta, size.isAcceptableOrUnknown(data['size'], _sizeMeta));
    } else if (isInserting) {
      context.missing(_sizeMeta);
    }
    if (data.containsKey('partitura')) {
      context.handle(_partituraMeta,
          partitura.isAcceptableOrUnknown(data['partitura'], _partituraMeta));
    } else if (isInserting) {
      context.missing(_partituraMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Partitura map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Partitura.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $PartiturasTable createAlias(String alias) {
    return $PartiturasTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $PartiturasTable _partituras;
  $PartiturasTable get partituras => _partituras ??= $PartiturasTable(this);
  PartituraDao _partituraDao;
  PartituraDao get partituraDao =>
      _partituraDao ??= PartituraDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [partituras];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$PartituraDaoMixin on DatabaseAccessor<AppDatabase> {
  $PartiturasTable get partituras => attachedDatabase.partituras;
}
