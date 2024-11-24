import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/api/loanApi.dart';
import 'package:youyi_wallet/common/routers/index.dart';
import 'package:youyi_wallet/common/utils/loading.dart';
import 'package:youyi_wallet/pages/bindBank/bindinBanCarsSate.dart';

import 'index.dart';

class ConfirmationloanController extends GetxController {
  ConfirmationloanController();

  final state = ConfirmationloanState();
  TextEditingController numberController = TextEditingController();
  FocusNode numberFocusNode = FocusNode();
  RxBool argreenProtocolStatus = false.obs;
  LoanTrialListModel? trialListModel;

  //确认借款
  HandleLoan() {
    if (state.hasBank.value == false) {
      SmartDialog.showToast("请先绑定银行卡", alignment: Alignment.center);
      return;
    }
    if (argreenProtocolStatus.value == false) {
      SmartDialog.showToast("请阅读，并同意相关协议", alignment: Alignment.center);
      return;
    }

    var requestData = {"bankCardNo": state.bankNumAll, "loanAmount": state.amount.toString(), "totalTerm": state.timeLength.toString()};

    LoanAPI.applyLoan(requestData: requestData).then((code) {
      if (code != null && code == 0) {
        Get.offNamedUntil(RouteNames.comfirmationLoad, (route) {
          final routename = route.settings.name == RouteNames.application;
          return routename;
        });
      } else {
        Get.offNamedUntil(RouteNames.reviewfail, (route) {
          final routename = route.settings.name == RouteNames.application;
          return routename;
        });
      }
    });

    // Get.offNamedUntil(RouteNames.comfirmationLoad, arguments: request, (route) {
    //   final routename = route.settings.name == RouteNames.application;
    //   return routename;
    // });

    // Get.toNamed(RouteNames.comfirmationLoad, arguments: request);
    // Get.toNamed(RouteNames.comfirmationSuccess);
  }

  void showMonthlyRepaymentDue() {
    Get.toNamed(RouteNames.comfiremationMonthlyRepaymentDue, arguments: {"model": trialListModel});
  }

  decrement() {
    if (state.amount == 0) return;
    state.amount--;
    numberController.text = state.amount.toString();
    update();
  }

  onChanged(value) {
    String newText = value;
    while (newText.startsWith('0') && newText.length > 1) {
      newText = newText.substring(1);
    }
    numberController.value = numberController.value.copyWith(
      text: newText,
      selection: TextSelection.fromPosition(
        TextPosition(offset: newText.length),
      ),
    );
    if (value.isEmpty) {
      state.amount = 0;
      numberController.text = "0";
      update();
      return;
    }
    state.amount = int.parse(value);
  }

  increment() {
    if (state.amount == state.maxAmount) return;
    state.amount++;
    numberController.text = state.amount.toString();
    update();
  }

  void settingBankCard() {
    if (state.hasBank.value == false) {
      // state.hasBank.value = true;
      Get.toNamed(RouteNames.bindinBankCard);
    } else {
      print("已经添加了银行卡了");
    }
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
    Loading.show();
    LoanAPI.getLoanParams().then((ComfireLoanModel? model) {
      if (model != null) {
        state.amount = double.parse(model.maxLoanAmount ?? "0").toInt();
        state.timeLength.value = int.parse(model.installCntInfoResqs?.first.installCnt ?? "0");
        numberController.text = state.amount.toString();
        //还款试算
        getLoanTrial();
      } else {
        Loading.close();
      }
    });
  }

  void getLoanTrial() {
    LoanTrialGetModel model = LoanTrialGetModel();
    model.loanAmount = state.amount.toString();
    model.merchant = "";
    model.termNum = state.timeLength.value;
    LoanAPI.getLoanTrial(model: model).then((LoanTrialListModel? model) {
      trialListModel = model;
      if (model != null) {
        state.monthRepaymentAmount = double.parse(model.planItemResqs?.first.totalAmount ?? "");
        getUserBindinBankCard();
      } else {
        Loading.close();
      }
    });
  }

  void getUserBindinBankCard() {
    LoanAPI.getBindinBankCardList().then((HFQUserBindinListMode? model) {
      if (model != null && model.bindinList != null && model.bindinList!.isNotEmpty) {
        state.hasBank.value = true;
        state.bankName.value = model.bindinList?.first.openBank ?? "";
        String temp = model.bindinList?.first.bankCardNum ?? "";
        if (temp.length > 6) {
          temp = temp.substring(temp.length - 6, temp.length - 1);
        }
        state.bankNum.value = temp;
        state.bankNumAll = model.bindinList?.first.bankCardNum ?? "";
      } else {
        state.hasBank.value = false;
      }
      Loading.close();
    });
  }

  void noStudentProtocol() {
    Map data = {
      "agreement": [
        {"label": "hfq_fxssfcnh", "type": "2"}
      ]
    };
    Get.toNamed(RouteNames.htmlpage, arguments: {"data": data});
  }

  void loanProtocol() {
    Map data = {
      "agreement": [
        {"label": "hfq_jkht", "type": "2"}
      ]
    };
    Get.toNamed(RouteNames.htmlpage, arguments: {"data": data});
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
    numberController.dispose();
    numberFocusNode.dispose();
  }
}
