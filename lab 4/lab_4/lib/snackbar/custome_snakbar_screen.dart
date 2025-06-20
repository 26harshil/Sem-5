import 'package:lab_4/utiles/import_export.dart';

class CustomeSnakbarScreen extends StatelessWidget {
  const CustomeSnakbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.snackbar(
              "Snakbar is Opened",
              "THis will open the snackbar ",
              animationDuration: Duration(milliseconds: 200),
              dismissDirection: DismissDirection.down,
              isDismissible: true,
              snackPosition: SnackPosition.BOTTOM,
              boxShadows: [
                BoxShadow(
                  color: Color.from(alpha: 2, red: 230, green: 120, blue: 56),
                ),
              ],
            );
          },
          child: Text("snak Bar"),
        ),
      ),
    );
  }
}
