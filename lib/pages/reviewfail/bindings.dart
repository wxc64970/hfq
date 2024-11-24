import 'package:get/get.dart';

import 'controller.dart';

class ReviewfailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReviewfailController>(() => ReviewfailController());
  }
}
