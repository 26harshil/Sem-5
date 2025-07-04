import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/controller.dart';
import 'package:practice/addEditScreem.dart';

class Crudscreen extends StatelessWidget {
  final StudentController controller = Get.put(StudentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student List")),
      body: Obx(() {
        if (controller.studentList.isEmpty) {
          return Center(child: Text("No students found"));
        }
        return ListView.builder(
          itemCount: controller.studentList.length,
          itemBuilder: (context, index) {
            final student = controller.studentList[index];
            return ListTile(
              title: Text(student.name ?? ''),
              subtitle: Text(student.roll ?? ''),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => controller.deleteStudent(student.id!),
              ),
              onTap: () {
                Get.to(() => AddUserScreen(id: student.id, student: student));
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => AddUserScreen()),
        child: Icon(Icons.add),
      ),
    );
  }
}
