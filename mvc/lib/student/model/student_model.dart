class StudentModel {
  String? id;
  String? name;
  String? email;

  StudentModel({required this.id, required this.name, required this.email});

  void printDetails() {
    print("id :$id ,name: $name,email: $email");
  }
}
