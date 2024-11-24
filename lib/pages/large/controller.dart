import 'dart:async';

import 'package:fl_amap/fl_amap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:youyi_wallet/common/api/home_lsAPI.dart';
import 'package:youyi_wallet/common/index.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class LargeController extends GetxController {
  LargeController();

  final state = LargeState();
  RefreshController reConroller = RefreshController(initialRefresh: false);
  Timer? timer;

  final RxList _largeList = [].obs;
  get largeList => _largeList.value;
  set largeList(value) => _largeList.value = value;

  final RxString _location = "定位中...".obs;
  get location => _location.value;
  set location(value) => _location.value = value;
  var isLocation = false;

  // tap
  void handleTap(int index) {
    Get.snackbar(
      "标题",
      "消息",
    );
  }

  void onRefresh() {
    //大额贷列表
    HOMELSAPI.fastLoanCrashLib().then((_) {
      HOMELSAPI.getListDataWithLargeLoan(size: 10).then((value) {
        largeList = value;
        reConroller.refreshCompleted();
      });
    });
  }

  startCounting() {
    state.progress = 0;
    const duration = Duration(milliseconds: 20); // 每 20 毫秒增加一次
    timer = Timer.periodic(duration, (timer) {
      if (state.progress < 100) {
        state.progress++;
        update(["large"]);
      } else {
        timer.cancel();
        Future.delayed(const Duration(milliseconds: 500), () {
          SmartDialog.dismiss();
          onRefresh();
          getUserLocation();
        });
      }
    });
  }

  loadingInReview() {
    startCounting();
    SmartDialog.show(
      backDismiss: false,
      builder: (context) => LargeListWidget(),
    );
  }

  void getUserLocation() async {
    if (!isLocation) {
      isLocation = true;
      location = "定位中...";
      //定位信息
      AMapLocation? res = await GetLocation.getLocationData();
      if (res != null) {
        UserStore.to.printInfo();
        location = res.city ?? "xx市";
        print(" ---------------------------------${res.toMap()}");
        isLocation = false;
      } else {
        location = "定位失败";
        isLocation = false;
      }
    } else {
      SmartDialog.showToast("正在定位中...", alignment: Alignment.center);
    }
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() async {
    super.onInit();
    loadingInReview();
    // AMapLocation res = await GetLocation.getLocationData();
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
    // onRefresh();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
