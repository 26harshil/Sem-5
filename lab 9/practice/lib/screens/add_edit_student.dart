import 'package:practice/utiles/import_export.dart';

class AddEditStudent extends StatefulWidget {
  AddEditStudent({super.key});
  StudentController studentController = Get.put(StudentController());

  @override
  State<AddEditStudent> createState() => _AddEditStudentState();
}

class _AddEditStudentState extends State<AddEditStudent> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController enrollmentYearController =
      TextEditingController();
  final TextEditingController branchIdController = TextEditingController();
  final TextEditingController universityIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add/Edit Screen")),
      body: Column(
        children: [
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(labelText: COLUMN_NAME),
            validator: (value) => value!.isEmpty ? 'Enter name' : null,
          ),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(labelText: COLUMN_EMAIL),
            keyboardType: TextInputType.emailAddress,
          ),
          TextFormField(
            controller: dobController,
            decoration: InputDecoration(labelText: COLUMN_DOB),
            keyboardType: TextInputType.datetime,
          ),
          TextFormField(
            controller: genderController,
            decoration: InputDecoration(labelText: COLUMN_GENDER),
          ),
          TextFormField(
            controller: enrollmentYearController,
            decoration: InputDecoration(labelText: COLUMN_ENROLLMENT_YEAR),
            keyboardType: TextInputType.number,
          ),
          TextFormField(
            controller: branchIdController,
            decoration: InputDecoration(labelText: COLUMN_BRANCH_ID),
            keyboardType: TextInputType.number,
          ),
          TextFormField(
            controller: universityIdController,
            decoration: InputDecoration(labelText: COLUMN_UNIVERSITY_ID),
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(
            onPressed: () {
              Map<String, dynamic> map = {
                COLUMN_NAME: nameController.text,
                COLUMN_EMAIL: emailController.text,
                COLUMN_DOB: dobController.text,
                COLUMN_GENDER: genderController.text,
                COLUMN_ENROLLMENT_YEAR: int.tryParse(
                  enrollmentYearController.text,
                ),
                COLUMN_BRANCH_ID: int.tryParse(branchIdController.text),
                COLUMN_UNIVERSITY_ID: int.tryParse(universityIdController.text),
              };
              widget.studentController.addStudent(map);
            },
            child: Text("SAVE"),
          ),
        ],
      ),
    );
  }
}
