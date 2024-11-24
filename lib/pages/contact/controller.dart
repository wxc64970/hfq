import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youyi_wallet/common/index.dart';

import 'index.dart';

class ContactController extends GetxController {
  ContactController();

  final state = ContactState();

  ToTel() async {
    final Uri url = Uri.parse('tel:${Constants.serviceTel}');
    await launchUrl(url);
  }

  initData() async {
    AppMessageResponseEntity? data = await ConfigAPI.appMessage(params: {"type": GetPlatform.isAndroid ? 2 : 1});
    state.version = data?.version;
    update();
    getAgreement();
  }

  getAgreement() async {
    var res = await ConfigAPI.getAgreement(params: {"agreement": []});
    if (res != null) {
      state.agreementList.clear();
      state.agreementList.addAll(res);
      update();
    }
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    initData();
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
