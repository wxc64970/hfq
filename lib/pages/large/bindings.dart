import 'package:get/get.dart';

import 'controller.dart';

class LargeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LargeController>(() => LargeController());
  }
}
