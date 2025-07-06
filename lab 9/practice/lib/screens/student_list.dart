import 'package:practice/utiles/import_export.dart';

class StudentList extends StatefulWidget {
  StudentList({super.key});
  StudentController studentController = Get.put(StudentController());

  @override
  State<StudentList> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<StudentList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: widget.studentController,
        builder: (controller) {
          return ListView.builder(
            itemCount: controller.student_list.length,
            itemBuilder: (context, index) {
              var student = controller.student_list[index];
              return ListTile(title: Text(student.name ?? ''));
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddEditStudent());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
