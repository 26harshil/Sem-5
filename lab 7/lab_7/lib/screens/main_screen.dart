import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lab_7/controller/main_controller.dart';
import 'package:lab_7/screens/addd_edit_screen.dart';

class MainScreen extends StatelessWidget {
  MainController maincontroller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    final user = maincontroller.getUserList();
    return Scaffold(
      appBar: AppBar(title: Text("data")),
      body: GetBuilder<MainController>(
        builder: (controller) {
          return controller.getUserList().isEmpty
              ? Center(child: Text("No User Found"))
              : ListView.builder(
                itemCount: controller.getUserList().length,
                itemBuilder: (context, index) {
                  var map = user[index];
                  print(map);
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(
                        '/AdddEditScreen',
                        arguments: {'student': map, 'index': index},
                      );
                    },
                    child: ListTile(
                      title: Text(map.name.toString()),
                      subtitle: Text(map.roll.toString()),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              controller.toggleFavorite(index);
                            },
                            icon: Icon(
                              map.isFavorite == true
                                  ? Icons.favorite_border
                                  : Icons.favorite,
                              color: Colors.red,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              controller.deleteStudent(index);
                            },
                            icon: Icon(Icons.delete, color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AdddEditScreen());
        },
        child: Text("add"),
      ),
    );
  }
}
