import 'package:get/get.dart';

import 'controller.dart';

class ConfirmationloanBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfirmationloanController>(() => ConfirmationloanController());
  }
}
