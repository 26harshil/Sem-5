import 'package:lab_4/utiles/import_export.dart';

class DialogScreen extends StatefulWidget {
  const DialogScreen({super.key});

  @override
  State<DialogScreen> createState() => _DialogScreenState();
}

class _DialogScreenState extends State<DialogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.defaultDialog(
              title: "Are you sure ",
              middleText: "",
              onCancel: () {
                Get.back();
              },
              onConfirm: () {
                Get.back();
              },
            );
          },
          child: Text("Show dialog Box"),
        ),
      ),
    );
  }
}
