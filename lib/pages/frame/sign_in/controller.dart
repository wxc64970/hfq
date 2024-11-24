import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

import 'index.dart';

class SignInController extends GetxController {
  final state = SignInState();

  SignInController();

  // 手机号控制器
  final TextEditingController phoneController = TextEditingController();
  final FocusNode phoneFocusNode = FocusNode();

  // 点击登录
  handleNavSignUp() async {
    state.isOnce = false;
    phoneFocusNode.unfocus();
    if (!state.checkboxData) {
      agreementWidget();
      return;
    }
    update();
    if (phoneController.text.trim().isEmpty) {
      SmartDialog.showToast("请输入手机号");
      return;
    }
    if (!validatePhoneNumber(phoneController.text)) {
      SmartDialog.showToast("请输入正确的手机号码");
      return;
    }
    phoneFocusNode.unfocus();
    if (!state.isCountingDown) {
      state.times = 60;
      var res = await getTelCode();
      // if (res) {
      //   SmartDialog.showToast("验证码发送成功！");
      // } else {
      //   return;
      // }
    }
    toVerificationCode();

    // Get.toNamed(AppRoutes.SIGN_UP);
  }

  //获取验证码接口
  getTelCode() async {
    Loading.show();
    TelCodeRequestEntity params = TelCodeRequestEntity(mobile: phoneController.text);
    var res = await LoginAPI.getTelCode(params: params);
    Loading.close();
    if (res['code'] == 0) {
      return true;
    } else {
      return false;
    }
  }

