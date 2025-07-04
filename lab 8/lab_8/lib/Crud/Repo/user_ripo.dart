// import 'package:lab_8/Crud/database/Mydatabase.dart';
// import 'package:lab_8/Crud/model/student_model.dart';
// import 'package:sqflite/sqflite.dart';

// class UserRipo {
//   final Mydatabase dbservice;
//   UserRipo({required this.dbservice});

//   Future<void> addUser(String tbl_name, StudentModel student) async {
//     (await dbservice!.database).insert(tbl_name, student.toMap());
//   }

//   Future<List<StudentModel>> getUser() async {
//     Database db = await dbservice!.database;
//     List<Map<String, Object?>> users = await db.rawQuery(
//       'SELECT*FROM Tbl_Student',
//     );

//     List<StudentModel> userList = [];
//     for (var element in users) {
//       userList.add(StudentModel.fromMap(element));
//     }
//     return userList;
//   }
// }
