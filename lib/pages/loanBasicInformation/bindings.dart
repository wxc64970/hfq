import 'package:get/get.dart';

import 'controller.dart';

class LoanbasicinformationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoanbasicinformationController>(() => LoanbasicinformationController());
  }
}
