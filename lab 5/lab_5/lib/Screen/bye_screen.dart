import 'package:lab_5/utiles/import_export.dart';

class ByeScreen extends StatefulWidget {
  ByeScreen({super.key});

  @override
  State<ByeScreen> createState() => _ByeScreenState();
}

class _ByeScreenState extends State<ByeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bye -Screen")),
      body: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Center(
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("bye"),
              Text(Get.arguments['name'].toString()),
              Text(Get.arguments['age'].toString()),
            ],
          ),
        ),
      ),
    );
  }
}
