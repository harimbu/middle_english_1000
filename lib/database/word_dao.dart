import 'package:drift/drift.dart';

import 'database.dart';

part 'word_dao.g.dart';

class Word extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get kor => text()();
  TextColumn get eng => text()();
  IntColumn get done => integer().nullable()();
  IntColumn get showing => integer().nullable()();
  IntColumn get adding => integer().nullable()();
}

@DriftAccessor(tables: [Word])
class WordDao extends DatabaseAccessor<MyDatabase> with _$WordDaoMixin {
  WordDao(MyDatabase db) : super(db);

  Stream<List<WordData>> streamWords(String title) {
    // return select(word).watch();
    return (select(word)..where((tbl) => tbl.title.equals(title))).watch();
  }

  Stream<List<WordData>> streamAddWords() {
    // return select(word).watch();
    return (select(word)..where((tbl) => tbl.adding.equals(1))).watch();
  }

  Future<int> updateShowing(int id, int showing) async {
    return (update(word)..where((tbl) => tbl.id.equals(id)))
        .write(WordCompanion(showing: Value(showing)));
  }

  Future<int> updateAdding(int id, int adding) async {
    return (update(word)..where((tbl) => tbl.id.equals(id)))
        .write(WordCompanion(adding: Value(adding)));
  }
}
