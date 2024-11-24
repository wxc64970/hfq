import 'package:get/get.dart';

import 'controller.dart';

class Reviewloading2Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Reviewloading2Controller>(() => Reviewloading2Controller());
  }
}
