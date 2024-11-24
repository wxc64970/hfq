import 'dart:async';

import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

import 'index.dart';

class ReviewloadingController extends GetxController {
  ReviewloadingController();

  final state = ReviewloadingState();

  Timer? time;

  backHome() async {
    await UserStore.to.getUserStatus();
    update(["home"]);
    print(UserStore.to.userStatus);
    time?.cancel();
    Get.back();
  }

  // inintData() {
  //   Future.delayed(Duration(seconds: 3), () {
  //     // Get.offNamedUntil(RouteNames.reviewfail, (route) {
  //     //   final routename = route.settings.name == RouteNames.application;
  //     //   return routename;
  //     // });
  //     Get.offNamedUntil(RouteNames.reviewsuccess, (route) {
  //       final routename = route.settings.name == RouteNames.application;
  //       return routename;
  //     });
  //   });
  // }
  initData() {
    time = Timer.periodic(Duration(seconds: 1), (timer) {
      if (state.times > 0) {
        state.times--;
        update();
      } else {
        update();
        backHome();
      }
    });
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
