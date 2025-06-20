abstract class FacultyModel {
  String printDetails();
  static const String facultyName = "John Doe";
}

class Details extends FacultyModel {
  String printDetails() {
    return "Hello, I am a faculty member.";
  }
}

class StudentDetails extends FacultyModel {
  String printDetails() {
    return "Hello, I am a student.";
  }
}
