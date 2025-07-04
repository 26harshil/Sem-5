import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/route_manager.dart';
import 'package:lab_7/controller/main_controller.dart';
import 'package:lab_7/model/main_model.dart';

class AdddEditScreen extends StatefulWidget {
  const AdddEditScreen({super.key});

  @override
  State<AdddEditScreen> createState() => _AdddEditScreenState();
}

class _AdddEditScreenState extends State<AdddEditScreen> {
  MainController mainController = MainController();
  TextEditingController nameController = TextEditingController();

  TextEditingController rollController = TextEditingController();
  late StudentModel student;
  int? idx;
  @override
  void initState() {
    super.initState();
    final args = Get.arguments as Map?;
    if (args != null) {
      student = args['student'] as StudentModel;
      idx = args['index'] as int?;
      nameController.text = student.name ?? '';
      rollController.text = student.roll ?? '';
    } else {
      student = StudentModel(); // Create a new empty student for adding
      idx = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(controller: nameController),
          TextFormField(controller: rollController),
          TextButton(
            onPressed: () async {
              print(mainController.getUserList());
              if (idx != null) {
                mainController.editStudent(
                  nameController.text,
                  rollController.text,
                  idx,
                );
              } else {
                mainController.addStudent(
                  nameController.text,
                  rollController.text,
                );
              }

              Get.back();
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }
}
