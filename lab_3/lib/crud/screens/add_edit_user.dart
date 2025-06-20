import 'package:flutter/material.dart';
import 'package:lab_3/crud/controller/crud_controller.dart';

class AddEditUser extends StatefulWidget {
  dynamic user;
  int? idx;
  AddEditUser({super.key, this.user, this.idx});

  @override
  State<AddEditUser> createState() => _AddEditUserState();
}

class _AddEditUserState extends State<AddEditUser> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emiController = TextEditingController();
  TextEditingController _idController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.user != null) {
      _nameController.text = widget.user['name'].toString();
      _emiController.text = widget.user['email'].toString();
      _idController.text = widget.user['id'].toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    final CrudController crudController = CrudController();
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(hintText: "Name"),
          ),
          TextFormField(
            controller: _emiController,
            decoration: const InputDecoration(hintText: "email"),
          ),
          TextFormField(
            controller: _idController,
            decoration: const InputDecoration(hintText: "id"),
          ),
          TextButton(
            onPressed: () {
              if (widget.user == null) {
                crudController.addUser(
                  _nameController.text,
                  _emiController.text,
                  _idController.text,
                );
                Navigator.pop(context);
              } else {
                crudController.updateUser(
                  name: _nameController.text,
                  email: _emiController.text,
                  id: widget.idx!,
                );
                print(crudController.getList());
                Navigator.pop(context);
              }
            },

            child: widget.idx == null ? Text("Add") : Text("edit"),
          ),
        ],
      ),
    );
  }
}
