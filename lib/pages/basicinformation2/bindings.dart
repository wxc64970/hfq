import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

import 'controller.dart';

class Basicinformation2Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Basicinformation2Controller>(() => Basicinformation2Controller());
    Get.lazyPut<ProfileStore>(() => ProfileStore());
  }
}
