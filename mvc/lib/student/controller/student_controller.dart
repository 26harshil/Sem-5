import 'package:mvc/student/model/student_model.dart';

class StudentController {
  StudentModel studentModel = StudentModel(
    id: "1",
    name: "Malay",
    email: "Malay@465gmail.com",
  );
  void studentDetails() {
    studentModel.printDetails();
  }
}
