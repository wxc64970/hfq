import 'package:get/get.dart';
import 'package:youyi_wallet/pages/repayment/controller.dart';

class RepaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RepaymentController>(() => RepaymentController());
  }
}