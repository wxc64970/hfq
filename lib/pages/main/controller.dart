import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';
import 'package:youyi_wallet/common/store/user.dart';

import 'index.dart';

class MainController extends GetxController {
  MainController();

  final state = MainState();

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
  }

  userStatus() async {
    await UserStore.to.getUserStatus();
    Get.offAllNamed(RouteNames.application);
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(milliseconds: 500), () {
      // startToEnterApp();
      bool isLogin = UserStore.to.isLogin;
      // Get.offAllNamed(RouteNames.application);
      if (isLogin) {
        userStatus();
      } else {
        Get.offAllNamed(RouteNames.frameSignIn);
      }
    });
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
