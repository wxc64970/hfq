import 'package:get/get.dart';

class RepaymentInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RepaymentInfoBinding>(() => RepaymentInfoBinding());
  }
}
