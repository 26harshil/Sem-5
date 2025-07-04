import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/controller.dart';
import 'package:practice/studentMode.dart';

class AddUserScreen extends StatelessWidget {
  final Studentmode? student;
  final int? id;

  AddUserScreen({this.student, this.id});

  final nameCtrl = TextEditingController();
  final rollCtrl = TextEditingController();
  final StudentController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    if (student != null) {
      nameCtrl.text = student!.name ?? '';
      rollCtrl.text = student!.roll ?? '';
    }

    return Scaffold(
      appBar: AppBar(title: Text(id != null ? 'Edit Student' : 'Add Student')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameCtrl,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: rollCtrl,
              decoration: InputDecoration(labelText: 'Roll'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                Studentmode newStudent = Studentmode(
                  name: nameCtrl.text,
                  roll: rollCtrl.text,
                );
                if (id != null) {
                  await controller.updateStudent(id!, newStudent);
                  print(
                    ":::Updating student with id=$id and data=${student}:::",
                  );
                } else {
                  await controller.addStudent(newStudent);
                }
                Get.back();
              },
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
