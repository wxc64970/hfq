import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/api/repaymentApi.dart';
import 'package:youyi_wallet/common/index.dart';
import 'package:youyi_wallet/pages/repayment/repaymentMode.dart';
import 'package:youyi_wallet/pages/repayment/state.dart';
// import 'package:int';
// import 'package:in';

class RepaymentController extends GetxController {
  RxList pendingList = [].obs;

  RxList repaidList = [].obs;

  RxInt _orderTotalAmount = 0.obs;
  get orderTotalAmount => _orderTotalAmount.value;
  set orderTotalAmount(value) => _orderTotalAmount.value = value;

  RxInt _orderPlanCount = 0.obs;
  get orderPlanCount => _orderPlanCount.value;
  set orderPlanCount(value) => _orderPlanCount.value = value;

  RxDouble _orderLoseLan = 0.0.obs;
  get orderLoseLan => _orderLoseLan.value;
  set orderLoseLan(value) => _orderLoseLan.value = value;

  RepaymentResponseModel? _responseModel;

  int currentIndex = 0;

  List<String> tabbarTitle = ["待还款", "已还款"];

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    loadData();
  }

  void loadData({bool needLoading = true}) {
    if (needLoading) {
      Loading.show();
    }
    Repaymentapi.getMineRepaymentPlan().then((RepaymentResponseModel? value) {
      if (value != null) {
        orderTotalAmount = double.parse(value.orderLoanAmount ?? "0").toInt();
        orderPlanCount = int.parse(value.totalInstallCnt ?? "0");
        orderLoseLan = double.parse(value.orderResidueTotalAmount ?? "0");

        //0:待还款，1:还款中，5:已还清
        if (value.repayPlanEntityList != null) {
          List<RepaymentModel> tempPendingList = []; //未还款
          List<RepaymentModel> tempRependList = []; //已还款
          for (var item in value.repayPlanEntityList!) {
            RepaymentModel remodel = RepaymentModel();
            remodel.repaymentNum = item.totalAmount ?? "0";
            remodel.repaymentTime = item.lateRepayDate ?? "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}";
            remodel.principal = item.principal ?? "0";
            remodel.interest = item.interest ?? "0";
            remodel.repaymentStatus = item.status ?? 0;
            remodel.id = item.id ?? 0;
            if (remodel.repaymentStatus == 0 || remodel.repaymentStatus == 1) {
              remodel.repaymentStatus = changedStatus(remodel);
              tempPendingList.add(remodel);
            } else if (remodel.repaymentStatus == 5) {
              tempRependList.add(remodel);
            }
          }
          pendingList.value = tempPendingList;
          repaidList.value = tempRependList;
        }
      }
      _responseModel = value;
      Loading.close();
    });
  }

  String getCurrentDate() {
    DateTime now = DateTime.now();
    int year = now.year;
    int month = now.month;
    return '$year-$month';
  }

  int changedStatus(RepaymentModel model) {
    if (model.repaymentTime.substring(0, 7) != getCurrentDate()) {
      //判断还款日期是否为当前月份
      var year = int.parse(model.repaymentTime.substring(0, 4));
      var month = int.parse(model.repaymentTime.substring(5, 7));
      DateTime after = DateTime(year, month, 1, 0, 0, 0);
      if (after.isAfter(DateTime.now())) {
        //判断还款日期是否在当前日期以后
        return 9;
      }
    }
    return model.repaymentStatus;
  }

  void changedItemOpenStatus({required int pageIndex, required int index}) {
    RepaymentModel model;
    if (pageIndex == 0) {
      model = pendingList[index];
    } else {
      model = repaidList[index];
    }
    model.showStatus.value = !model.showStatus.value;
  }

  int pageCount(int pageIndex) {
    if (pageIndex == 0) {
      return pendingList.length;
    } else {
      return repaidList.length;
    }
  }

  RepaymentModel listViewModel(int pageIndex, int index) {
    if (pageIndex == 0) {
      return pendingList[index];
    } else {
      return repaidList[index];
    }
  }

  void userPressedList({required int pageIndex, required int index}) {
    RepaymentModel clickedMode = listViewModel(pageIndex, index);
    if (_responseModel != null && _responseModel?.repayPlanEntityList != null) {
      for (var item in _responseModel?.repayPlanEntityList ?? []) {
        if (clickedMode.id == item.id) {
          // if (clickedMode.repaymentStatus == 0) {
          //   if (index == 0) {
          //     Get.toNamed(RouteNames.repaymentInfo, arguments: {"model": item});
          //   } else {
          //     SmartDialog.showToast("暂不支持提前还款", alignment: Alignment.center);
          //   }
          // } else {
          // if (clickedMode.repaymentStatus == 1) {
          //   SmartDialog.showToast("正在还款中...", alignment: Alignment.center);
          // } else if (clickedMode.repaymentStatus == 5) {
          //   SmartDialog.showToast("已还款", alignment: Alignment.center);
          // }
          // }
          if (clickedMode.repaymentStatus == 1) {
            SmartDialog.showToast("正在还款中...", alignment: Alignment.center);
          } else if (clickedMode.repaymentStatus == 5) {
            SmartDialog.showToast("已还款", alignment: Alignment.center);
          } else if (clickedMode.repaymentStatus == 9) {
            SmartDialog.showToast("未到还款期限", alignment: Alignment.center);
          } else if (clickedMode.repaymentStatus == 0) {
            Get.toNamed(RouteNames.repaymentInfo, arguments: {"model": item});
          } else {}
          break;
        }
      }
    }
  }
}
