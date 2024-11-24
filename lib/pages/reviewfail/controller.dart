import 'dart:async';

import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

import 'index.dart';

class ReviewfailController extends GetxController {
  ReviewfailController();

  final state = ReviewfailState();
  Timer? time;

  backHome() {
    int userStatus = UserStore.to.userStatus;
    time?.cancel();
    if (userStatus == 4) {
      Get.offAllNamed(RouteNames.main);
      return;
    }

    Get.back();
  }

  initData() {
    time = Timer.periodic(Duration(seconds: 1), (timer) {
      if (state.times > 0) {
        state.times--;
        update();
      } else {
        update();
        timer.cancel();
        // Get.back();
        backHome();
      }
    });
  }

  _initData() {
    if (Get.arguments != null) {
      state.title = Get.arguments['title'] ?? "";
      state.content = Get.arguments['content'] ?? "";
    }
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    _initData();
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
