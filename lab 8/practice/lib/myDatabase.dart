import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Mydatabase {
  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await init();
    return _db!;
  }

  Future<Database> init() async {
    String path = join(await getDatabasesPath(), 'student.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE student (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            roll TEXT
          )
        ''');
      },
    );
  }

  Future<int> addStudent(Map<String, dynamic> map) async {
    final db = await database;
    return await db.insert('student', map);
  }

  Future<List<Map<String, dynamic>>> getStudent() async {
    final db = await database;
    return await db.query('student');
  }

  Future<int> updateStudent(Map<String, dynamic> map, int id) async {
    final db = await database;
    return await db.update('student', map, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteStudent(int id) async {
    final db = await database;
    return await db.delete('student', where: 'id = ?', whereArgs: [id]);
  }
}
