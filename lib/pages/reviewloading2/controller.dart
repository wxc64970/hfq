import 'dart:async';

import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

import 'index.dart';

class Reviewloading2Controller extends GetxController {
  Reviewloading2Controller();

  final state = Reviewloading2State();

  Timer? time;

  backHome() async {
    await UserStore.to.getUserStatus();
    update(["home"]);
    time?.cancel();
    Get.back();
  }

  initData() async {
    await HOMELSAPI.fastLoanCrashLib();
    var largeLoan = await HOMELSAPI.getListDataWithLargeLoan();
    if (largeLoan.isNotEmpty) {
      Get.offNamed(RouteNames.largeApply, arguments: {"data": largeLoan[0]});
    } else {
      var fastLoan = await HOMELSAPI.getListDataWithFastLoan(needAuth: true);
      if (fastLoan.isNotEmpty) {
        Get.offNamed(RouteNames.fastApply, arguments: {"data": fastLoan[0]});
      } else {
        //
      }
    }

    // time = Timer.periodic(const Duration(seconds: 1), (timer) {
    //   if (state.times > 0) {
    //     state.times--;
    //     update();
    //   } else {
    //     update();
    //     backHome();
    //   }
    // });
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
    initData();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }
}
