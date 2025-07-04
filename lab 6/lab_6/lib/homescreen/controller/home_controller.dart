import 'dart:async';

import 'package:get/get.dart';

class HomeController extends GetxController {
  String a = "asdm";
  RxInt add = 0.obs;
  RxString realtime = "".obs;
  var time = 1000.obs;
  RxBool isHide = false.obs;

  void increement(RxInt a) {
    ++a;
  }

  //6 5
  void changeTheHide() {
    isHide.value = !isHide.value;
    update();
  }

  //6 4
  void startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (time.value > 0) {
        time.value--;
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    startTimer();
  }
}
