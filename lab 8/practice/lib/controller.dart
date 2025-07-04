import 'package:get/get.dart';
import 'package:practice/myDatabase.dart';
import 'package:practice/studentMode.dart';

class StudentController extends GetxController {
  RxList<Studentmode> studentList = <Studentmode>[].obs;
  final Mydatabase _db = Mydatabase();

  @override
  void onInit() {
    fetchStudents();
    super.onInit();
  }

  Future<void> fetchStudents() async {
    final data = await _db.getStudent();
    studentList.value = data.map((e) => Studentmode.fromMap(e)).toList();
  }

  Future<void> addStudent(Studentmode student) async {
    await _db.addStudent(student.toMap());
    fetchStudents(); // refresh list
  }

  Future<void> updateStudent(int id, Studentmode student) async {
    await _db.updateStudent(student.toMap(), id);
    fetchStudents();
  }

  Future<void> deleteStudent(int id) async {
    await _db.deleteStudent(id);
    fetchStudents();
  }
}
