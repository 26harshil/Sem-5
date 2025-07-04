import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_6/homescreen/controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              homeController.changeTheHide();
            },
            child: Text("hide"),
          ),
        ],
        title: Text(
          "Home Screen",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return homeController.isHide.value
              ? Center()
              : Center(
                child: Column(
                  children: [
                    //6 3
                    TextField(
                      onChanged: (value) {
                        homeController.realtime.value = value;
                      },
                    ),
                    // 6 1
                    Text(controller.a),
                    //6 2
                    Obx(() => Text(controller.add.toString())),
                    //6 3
                    Obx(() => Text(homeController.realtime.toString())),
                    Obx(() => Text(homeController.time.toString())),
                  ],
                ),
              );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          homeController.increement(homeController.add);
        },
        child: Text("add"),
      ),
    );
  }
}
