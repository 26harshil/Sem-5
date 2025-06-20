import 'package:flutter/material.dart';
import 'package:lab_3/crud/controller/crud_controller.dart';
import 'package:lab_3/crud/screens/add_edit_user.dart';

class CurdScreen extends StatefulWidget {
  const CurdScreen({super.key});

  @override
  State<CurdScreen> createState() => _CurdScreenState();
}

class _CurdScreenState extends State<CurdScreen> {
  final CrudController crudController = CrudController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUser();
  }

  void fetchUser() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final users = crudController.getList();
    return Scaffold(
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> user = users[index];

          return ListTile(
            title: Text(user['name'].toString()),
            subtitle: Text(user['email'].toString()),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    crudController.deleteUser(index);
                    fetchUser();
                  },
                  icon: Icon(Icons.delete),
                ),
                IconButton(
                  onPressed: () async {
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder:
                            (context) => AddEditUser(user: user, idx: index),
                      ),
                    );
                    fetchUser();
                  },
                  icon: Icon(Icons.edit),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => AddEditUser()));
          fetchUser();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
