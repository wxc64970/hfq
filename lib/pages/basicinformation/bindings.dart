import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

import 'controller.dart';

class BasicinformationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BasicinformationController>(() => BasicinformationController());
    Get.lazyPut<ProfileStore>(() => ProfileStore());
  }
}
