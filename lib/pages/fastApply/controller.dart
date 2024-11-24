import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/api/home_lsAPI.dart';
import 'package:youyi_wallet/common/index.dart';
import 'package:youyi_wallet/common/routers/index.dart';
import 'package:youyi_wallet/pages/fast/index.dart';
import 'package:youyi_wallet/pages/fast/state.dart';
import 'package:youyi_wallet/pages/home_ls/homeLSController.dart';

class HFQFastApplyController extends GetxController {
  HFQFastApplyController();
  FastProductDataModel? model;

  FastController? fastController;
  HomeLSController? _homeLSController;

  RxBool _argreenStatus = false.obs;
  get argreenStatus => _argreenStatus.value;
  set argreenStatus(value) => _argreenStatus.value = value;

  @override
  void onInit() {
    super.onInit();
    // Get.lazyPut<FastController>(() => FastController());
    if (Get.isRegistered<FastController>()) {
      fastController = Get.find<FastController>();
    }

    if (Get.isRegistered<HomeLSController>()) {
      _homeLSController = Get.find<HomeLSController>();
    }
  }

  @override
  void onReady() {
    super.onReady();
    print("___+_++_+__+_+_+_+_+_++_+_+_+_+_+${model?.id}");
    HOMELSAPI.applyProductWithFastpoint(
        pid: model?.id ?? 0, eventType: "h5_jsd_detail_count");
  }

  void argeenStatusChanged() {
    argreenStatus = !argreenStatus;
  }

  void serverprotocol() {
    // print("serverprotocol");
    Map data = {
      "agreement": [
        {"label": "hfq_grxxgxsqxy", "type": "2"}
      ]
    };
    Get.toNamed(RouteNames.htmlpage, arguments: {"data": data});
  }

  void secrectprotocol() {
    Map data = {
      "agreement": [
        {"label": "hfq_dsfcp", "type": "1"}
      ]
    };
    Get.toNamed(RouteNames.htmlpage, arguments: {"data": data});
  }

  void apply() async {
    if (!argreenStatus) {
      SmartDialog.showToast("请先阅读并同意相关协议", alignment: Alignment.center);
      return;
    }
//判断是否可以申请该产品
    Loading.show();
    HOMELSAPI.canApplyProductWithFast(pid: model?.id ?? 0).then((value) {
      if (value != null && value == true) {
        //埋点
        HOMELSAPI.applyProductWithFastpoint(
            pid: model?.id ?? 0, eventType: "h5_tc_jsd_click");
        if (model?.isLd == 1) {
          //需要联登
          HOMELSAPI
              .applyProductWithFastJoinLogin(pid: model?.id ?? 0)
              .then((resuleValue) {
            if (resuleValue != null &&
                resuleValue["code"] == 0 &&
                resuleValue["data"] != null) {
              if (fastController != null) {
                fastController?.refreshData(); //刷新极速贷页面
              }
              if (_homeLSController != null) {
                _homeLSController?.fetchFastDataList(); //刷新首页极速贷列表
                _homeLSController?.fetchTopProduct(); //刷新首页顶部推荐产品
              }

              var _url = resuleValue["data"];
              Get.offNamedUntil(RouteNames.cusWebViewpage,
                  arguments: {"url": _url, "title": model?.name ?? ""},
                  (route) {
                final routename = route.settings.name == RouteNames.application;
                return routename;
              });
              // Get.toNamed(RouteNames.webviewPage, arguments: {"url": _url});
              // launchUrl(Uri.parse(_url)).then((canOpen) {
              //   print("打开手机浏览器");
              // });
            } else {
              SmartDialog.showToast(resuleValue["msg"] ?? "联登失败",
                  alignment: Alignment.center);
            }
            Loading.close();
          });
        } else {
          if (fastController != null) {
            fastController?.refreshData(); //刷新极速贷页面
          }
          if (_homeLSController != null) {
            _homeLSController?.fetchFastDataList(); //刷新首页极速贷列表
            _homeLSController?.fetchTopProduct(); //刷新首页顶部推荐产品
          }
          Loading.close();
          Get.offNamedUntil(RouteNames.cusWebViewpage, arguments: {
            "url": model?.jumpUrl ?? "",
            "title": model?.name ?? ""
          }, (route) {
            final routename = route.settings.name == RouteNames.application;
            return routename;
          });
        }
      } else {
        Loading.close();
        SmartDialog.showToast("该产品暂时不可申请", alignment: Alignment.center);
      }
    });
  }
}

class HFQFastApplyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HFQFastApplyController>(() => HFQFastApplyController());
  }
}
