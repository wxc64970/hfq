import 'package:get/get.dart';

import 'controller.dart';

class ReviewsuccessBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReviewsuccessController>(() => ReviewsuccessController());
  }
}
