import 'package:get/get_rx/src/rx_types/rx_types.dart';

class StudentModel {
  final String? name;
  final String? roll;
  bool? _isFavorite;

  // List of students (this is usually better placed in a controller)
  RxList<StudentModel> students = <StudentModel>[].obs;

  StudentModel({bool? isFavaorite, this.name, this.roll}) {
    _isFavorite = isFavaorite ?? false;
  }

  // 🔹 Getter
  bool get isFavorite => _isFavorite ?? false;

  // 🔸 Setter
  set isFavorite(bool value) {
    _isFavorite = value;
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'roll': roll, 'isFavorite': _isFavorite};
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      name: map['name'],
      roll: map['roll'],
      isFavaorite: map['isFavorite'],
    );
  }

  @override
  String toString() {
    return 'Student(name: $name, roll: $roll, isFavorite: $_isFavorite)';
  }
}
