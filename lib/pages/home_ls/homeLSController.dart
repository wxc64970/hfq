import 'dart:math';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:youyi_wallet/common/api/home_lsAPI.dart';
import 'package:youyi_wallet/common/routers/index.dart';
import 'package:youyi_wallet/pages/fast/index.dart';
import 'package:youyi_wallet/pages/home/widgets/loanSupermarketBottomSheet.dart';
import 'package:youyi_wallet/pages/large/index.dart';

class HomeLSController extends GetxController {
  final RxInt _number = 200000.obs;
  set number(value) => _number.value = value;
  get number => _number.value;
  final _productName = "惠分期".obs;
  set productName(value) => _productName.value = value;
  get productName => _productName.value;
  final _productUrl = "".obs;
  set productUrl(value) => _productUrl.value = value;
  get productUrl => _productUrl.value;

  final RefreshController refreshController = RefreshController(
    initialRefresh: false,
  );

  final List loanSupermarketMenu = [
    {"title": "车主借钱", "icon": "assets/images/hfq_home_car.png"},
    {"title": "待提现", "icon": "assets/images/hfq_home_wallet.png"},
    {"title": "申请记录", "icon": "assets/images/hfq_home_edit.png"},
    {"title": "黑名单检测", "icon": "assets/images/hfq_home_black_list.png"},
    {"title": "借款订单", "icon": "assets/images/hfq_home_order.png"}
  ];

  List bottomData = [
    {"icon": "assets/images/hfq_08.png", "title": "正规机构", "subtitle": "安全可靠"},
    {},
    {"icon": "assets/images/hfq_09.png", "title": "1000万", "subtitle": "用户好评"},
    {},
    {
      "icon": "assets/images/hfq_10.png",
      "title": "放款率遥遥领先",
      "subtitle": "服务用户人数千万+"
    }
  ];
  String scrollText =
      "惠分期平台不会向用户收取任何费用。如遇到以惠分期名义要求您收取任何费用的电话或者短信都是骗子。陌生贷款链接不要点击。以保证金，解冻金等名义让你交钱再借款的都是骗子。防骗干万条，不给陌生人转账第一条。";
  void loanSupermarketProductitemCliecked() {
    // Get.toNamed(RouteNames.fastApply);
  }

  final RxList _largeList = [].obs;
  get largeList => _largeList.value;
  set largeList(value) => _largeList.value = value;

  final RxList _fastList = [].obs;
  get fastList => _fastList.value;
  set fastList(value) => _fastList.value = value;

  Map? homeTopValue;
  Map? alertValue;

  void onRefresh() {
    //先撞库
    HOMELSAPI.fastLoanCrashLib().then((_) {
      fetchTopProduct(); //顶部推荐产品
      fetchLargeDataList(); //大额贷推荐产品
      fetchFastDataList(); //极速贷推荐产品
      alertViewDate(); //谈框推荐产品
    });
  }

  void fetchTopProduct() {
    //获取首页顶部贷款产品
    HOMELSAPI.getHomePageAlertData().then((value) {
      if (value["type"] == 1) {
        number = (value["data"] as LargeProductDataModel).highAmount ?? 0;
        productName = (value["data"] as LargeProductDataModel).name ?? "大额贷";
        productUrl = (value["data"] as LargeProductDataModel).logo ?? "";
      } else if (value["type"] == 2) {
        number = int.parse(
            (value["data"] as FastProductDataModel).highAmount ?? "0");
        productName = (value["data"] as FastProductDataModel).name ?? "极速贷";
        productUrl = (value["data"] as FastProductDataModel).logo ?? "";
      } else {
        number = -1;
        productName = "惠分期";
      }
      homeTopValue = value;
      refreshController.refreshCompleted();
    });
  }

  void fetchLargeDataList() {
//获取大额贷列表
    HOMELSAPI.getListDataWithLargeLoan().then((value) {
      largeList = value;
    });
  }

  void fetchFastDataList() {
//获取极速贷列表
    HOMELSAPI.getListDataWithFastLoan(needAuth: true).then((value) {
      fastList = value;
    });
  }

  void alertViewDate() {
    //获取弹框数据
    HOMELSAPI.getHomePageAlertData().then((value) {
      alertValue = value;
      if (alertValue?["type"] == 2 || alertValue?["type"] == 1) {
        Get.bottomSheet(const HFQLoanSupermarketBottomSheetView());
      }
    });
  }

  void checkLoanInfo() {
    _checkLoanInfo(homeTopValue);
  }

  void applyAlertproduct() {
    _checkLoanInfo(alertValue);
  }

  void _checkLoanInfo(Map? productValue) {
    if (productValue?["type"] == 1) {
      Get.toNamed(RouteNames.largeApply, arguments: homeTopValue);
    } else if (productValue?["type"] == 2) {
      Get.toNamed(RouteNames.fastApply, arguments: homeTopValue);
    } else {
      // SmartDialog.showToast("没有额度可用", alignment: Alignment.center);
    }
  }

  Map getAlertProductInfo() {
    if (alertValue?["type"] == 1) {
      LargeProductDataModel model = alertValue?["data"];
      return {
        "name": model.name ?? "大额贷",
        "logo": model.logo ?? "",
        "downloadRate": "${Random().nextInt(4) + 95}",
        "amount": "${(model.highAmount ?? 120000) ~/ 10000}",
        "month": "${model.maxMonth ?? 24}",
        "rate": "${model.monthRate ?? 1}%"
      };
    } else if (alertValue?["type"] == 2) {
      FastProductDataModel model = alertValue?["data"];
      return {
        "name": model.name ?? "极速贷",
        "logo": model.logo ?? "",
        "downloadRate": "${Random().nextInt(4) + 95}",
        "amount":
            "${(double.parse((model.highAmount ?? "120000"))).toInt() ~/ 10000}",
        "month": "${model.maxMonth ?? 24}",
        "rate": "${model.monthRate ?? 1}%"
      };
    } else {
      // SmartDialog.showToast("没有额度可用", alignment: Alignment.center);
    }

    return {
      "name": "惠分期",
      "logo": "",
      "downloadRate": "${Random().nextInt(4) + 95}",
      "amount": "12",
      "month": "24",
      "rate": "0.2%"
    };
  }

  void onReady() {
    super.onReady();
    onRefresh();
    // 每次返回首页时弹出snackbar
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
