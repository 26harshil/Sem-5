import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/crud_controller.dart';
import '../model/student_model.dart';

class AddUserScreen extends StatelessWidget {
  final StudentModel? student;
  final int? id;

  AddUserScreen({super.key, this.student, this.id});

  final nameCtrl = TextEditingController();
  final rollCtrl = TextEditingController();
  final enrollCtrl = TextEditingController();

  final CrudController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    if (student != null) {
      nameCtrl.text = student!.name ?? '';
      rollCtrl.text = student!.roll ?? '';
      enrollCtrl.text = student!.enroll ?? '';
    }

    return Scaffold(
      appBar: AppBar(title: Text(id != null ? 'Edit User' : 'Add User')),
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
            TextField(
              controller: enrollCtrl,
              decoration: InputDecoration(labelText: 'Enrollment'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newStudent = StudentModel(
                  name: nameCtrl.text,
                  roll: rollCtrl.text,
                  enroll: enrollCtrl.text,
                  isFavorite: student?.isFavorite ?? false,
                );

                if (id != null) {
                  controller.updateStudent(id!, newStudent);
                } else {
                  controller.addStudent(newStudent);
                }

                Get.back();
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
