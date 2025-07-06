class StudentModel {
  final int? studentId;
  final String? name;
  final String? email;
  final String? dob; // Stored as ISO 8601 string (e.g., "2000-01-01")
  final String? gender;
  final int? enrollmentYear;
  final int? branchId;
  final int? universityId;

  StudentModel({
    this.studentId,
    this.name,
    this.email,
    this.dob,
    this.gender,
    this.enrollmentYear,
    this.branchId,
    this.universityId,
  });

  // Convert a Map (from SQLite) into a Student object
  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      studentId: map['student_id'],
      name: map['name'],
      email: map['email'],
      dob: map['dob'],
      gender: map['gender'],
      enrollmentYear: map['enrollment_year'],
      branchId: map['branch_id'],
      universityId: map['university_id'],
    );
  }

  // Convert a Student object into a Map (for SQLite)
  Map<String, dynamic> toMap() {
    return {
      'student_id': studentId,
      'name': name,
      'email': email,
      'dob': dob,
      'gender': gender,
      'enrollment_year': enrollmentYear,
      'branch_id': branchId,
      'university_id': universityId,
    };
  }
}
