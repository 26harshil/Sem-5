import 'package:practice/utiles/import_export.dart';

class Mydatabase {
  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await intiDatabase();
    return _db!;
  }

  Future<Database> intiDatabase() async {
    String path = join(await getDatabasesPath(), 'Student.db');
    return await openDatabase(
      path,
      onCreate: (db, version) {
        db.execute('''
    CREATE TABLE $TBL_STUDENT (
      $COLUMN_ID INTEGER PRIMARY KEY,
      $COLUMN_NAME TEXT NOT NULL,
      $COLUMN_EMAIL TEXT UNIQUE,
      $COLUMN_DOB TEXT,
      $COLUMN_GENDER TEXT,
      $COLUMN_ENROLLMENT_YEAR INTEGER,
      $COLUMN_BRANCH_ID INTEGER,
      $COLUMN_UNIVERSITY_ID INTEGER,
      FOREIGN KEY ($COLUMN_BRANCH_ID) REFERENCES Branch($COLUMN_BRANCH_ID)
        ON DELETE SET NULL ON UPDATE CASCADE,
      FOREIGN KEY ($COLUMN_UNIVERSITY_ID) REFERENCES University($COLUMN_UNIVERSITY_ID)
        ON DELETE SET NULL ON UPDATE CASCADE
    );
  ''');
      },
    );
  }

  Future<int> addStudent(Map<String, dynamic> map) async {
    Database db = await database;
    return db.insert(TBL_STUDENT, map);
  }

  Future<List<Map<String, dynamic>>> getStudent() async {
    Database db = await database;
    return db.query(TBL_STUDENT);
  }

  Future<int> updateStudent(Map<String, dynamic> map, int idx) async {
    Database db = await database;
    return db.update(TBL_STUDENT, map, where: 'id=?', whereArgs: [idx]);
  }

  Future<int> deleteStudent(int idx) async {
    Database db = await database;
    return db.delete(TBL_STUDENT, where: 'id=?', whereArgs: [idx]);
  }
}
