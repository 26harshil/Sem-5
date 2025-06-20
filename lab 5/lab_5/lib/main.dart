import 'package:lab_5/middleware/middleware.dart';
import 'package:lab_5/utiles/import_export.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      initialRoute: '/hi-page',
      getPages: [
        GetPage(
          name: '/hi-page',
          page: () => HiScreen(),
          transition: Transition.fade,
        ),
        GetPage(
          name: '/bye-page',
          page: () => ByeScreen(),
          middlewares: [Middleware()],
          transition: Transition.circularReveal,
          transitionDuration: Duration(seconds: 1),
        ),
      ],
    );
  }
}
