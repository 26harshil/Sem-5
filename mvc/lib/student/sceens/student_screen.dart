import 'package:flutter/material.dart';
import 'package:mvc/student/controller/student_controller.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  StudentController studentController = StudentController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(studentController.studentModel.name.toString()),
              Text(studentController.studentModel.id.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
