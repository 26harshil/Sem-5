class StudentModel {
  int? id;
  String? name;
  String? roll;
  String? enroll;
  bool? isFavorite;
  int? universityId;
  int? branchId;

  // Optional: For joined data (not stored in DB directly)
  String? universityName;
  String? branchName;

  StudentModel({
    this.id,
    this.name,
    this.roll,
    this.enroll,
    this.isFavorite = false,
    this.universityId,
    this.branchId,
    this.universityName,
    this.branchName,
  });

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id'],
      name: map['name'],
      roll: map['roll'],
      enroll: map['enroll'],
      isFavorite: map['isFavorite'] == 1,
      universityId: map['university_id'],
      branchId: map['branch_id'],
      universityName: map['university_name'], // from JOIN
      branchName: map['branch_name'], // from JOIN
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'roll': roll,
      'enroll': enroll,
      'isFavorite': isFavorite == true ? 1 : 0,
      'university_id': universityId,
      'branch_id': branchId,
    };
  }
}
