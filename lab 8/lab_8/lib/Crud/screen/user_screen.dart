import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/crud_controller.dart';
import 'add_user_screen.dart';

class UserScreen extends StatelessWidget {
  final CrudController controller = Get.put(CrudController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User List")),
      body: Obx(() {
        if (controller.userList.isEmpty) {
          return Center(child: Text("No users found."));
        }
        return ListView.builder(
          itemCount: controller.userList.length,
          itemBuilder: (context, index) {
            final student = controller.userList[index];

            final university = student.universityName ?? "No University";
            final branch = student.branchName ?? "No Branch";

            return ListTile(
              title: Text(student.name ?? ""),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Roll: ${student.roll ?? ""}"),
                  Text("Enroll: ${student.enroll ?? ""}"),
                  Text("University: $university"),
                  Text("Branch: $branch"),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      student.isFavorite == true
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: () => controller.toggleFavorite(student.id!),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => controller.deleteStudent(student.id!),
                  ),
                ],
              ),
              onTap: () {
                Get.to(() => AddUserScreen(student: student, id: student.id));
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