  void startCountdown() {
    state.isCountingDown = true;
    update();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (state.times > 0) {
        state.times--;
        update();
      } else {
        state.isCountingDown = false;
        timer.cancel();
        update();
      }
    });
  }

  //验证码弹窗
  toVerificationCode() {
    if (!state.isCountingDown) {
      startCountdown();
    }
    SmartDialog.show(
      clickMaskDismiss: false,
      builder: (context) => Center(
        child: Container(
          width: kSize560,
          height: kSize480,
          padding: EdgeInsets.only(left: kSize46, right: kSize46),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(kSize20)),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  SmartDialog.dismiss();
                },
                child: SizedBox(
                  width: Get.width,
                  height: kSize60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        "assets/images/hfq_18.png",
                        width: kSize48,
                        fit: BoxFit.contain,
                      )
                    ],
                  ),
                ),
              ),
              Text(
                "请输入验证码",
                style: TextStyle(fontSize: kFontSize32, color: Color(0xff333333)),
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
                  onPressed: handleSignIn,
                  width: Get.width,
                  height: 80,
                  title: "确认",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: kFontSize32,
                    height: 1,
                  ),
                  radius: 100,
                  gbColor: state.isOnce ? AppColors.primaryElement : AppColors.primaryElement.withOpacity(0.3))),
              SizedBox(
                height: kSize28,
              ),
              Obx(() => InkWell(
                    onTap: () async {
                      if (!state.isCountingDown) {
                        var res = await getTelCode();
                        // if (res) {
                        //   SmartDialog.showToast("验证码发送成功！");
                        // } else {
                        //   return;
                        // }
                        state.times = 60;
                        update();
                        startCountdown();
                      }
                    },
                    child: Text(
                      state.times == 0 ? "重新发送" : "重新发送(${state.times})",
                      style: TextStyle(fontSize: kFontSize28, color: state.times == 0 ? AppColors.primaryElement : Color(0xffCCCCCC)),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  //协议弹窗
  agreementWidget() {
    SmartDialog.show(
        builder: (context) {
          return Container(
            width: kSize750,
            height: Get.height,
            padding: EdgeInsets.only(left: kSize64, right: kSize64),
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: kSize40,
                        ),
                        Center(
                          child: Image.asset(
                            "assets/images/hfq_01.png",
                            width: kSize750,
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          height: kSize60,
                        ),
                        Text.rich(
                          TextSpan(
                            style: TextStyle(
                              fontSize: kFontSize26,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff333333),
                            ),
                            children: [
                              const TextSpan(text: "感谢您使用惠分期!惠分期非常重视您的个人信息和隐私权的保护，为了更好的保护您的权益，并且遵守相关监管要求，我们将通过"),
                              TextSpan(
                                text: "《注册服务协议》",
                                style: TextStyle(
                                  color: AppColors.primaryElement,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Map data = {
                                      "agreement": [
                                        {"label": "hfq_zcfwxy", "type": "1"}
                                      ]
                                    };
                                    Get.toNamed(RouteNames.htmlpage, arguments: {"data": data});
                                  },
                              ),
                              const TextSpan(text: " 和 "),
                              TextSpan(
                                text: "《隐私政策》",
                                style: TextStyle(
                                  color: AppColors.primaryElement,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Map data = {
                                      "agreement": [
                                        {"label": "hfq_yszc", "type": "1"}
                                      ]
                                    };
                                    Get.toNamed(RouteNames.htmlpage, arguments: {"data": data});
                                  },
                              ),
                              const TextSpan(text: " 和 "),
                              TextSpan(
                                text: "《风险提示告知书》",
                                style: TextStyle(
                                  color: AppColors.primaryElement,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Map data = {
                                      "agreement": [
                                        {"label": "hfq_fxtsgzs", "type": "1"}
                                      ]
                                    };
                                    Get.toNamed(RouteNames.htmlpage, arguments: {"data": data});
                                  },
                              ),
                              const TextSpan(text: "向您提示风险以及说明我们将如何收集、使用、存储、保护您的信息，要点如下:"),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: kSize30,
                        ),
                        Text(
                          "1.我们将在账户注册、借款授信、借款支用等业务场景中收集、使用、共享并保存您的个人信息包括姓名、手机号码、身份信息、银行卡信息等;",
                          style: TextStyle(
                            fontSize: kFontSize26,
                            color: Color(0xff333333),
                          ),
                        ),
                        SizedBox(
                          height: kSize30,
                        ),
                        Text(
                          "2.在您使用服务的的过程中，我们将根据不同的业务场景申请获取您相关的必要的系统权限，如为了确保您的账号登录安全，我们需要收集您的【设备识别码】:为防止您的个人信息被获取，保护您的账户安全，我们需要收集您的【设备信息】等。您有权拒绝授权或取消授权，只是拒绝或取消授权后您将无法使用相关功能;",
                          style: TextStyle(
                            fontSize: kFontSize26,
                            color: Color(0xff333333),
                          ),
                        ),
                        SizedBox(
                          height: kSize30,
                        ),
                        Text(
                          "3.我们将采用行业标准安全防护措施来保护您的信息安全。为方便您的查阅，您可在用户注册登录界面，以及在“我的-设置-关于我们”中查看中完整版相关协议内容。",
                          style: TextStyle(
                            fontSize: kFontSize26,
                            color: Color(0xff333333),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: kSize60, bottom: kSize60),
                  child: Column(
                    children: [
                      SizedBox(
                        height: kSize30,
                      ),
                      btnFlatButtonWidget(
                          onPressed: () {
                            SmartDialog.dismiss();
                            state.checkboxData = true;
                          },
                          width: Get.width,
                          height: 88,
                          title: "同意",
                          style: TextStyle(color: Colors.white, fontSize: kFontSize32, height: 1),
                          radius: 100),
                      SizedBox(
                        height: kSize46,
                      ),
                      InkWell(
                        onTap: () {
                          SmartDialog.dismiss();
                        },
                        child: Text(
                          "不同意",
                          style: TextStyle(fontSize: kFontSize32, color: Color(0xff888888)),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
        clickMaskDismiss: false,
        backDismiss: false);
  }

  //同意协议变化
  onChanged(value) {
    state.checkboxData = value;
    update();
  }

  // 执行登录操作
  handleSignIn() async {
    phoneFocusNode.unfocus();
    if (!state.isOnce) return;
    Loading.show();
    RegisterRequestEntity params = RegisterRequestEntity(mobile: phoneController.text, msgCode: state.authCode);
    print(params.toJson());
    var res = await LoginAPI.register(params: params);
    if (res != null) {
      print(res.token);
      await UserStore.to.setToken(res.token!);
      await UserStore.to.getUserStatus();
      UserStore.to.saveProfile(MaskPhone.maskPhoneNumber(phoneController.text));
      Get.offAndToNamed(RouteNames.application);
    }
    Loading.close();
    // UserStore.to.saveProfile(userProfile);

    // Get.offAndToNamed(AppRoutes.Application);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    var isFistOpen = StorageService.to.getBool(STORAGE_DEVICE_FIRST_OPEN_KEY);
    if (isFistOpen == false) {
      StorageService.to.setBool(STORAGE_DEVICE_FIRST_OPEN_KEY, true);
      agreementWidget();
    }
  }

  @override
  void dispose() {
    phoneController.dispose();
    phoneFocusNode.dispose();
    super.dispose();
  }
}
