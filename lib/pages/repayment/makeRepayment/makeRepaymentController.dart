import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:youyi_wallet/common/api/loanApi.dart';
import 'package:youyi_wallet/common/api/repaymentApi.dart';
import 'package:youyi_wallet/common/index.dart';
import 'package:youyi_wallet/pages/bindBank/bindinBanCarsSate.dart';
import 'package:youyi_wallet/pages/repayment/controller.dart';
import 'package:youyi_wallet/pages/repayment/makeRepayment/makeRepaymentState.dart';
import 'package:youyi_wallet/pages/repayment/repaymentMode.dart';

class RepaymentMakeController extends GetxController {
  RepaymentMakeController();

  RepaymentController repaymentController = Get.find<RepaymentController>();

  RepayPlanEntityList? model;
  HFQUserBindinListMode? bindinModel;
  RxString _bankName = "".obs;
  get bankName => _bankName;
  set bankName(value) => _bankName.value = value;
  String _bankNumAll = "";
  String bankBindPhone = "";
  Timer? timer;

  HFQMakeRepaymentState state = HFQMakeRepaymentState();

  @override
  void onReady() {
    super.onReady();

    Loading.show();
    LoanAPI.getBindinBankCardList().then((HFQUserBindinListMode? model) {
      if (model != null &&
          model.bindinList != null &&
          model.bindinList!.isNotEmpty) {
        bankBindPhone = model.bindinList?.first.reserveMobile ?? "";
        String temp = model.bindinList?.first.bankCardNum ?? "";
        if (temp.length > 6) {
          temp = temp.substring(temp.length - 6, temp.length - 1);
        }
        bankName.value = "${model.bindinList?.first.openBank ?? ""}($temp)";
        _bankNumAll = model.bindinList?.first.bankCardNum ?? "";
        // state.hasBank.value = true;
        // state.bankName.value = model.bindinList?.first.openBank ?? "";

        // state.bankNum.value = temp;
        // state.bankNumAll = model.bindinList?.first.bankCardNum ?? "";
      } else {
        // state.hasBank.value = false;
      }
      bindinModel = model;
      Loading.close();
    });
  }

  void applyRepaymentSendMessageCode({bool needCodeAlert = true}) {
    print("object");
    if (state.isCountingDown) {
      //正在倒计时中...
      toVerificationCode(); //展示弹框
    } else {
      Repaymentapi.applyRepaymentSendMessageCode(phone: bankBindPhone)
          .then((code) {
        print("ssdfsdf");
        if (code != null && code == 0) {
          state.isCountingDown = true;
          state.countDownTime = 60; //重置倒计时时长
          startCountdown(); //开启倒计时
          if (needCodeAlert) {
            toVerificationCode(); //展示弹框
          }
        } else {
          //验证码发送失败
          Get.back();
        }
      });
    }
  }

  void _applyRepayment() async {
    var requestData = {
      "dynamicCode": state.authCode,
      "amount": model?.totalAmount ?? "0",
      "bankCardNo": _bankNumAll,
      "installCntList": model?.installCnt ?? "1",
      "orderNo": model?.orderNo ?? ""
    };
    var res = await Repaymentapi.applyRepayment(requestData: requestData);
    if (res['code'] != null && res['code'] == 0) {
      SmartDialog.dismiss(); //关闭短信验证码弹框
      timer?.cancel();
      _showLoadingDialog();
      Future.delayed(const Duration(seconds: 2), () {
        Get.back(); //关闭LoadingDialog
        repaymentController.loadData(needLoading: false); //刷新还款列表
        Get.offNamedUntil(RouteNames.repaymentSuccess, (route) {
          final routename = route.settings.name == RouteNames.application;
          return routename;
        });
      });
    } else {
      if (res['msg'].contains("验证码")) {
        // SmartDialog.showToast("验证码输入错误!");
      } else {
        SmartDialog.dismiss(); //关闭短信验证码弹框
        timer?.cancel();
        _showLoadingDialog();
        Future.delayed(const Duration(seconds: 2), () {
          Get.back(); //关闭LoadingDialog
          Get.offNamedUntil(RouteNames.reviewfail, (route) {
            final routename = route.settings.name == RouteNames.application;
            return routename;
          }, arguments: {"title": "还款", "content": "还款失败"});
        });
      }
    }
  }

  void startCountdown() {
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      state.countDownTime = --state.countDownTime;
      if (state.countDownTime <= 0) {
        //倒计时结束
        state.isCountingDown = false;
        t.cancel();
      }
    });
  }

  toVerificationCode() {
    SmartDialog.show(
      builder: (context) => Center(
        child: Container(
          width: kSize560,
          // height: kSize480,
          padding: EdgeInsets.only(left: kSize46, right: kSize46),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(kSize20)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: kSize60,
              ),
              Text(
                "请输入验证码",
                style: TextStyle(
                    fontSize: kFontSize32, color: const Color(0xff333333)),
              ),
              SizedBox(
                height: kSize40,
              ),
              FilledRoundedPinPut(
                onCompleted: (pin) {
                  state.authCode = pin;
                  state.isOnce = true;
                  update();
                },
                onChanged: (value) {
                  if (value.length < 6) {
                    state.isOnce = false;
                    update();
                  }
                },
              ),
              SizedBox(
                height: kSize40,
              ),
              Obx(() => btnFlatButtonWidget(
                  onPressed: () {
                    if (state.isOnce) {
                      SmartDialog.dismiss();
                      _applyRepayment();
                    } else {
                      SmartDialog.showToast("请输入验证码",
                          alignment: Alignment.center);
                    }
                  },
                  width: Get.width,
                  height: 80,
                  title: "确认",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: kFontSize32,
                    height: 1,
                  ),
                  radius: 100,
                  gbColor: state.isOnce
                      ? AppColors.primaryElement
                      : AppColors.primaryElement.withOpacity(0.3))),
              SizedBox(
                height: kSize28,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "验证码已发送至:${bankBindPhone.substring(0, 3)}****${bankBindPhone.substring(bankBindPhone.length - 4)}",
                    style: TextStyle(
                        fontSize: kSize24, color: const Color(0xFF888888)),
                  ),
                  Obx(() => InkWell(
                        onTap: () {
                          if (!state.isCountingDown) {
                            applyRepaymentSendMessageCode(needCodeAlert: false);
                            update();
                          }
                        },
                        child: Text(
                          state.countDownTime == 0
                              ? "重新发送"
                              : "重新发送(${state.countDownTime})",
                          style: TextStyle(
                              fontSize: kFontSize28,
                              color: state.countDownTime == 0
                                  ? AppColors.primaryElement
                                  : const Color(0xffCCCCCC)),
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: kSize20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showLoadingDialog() {
    Get.dialog(
        barrierDismissible: false,
        Center(
          child: Container(
            width: kSize525,
            padding: EdgeInsets.fromLTRB(kSize40, kSize16, kSize40, kSize40),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kSize20),
                color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: kSize100,
                  child: Lottie.asset('assets/lottie/loading.json'),
                ),
                SizedBox(height: kSize16),
                Text(
                  "正在还款中，请稍等",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: kFontSize32,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF333333)),
                ),
                SizedBox(height: kSize16),
                Text(
                  "正在还款中，正常10-60秒内将会完成。可能需要较多时间（正常现象），您可以先退出此页面，之后再查看添加结果。",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: kFontSize24, color: const Color(0xFF888888)),
                )
              ],
            ),
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
    repaymentController.dispose();
  }
}
