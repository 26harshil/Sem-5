import 'package:lab_4/utiles/import_export.dart';

class CustomDialogboxScreen extends StatelessWidget {
  const CustomDialogboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.dialog(
              AlertDialog(
                title: Text("Are you sure do you want "),
                backgroundColor: Color.from(
                  alpha: 1,
                  red: 20,
                  green: 126,
                  blue: 25,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text("YEs"),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text("No"),
                  ),
                ],
              ),
            );
          },
          child: Text("Custome Show dialog Box"),
        ),
      ),
    );
  }
}
