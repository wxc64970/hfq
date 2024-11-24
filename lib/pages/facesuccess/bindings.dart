import 'package:get/get.dart';

import 'controller.dart';

class FacesuccessBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FacesuccessController>(() => FacesuccessController());
  }
}
