import 'package:get/get.dart';
import 'package:lab_7/model/main_model.dart';

class MainController extends GetxController {
  static final MainController _instance = MainController._internal();
  factory MainController() => _instance;
  MainController._internal();
  StudentModel studentModel = StudentModel();
  void addStudent(name, roll) {
    studentModel.students.add(
      StudentModel(name: name, roll: roll, isFavaorite: true),
    );
    update();
  }

  void editStudent(name, roll, idx) {
    studentModel.students[idx] = StudentModel(name: name, roll: roll);
    update();
  }

  void deleteStudent(int idx) {
    studentModel.students.removeAt(idx);
    update();
  }

  void toggleFavorite(int idx) {
    studentModel.students[idx].isFavorite =
        !studentModel.students[idx].isFavorite;
    update();
  }

  RxList<StudentModel> getUserList() => studentModel.students;
}
