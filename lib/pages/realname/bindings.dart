import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

import 'controller.dart';

class RealnameBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileStore>(() => ProfileStore());
    Get.lazyPut<RealnameController>(() => RealnameController());
  }
}
