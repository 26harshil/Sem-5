class CrudModel {
  List<Map<String, dynamic>> user = [];

  void addUser(String name, String email, String id) {
    user.add({'name': name, 'email': email, 'id': id});
  }

  void deleteUser(int id) {
    user.removeAt(id);
  }

  void updateUser({required id, required String name, required String email}) {
    user[id]['name'] = name;
    user[id]['email'] = email;
  }
}
