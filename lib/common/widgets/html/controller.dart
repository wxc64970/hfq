import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

class HtmlController extends GetxController {
  HtmlController();

  List agreement = [];

  initData(data) async {
    var res = await ConfigAPI.getAgreement(params: data);
    agreement.addAll(res);
    update(["html"]);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    initData(Get.arguments['data']);
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
