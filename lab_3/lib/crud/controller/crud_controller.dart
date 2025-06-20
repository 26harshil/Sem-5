import 'package:lab_3/crud/model/crud_model.dart';

class CrudController {
  static final CrudController _instance = CrudController._internal();
  factory CrudController() => _instance;
  CrudController._internal();

  CrudModel crudModel = CrudModel();
  void addUser(String name, String email, String id) =>
      crudModel.user.add({'name': name, 'email': email, 'id': id});
  List<Map<String, dynamic>> getList() => crudModel.user;
  void deleteUser(int id) => crudModel.deleteUser(id);
  void updateUser({
    required String name,
    required String email,
    required int id,
  }) => crudModel.updateUser(id: id, name: name, email: email);
}
