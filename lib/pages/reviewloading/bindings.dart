import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

import 'controller.dart';

class ReviewloadingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReviewloadingController>(() => ReviewloadingController());
    Get.lazyPut<UserStore>(() => UserStore());
  }
}
