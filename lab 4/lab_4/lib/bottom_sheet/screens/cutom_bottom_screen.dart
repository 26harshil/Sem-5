import 'package:lab_4/utiles/import_export.dart';

class CutomBottomScreen extends StatelessWidget {
  const CutomBottomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.bottomSheet(
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.greenAccent,

                  border: Border.all(width: 5, color: Colors.black),
                ),
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    Text('Hii 1'),
                    Text('Hii 1'),
                    Text('Hii 1'),
                    Text('Hii 1'),
                    Text('Hii 1'),
                    Text('Hii 1'),
                    Text('Hii 1'),
                    Text('Hii 1'),
                    Text('Hii 1'),
                  ],
                ),
              ),
              barrierColor: Colors.red[50],
              isDismissible: false,
              enableDrag: false,
            );
          },
          child: const Text("Open the Bottom Sheet"),
        ),
      ),
    );
  }
}
