import 'package:lab_4/utiles/import_export.dart';

class BottomSheetBox extends StatelessWidget {
  const BottomSheetBox({super.key});

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
                    Text('Hii 1', textScaleFactor: 2),
                    Text('Hii 2', textScaleFactor: 2),
                    Text('Hii 3', textScaleFactor: 2),
                    Text('Hii 4', textScaleFactor: 2),
                    Text('Hii 5', textScaleFactor: 2),
                    Text('Hii 6', textScaleFactor: 2),
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
