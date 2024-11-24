import 'package:get/get.dart';
import 'package:youyi_wallet/pages/confirmationloan/state.dart';
import 'package:youyi_wallet/pages/repayment/state.dart';

class Monthlyrepaymentduecontroller extends GetxController {
  Monthlyrepaymentduecontroller();
  RxList showList = [].obs;

  RxInt _orderTotalAmount = 0.obs;
  get orderTotalAmount => _orderTotalAmount.value;
  set orderTotalAmount(value) => _orderTotalAmount.value = value;

  RxInt _orderPlanCount = 0.obs;
  get orderPlanCount => _orderPlanCount.value;
  set orderPlanCount(value) => _orderPlanCount.value = value;

  RxDouble _orderLoseLan = 0.0.obs;
  get orderLoseLan => _orderLoseLan.value;
  set orderLoseLan(value) => _orderLoseLan.value = value;

  void changedItemStatus({required int index}) {
    RepaymentModel model = showList[index];
    model.showStatus.value = !model.showStatus.value;
  }

  void usedInputModel({LoanTrialListModel? model}) {
    if (model != null) {
      orderTotalAmount = double.parse(model.orderPrincipal ?? "0").toInt();
      orderLoseLan = double.parse(model.orderTotalAmount ?? "0.0");
      List<RepaymentModel> tempList = [];
      if (model.planItemResqs != null) {
        for (var item in model.planItemResqs!) {
          RepaymentModel remodel = RepaymentModel();
          remodel.repaymentNum = item.totalAmount ?? "0";
          remodel.repaymentTime = item.lateRepayDate ?? "0";
          remodel.principal = item.principal ?? "0";
          remodel.interest = item.interest ?? "0";
          remodel.repaymentStatus = 3;
          tempList.add(remodel);
        }
        showList.value = tempList;
        orderPlanCount = tempList.length;
      }
    }
  }
}

class MonthlyrepaymentdueBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Monthlyrepaymentduecontroller>(
        () => Monthlyrepaymentduecontroller());
  }
}
