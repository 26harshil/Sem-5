import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Middleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // TODO: implement redirect
    if (route == 'bye-page' && !Get.arguments.containsKey("name")) {
      return RouteSettings(name: "/hi-page");
    }
    return null;
  }
}
