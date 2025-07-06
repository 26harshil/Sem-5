import 'package:practice/database/mydatabase.dart';
import 'package:practice/utiles/import_export.dart';

import '../model/student_model.dart';

class StudentController extends GetxController {
  static StudentController _instance = StudentController._internal();
  StudentController._internal();
  factory StudentController() {
    return _instance;
  }
  Mydatabase mydatabase = Mydatabase();
  RxList<StudentModel> student_list = <StudentModel>[].obs;

  Future<int> addStudent(Map<String, dynamic> map) {
    return mydatabase.addStudent(map);
  }

  Future<void> studentCount() async {
    final data = await mydatabase.getStudent();
    student_list.value = data.map((e) => StudentModel.fromMap(e)).toList();
  }
}
