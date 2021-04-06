import 'package:moor_flutter/moor_flutter.dart';

part 'database.g.dart';

class Partituras extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get size => integer()();
  TextColumn get partitura => text()();
  BoolColumn get native => boolean()();
}

@UseMoor(tables: [Partituras], daos: [PartituraDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super((FlutterQueryExecutor.inDatabaseFolder(
    path: 'db.sqlite',
    logStatements: true,
  )));

  @override
  int get schemaVersion => 1;
}

@UseDao(tables: [Partituras])
class PartituraDao extends DatabaseAccessor<AppDatabase> with _$PartituraDaoMixin{
  final AppDatabase db;

  PartituraDao(this.db) : super(db);

  Stream<List<Partitura>> watchPartiturasBySize(int size){
    return (select(partituras)
        ..orderBy([
          (t) => OrderingTerm(expression: t.name)
        ])
        ..where((t) => t.size.equals(size))
      )
      .watch();
  }
  Future insertPartitura(Insertable<Partitura> partitura) => into(partituras).insert(partitura);
  Future updatePartitura(Insertable<Partitura> partitura) => update(partituras).replace(partitura);
  Future deletePartitura(Insertable<Partitura> partitura) => delete(partituras).delete(partitura);
}