import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_7/screens/addd_edit_screen.dart';
import 'package:lab_7/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MainScreen(),
      getPages: [
        GetPage(name: '/', page: () => MainScreen()),
        GetPage(name: '/AdddEditScreen', page: () => AdddEditScreen()),
      ],
    );
  }
}
