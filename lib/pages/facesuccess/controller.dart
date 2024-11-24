import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

import 'index.dart';

class FacesuccessController extends GetxController {
  FacesuccessController();

  final state = FacesuccessState();

  onChanged(value) {
    print(value);
    state.checkboxData = value;
    update();
  }

  //跳转 注册服务协议
  handleUserAgreement() {
    Get.toNamed(RouteNames.webviewPage, arguments: {"url": "https://image.sxhywincredit.com/html/agreement/APP/PersonalInformationAuthorization.html"});
  }

  handleNext() {
    // print(state.checkboxData);
    Get.offNamed(RouteNames.basicinformation);
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
