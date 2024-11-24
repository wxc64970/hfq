import 'package:flutter/widgets.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/api/home_lsAPI.dart';
import 'package:youyi_wallet/common/routers/names.dart';
import 'package:youyi_wallet/pages/home_ls/homeLSController.dart';
import 'package:youyi_wallet/pages/large/index.dart';
import 'package:youyi_wallet/pages/largeApply/widgets/largeApplySheet.dart';

class HFQLargeApplyController extends GetxController {
  HFQLargeApplyController();

  // final LargeController _largeController = Get.find<LargeController>();
  RxBool _argreenStatus = false.obs;
  set argreenStatus(value) => _argreenStatus.value = value;
  get argreenStatus => _argreenStatus.value;

  var tag = "";
  var name = "";
  var companyName = "";
  LargeController? largeController;
  HomeLSController? _homeLSController;
  @override
  void onInit() {
    super.onInit();
    if (Get.isRegistered<LargeController>()) {
      largeController = Get.find<LargeController>();
    }
    if (Get.isRegistered<HomeLSController>()) {
      _homeLSController = Get.find<HomeLSController>();
    }
  }

  void argennBtnPressed() {
    argreenStatus = !argreenStatus;
  }

  void userInfoShareProtocol() {
    // print("userInfoShareProtocol");
    Map data = {
      "agreement": [
        {"label": "hfq_grxxgxsqxy", "type": "2"}
      ]
    };
    Get.toNamed(RouteNames.htmlpage, arguments: {"data": data});
  }

  void loanInfoProtocol() {
    Map data = {
      "agreement": [
        {"label": "hfq_dsfcp", "type": "1"}
      ]
    };
    Get.toNamed(RouteNames.htmlpage, arguments: {"data": data});
  }

  void readApply() {
    if (argreenStatus) {
      Get.bottomSheet(const HFQLargeApplySheetView(), isDismissible: false);
    } else {
      SmartDialog.showToast("请先阅读并同意相关协议", alignment: Alignment.center);
    }
  }

  void applyLarge() {
    HOMELSAPI.applyProductWithLarge(tag: tag).then((value) {
      if (value != null && value["url"] == null) {
        if (largeController != null) {
          largeController?.onRefresh(); //刷新大额贷页面
        }
        if (_homeLSController != null) {
          _homeLSController?.fetchLargeDataList(); //刷新首页大额贷列表
          _homeLSController?.fetchTopProduct(); //刷新首页顶部推荐产品
        }

        Get.offNamedUntil(RouteNames.larageApplyEndPage,
            arguments: {"title": name}, (route) {
          final routename = route.settings.name == RouteNames.application;
          return routename;
        });
      } else if (value != null && value["url"] != null) {
        // Get.offNamedUntil(RouteNames.webviewPage,
        //     arguments: {"url": value["url"]}, (route) {
        //   final routename = route.settings.name == RouteNames.application;
        //   return routename;
        // });
        if (largeController != null) {
          largeController?.onRefresh(); //刷新大额贷页面
        }
        if (_homeLSController != null) {
          _homeLSController?.fetchLargeDataList(); //刷新首页大额贷列表
          _homeLSController?.fetchTopProduct(); //刷新首页顶部推荐产品
        }
        Get.offNamedUntil(RouteNames.cusWebViewpage,
            arguments: {"url": value["url"], "title": name}, (route) {
          final routename = route.settings.name == RouteNames.application;
          return routename;
        });
      }
    });
    //
  }
}

class HFQLargeApplyBindin extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HFQLargeApplyController>(() => HFQLargeApplyController());
  }
}
