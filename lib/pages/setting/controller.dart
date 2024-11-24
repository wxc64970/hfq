import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class SettingController extends GetxController {
  SettingController();

  final state = SettingState();

  logOut() {
    SmartDialog.show(
      builder: (context) => DialogWidget("退出登录", "确认退出登录吗？", () {
        SmartDialog.dismiss();
        UserStore.to.onLogout();
      }),
    );
  }

  cancelAccount() {
    int status = UserStore.to.userStatus;
    if (status == 6 || status == 7) {
      SmartDialog.showToast("借款审核中、借款成功用户不能注销账号!");
      return;
    }
    SmartDialog.show(
      builder: (context) => DialogWidget("注销账号", "确认注销当前账号吗？ 注销后不可撤回", () {
        SmartDialog.dismiss();
        UserStore.to.onCancelAccount();
      }),
    );
  }

  handleContact() {
    Get.toNamed(RouteNames.contact);
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
