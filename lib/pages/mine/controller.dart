import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/api/home_lsAPI.dart';
import 'package:youyi_wallet/common/index.dart';
import 'package:youyi_wallet/pages/fast/state.dart';
import 'package:youyi_wallet/pages/large/index.dart';
import 'package:youyi_wallet/pages/mine/widgets/myPageAlert.dart';

import 'index.dart';

class MineController extends GetxController {
  MineController();

  final state = MineState();
  var type = 0;

  handleLoan(index) {
    int userStatus = UserStore.to.userStatus;
    switch (userStatus) {
      case 1:
        if (index == 0) {
          SmartDialog.showToast("暂无还款事项");
        } else if (index == 1) {
          Get.toNamed(RouteNames.realname);
        } else if (index == 2) {
          SmartDialog.showToast("暂无待提现事项");
        } else if (index == 3) {
          SmartDialog.showToast("暂无放款事项");
        }
        break;
      case 2:
        if (index == 0) {
          SmartDialog.showToast("暂无还款事项");
        } else if (index == 1) {
          SmartDialog.showToast("暂无待完成事项");
        } else if (index == 2) {
          SmartDialog.showToast("暂无待提现事项");
        } else if (index == 3) {
          SmartDialog.showToast("暂无放款事项");
        }
        break;
      case 3:
        if (index == 0) {
          SmartDialog.showToast("暂无还款事项");
        } else if (index == 1) {
          SmartDialog.showToast("暂无待完成事项");
        } else if (index == 2) {
          SmartDialog.showToast("暂无待提现事项");
        } else if (index == 3) {
          SmartDialog.showToast("暂无放款事项");
        }
        break;
      case 4:
        if (index == 0) {
          SmartDialog.showToast("暂无还款事项");
        } else if (index == 1) {
          SmartDialog.showToast("暂无待完成事项");
        } else if (index == 2) {
          SmartDialog.showToast("暂无待提现事项");
        } else if (index == 3) {
          SmartDialog.showToast("暂无放款事项");
        }
        break;
      case 5:
        if (index == 0) {
          SmartDialog.showToast("暂无还款事项");
        } else if (index == 1) {
          SmartDialog.showToast("暂无待完成事项");
        } else if (index == 2) {
          Get.toNamed(RouteNames.reviewsuccess);
        } else if (index == 3) {
          SmartDialog.showToast("暂无放款事项");
        }
        break;
      case 6:
        if (index == 0) {
          SmartDialog.showToast("暂无还款事项");
        } else if (index == 1) {
          SmartDialog.showToast("暂无还款事项");
        } else if (index == 2) {
          SmartDialog.showToast("暂无待提现事项");
        } else if (index == 3) {
          SmartDialog.showToast("暂无放款事项");
        }
        break;
      case 7:
        if (index == 0) {
          Get.toNamed(RouteNames.repaymentMain);
        } else if (index == 1) {
          SmartDialog.showToast("暂无待完成事项");
        } else if (index == 2) {
          SmartDialog.showToast("暂无待提现事项");
        } else if (index == 3) {
          Get.toNamed(RouteNames.repaymentMain);
        }
        break;
      case 8:
        if (index == 0) {
          SmartDialog.showToast("暂无还款事项");
        } else if (index == 1) {
          SmartDialog.showToast("暂无待完成事项");
        } else if (index == 2) {
          SmartDialog.showToast("暂无待提现事项");
        } else if (index == 3) {
          SmartDialog.showToast("暂无放款事项");
        }
        break;
      default:
        if (index == 0) {
          SmartDialog.showToast("暂无还款事项");
        } else if (index == 1) {
          SmartDialog.showToast("暂无待完成事项");
        } else if (index == 2) {
          SmartDialog.showToast("暂无待提现事项");
        } else if (index == 3) {
          SmartDialog.showToast("暂无放款事项");
        }
    }
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
  }

  Map? mineAlertData;

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();

    if (UserStore.to.userStatus == 4 && type == 1) {
      HOMELSAPI.getHomePageAlertData().then((value) {
        mineAlertData = value;
        if (value["type"] == 1) {
          // number = (value["data"] as LargeProductDataModel).highAmount ?? 0;
          // productName = (value["data"] as LargeProductDataModel).name ?? "大额贷";
        } else if (value["type"] == 2) {
          // number = (value["data"] as FastProductDataModel).highAmount ?? 0;
          // productName = (value["data"] as FastProductDataModel).name ?? "极速贷";
        } else {
          // number = 200000;
          // productName = "惠分期";
        }
        if (value["type"] == 1 || value["type"] == 2) {
          Get.dialog(const HFQMineAlertView());
        }
      });
    }
  }

  String productName() {
    if (mineAlertData?["type"] == 1) {
      LargeProductDataModel model = mineAlertData?["data"];
      return model.name ?? "大额贷";
    } else if (mineAlertData?["type"] == 2) {
      FastProductDataModel model = mineAlertData?["data"];
      return model.name ?? "极速贷";
    }
    return "惠分期";
  }

  String productLogo() {
    if (mineAlertData?["type"] == 1) {
      LargeProductDataModel model = mineAlertData?["data"];
      return model.logo ?? "";
    } else if (mineAlertData?["type"] == 2) {
      FastProductDataModel model = mineAlertData?["data"];
      return model.logo ?? "";
    }
    return "惠分期";
  }

  String amount() {
    if (mineAlertData?["type"] == 1) {
      LargeProductDataModel model = mineAlertData?["data"];
      return "${model.highAmount ?? 1000000}";
    } else if (mineAlertData?["type"] == 2) {
      FastProductDataModel model = mineAlertData?["data"];
      return model.highAmount ?? "100000";
    }
    return "2000000";
  }

  String dayRate() {
    if (mineAlertData?["type"] == 1) {
      LargeProductDataModel model = mineAlertData?["data"];
      return "月利息低至${model.monthRate ?? 0.1}%";
    } else if (mineAlertData?["type"] == 2) {
      FastProductDataModel model = mineAlertData?["data"];
      return "日利息低至${model.rate ?? 0.1}%";
    }
    return "日利息低至0.1%";
  }

  String time() {
    if (mineAlertData?["type"] == 1) {
      LargeProductDataModel model = mineAlertData?["data"];
      return "${model.minMonth ?? 1}-${model.maxMonth ?? 36}月";
    } else if (mineAlertData?["type"] == 2) {
      FastProductDataModel model = mineAlertData?["data"];
      return "${model.minMonth ?? 1}-${model.maxMonth ?? 36}月";
    }
    return "1-36月";
  }

  void apply() {
    Get.back(); //取消弹框展示
    if (mineAlertData?["type"] == 1) {
      LargeProductDataModel model = mineAlertData?["data"];
      Get.toNamed(RouteNames.largeApply, arguments: {"data": model});
    } else if (mineAlertData?["type"] == 2) {
      FastProductDataModel model = mineAlertData?["data"];
      Get.toNamed(RouteNames.fastApply, arguments: {"data": model});
    }
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
