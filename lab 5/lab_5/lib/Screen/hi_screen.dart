import 'package:lab_5/utiles/import_export.dart';

class HiScreen extends StatelessWidget {
  const HiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            // Get.to(ByeScreen(), arguments: {'name': "harshil", 'age': '18'});
            Get.toNamed('/bye-page', arguments: {'age': '18'});
          },
          child: Text("Hi"),
        ),
      ),
    );
  }
}
