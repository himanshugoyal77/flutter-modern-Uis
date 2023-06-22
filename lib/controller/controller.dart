import 'package:get/get.dart';

class GetxScroll extends GetxController {
  RxDouble scroll = 0.0.obs;

  void setScroll(double value) {
    scroll.value = value;
    print('from getx controller${scroll.value}');

    update();
  }
}
