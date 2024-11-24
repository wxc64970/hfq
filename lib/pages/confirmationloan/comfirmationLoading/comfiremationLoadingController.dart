import 'dart:async';

import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/api/loanApi.dart';
import 'package:youyi_wallet/common/index.dart';
import 'package:youyi_wallet/common/routers/index.dart';

class ComfiremationLoadingController extends GetxController {
  ComfiremationLoadingController();

  static int timeOut = 10;
  var currentTime = 0.obs;
  var responseData;

  ///网络请求状态 0:请求中 1:正常返回数据，2请求报错了
  int loadingStatus = 0;

  ///获取到网络请求结果后，延迟多少时间跳转 默认2s
  int delyTime = 0;

  Timer? timer;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    timer?.cancel();
  }

  onWillPop() async {
    await UserStore.to.getUserStatus();
    update(['home']);
  }

  void applyLoan({required dynamic requestData}) {
    currentTime.value = timeOut;
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      changed();
    });
    loadingStatus = 0;
    LoanAPI.applyLoanStatus().then((value) {
      // timer?.cancel();
      responseData = value;
      if (value != null && int.parse(value["loanStatus"]) != 1) {
        loadingStatus = value == null ? 2 : 1;
        delyTime = 2;
      }
    });
  }

  void changed() async {
    currentTime.value = --currentTime.value;
    if (loadingStatus != 0) {
      delyTime = --delyTime;
    }
    if (loadingStatus == 1 && delyTime <= 0) {
      timer?.cancel();
      //loanStatus = 01 申请中  loanStatus == 03 申请失败 loanStatus == 02 申请成功
      await UserStore.to.getUserStatus();
      update(['home']);
      if (responseData != null && int.parse(responseData["loanStatus"]) == 2) {
        Get.offNamedUntil(RouteNames.comfirmationSuccess, (route) {
          final routename = route.settings.name == RouteNames.application;
          return routename;
        });
      } else if (responseData != null && int.parse(responseData["loanStatus"]) == 3) {
        Get.offNamedUntil(RouteNames.reviewfail, (route) {
          final routename = route.settings.name == RouteNames.application;
          return routename;
        });
      }
    }
    if (currentTime.value <= 0) {
      await UserStore.to.getUserStatus();
      update(['home']);
      SmartDialog.showToast("当前申请正在审核中,请耐心等候");
      Get.back();
    }
  }
}

class ComfiremationLoadingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ComfiremationLoadingController>(() => ComfiremationLoadingController());
  }
}
