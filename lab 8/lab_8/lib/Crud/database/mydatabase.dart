import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDatabase {
  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }

  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'student.db');
    return await openDatabase(
      path,
      version: 3, // Increment version for upgrade
      onCreate: _onCreate, 
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // Initial creation includes all new tables

    await db.execute('''
      CREATE TABLE student (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        roll TEXT,
        enroll TEXT,
        isFavorite INTEGER,
        university_id INTEGER,
        branch_id INTEGER,
        FOREIGN KEY(university_id) REFERENCES university(id),
        FOREIGN KEY(branch_id) REFERENCES branch(id)
      );
    ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion == 1 && newVersion == 2) {
      // Create new university and branch tables
      await db.execute('''
        CREATE TABLE university (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT
        );
      ''');

      await db.execute('''
        CREATE TABLE branch (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT
        );
      ''');

      // Create new student table with university & branch reference
      await db.execute('''
        CREATE TABLE student_new (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          roll TEXT,
          enroll TEXT,
          isFavorite INTEGER,
          university_id INTEGER,
          branch_id INTEGER,
          FOREIGN KEY(university_id) REFERENCES university(id),
          FOREIGN KEY(branch_id) REFERENCES branch(id)
        );
      ''');

      // Optional: Insert default university and branch
      await db.insert('university', {'name': 'Darshan University'});
      await db.insert('branch', {'name': 'CSE'});

      // Get default IDs
      final uni = await db.query('university', limit: 1);
      final branch = await db.query('branch', limit: 1);
      final defaultUniId = uni.first['id'];
      final defaultBranchId = branch.first['id'];

      // Copy data from old student to student_new
      final oldStudents = await db.query('student');
      for (var student in oldStudents) {
        await db.insert('student_new', {
          'name': student['name'],
          'roll': student['roll'],
          'enroll': student['enroll'],
          'isFavorite': student['isFavorite'],
          'university_id': defaultUniId,
          'branch_id': defaultBranchId,
        });
      }

      // Drop old student table
      await db.execute('DROP TABLE student');

      // Rename new table to student
      await db.execute('ALTER TABLE student_new RENAME TO student');
    }
  }

  // Existing CRUD remains same, will work on new student table
  Future<int> addStudent(Map<String, dynamic> student) async {
    final db = await database;
    return await db.insert('student', student);
  }

  Future<List<Map<String, dynamic>>> getAllStudents() async {
    final db = await database;
    return await db.query('student');
  }

  Future<int> updateStudent(int id, Map<String, dynamic> student) async {
    final db = await database;
    return await db.update(
      'student',
      student,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteStudent(int id) async {
    final db = await database;
    return await db.delete('student', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> getStudentWithDetails() async {
    final db = await database;
    return await db.rawQuery('''
      SELECT s.*, u.name as university_name, b.name as branch_name
      FROM student s
      LEFT JOIN university u ON s.university_id = u.id
      LEFT JOIN branch b ON s.branch_id = b.id
    ''');
  }
}
