import 'package:get/get.dart';
import 'package:youyi_wallet/pages/repayment/makeRepayment/makeRepaymentController.dart';

class RepaymentMakeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RepaymentMakeController>(() => RepaymentMakeController());
  }
}
