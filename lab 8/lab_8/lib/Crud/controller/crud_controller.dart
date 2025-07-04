import 'package:get/get.dart';
import '../model/student_model.dart';
import '../database/mydatabase.dart';

class CrudController extends GetxController {
  RxList<StudentModel> userList = <StudentModel>[].obs;
  final MyDatabase db = MyDatabase();

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    final data = await db.getAllStudents();
    userList.value = data.map((e) => StudentModel.fromMap(e)).toList();
  }

  Future<void> addStudent(StudentModel student) async {
    await db.addStudent(student.toMap());
    await fetchUsers();
  }

  Future<void> updateStudent(int id, StudentModel student) async {
    await db.updateStudent(id, student.toMap());
    await fetchUsers();
  }

  Future<void> deleteStudent(int id) async {
    await db.deleteStudent(id);
    await fetchUsers();
  }

  Future<void> toggleFavorite(int id) async {
    final index = userList.indexWhere((e) => e.id == id);
    if (index != -1) {
      final student = userList[index];
      student.isFavorite = !(student.isFavorite ?? false);
      await db.updateStudent(id, student.toMap());
      await fetchUsers();
    }
  }
}
