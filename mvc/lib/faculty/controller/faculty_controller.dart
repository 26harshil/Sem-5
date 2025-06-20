import 'package:mvc/faculty/model/faculty_model.dart';

class FacultyController {
  Details facultyModel = Details();

  String facultyDetails() {
    return facultyModel.printDetails();
  }
}
