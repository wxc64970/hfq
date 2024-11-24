import 'package:get/get.dart';

import 'controller.dart';

class FastBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FastController>(() => FastController());
  }
}
