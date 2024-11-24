// import 'dart:nativewrappers/_internal/vm/lib/async_patch.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:youyi_wallet/common/api/loanApi.dart';
import 'package:youyi_wallet/common/index.dart';
import 'package:youyi_wallet/pages/bindBank/bindinBanCarsSate.dart';
import 'package:youyi_wallet/pages/bindBank/widgets/bindinBanCardFailed.dart';
import 'package:youyi_wallet/pages/bindBank/widgets/bindinBankCardUsedView.dart';
import 'package:youyi_wallet/pages/bindBank/widgets/bindinbankCardSuccess.dart';

enum MessageBtnStatus {
  normal, //普通状态，可点击
  fetching, //请求阶段，不可点击
  interval, //间隔状态，不可点击 短信发送成功，或者发送失败都会进入该状态，
}

class BindingBankCardController extends GetxController {
  BindingBankCardController();

  final TextEditingController banknumerController = TextEditingController();
  final TextEditingController openController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final FocusNode bankNumFocusNode = FocusNode();
  final FocusNode openNumFocusNode = FocusNode();
  final FocusNode phoneNumFocusNode = FocusNode();
  final FocusNode codeNumFocusNode = FocusNode();

  static int OutTime = 60;
  RxString sendMessageBtnTitle = "发送验证码".obs;
  int currentOutTime = 0;
  Rx<MessageBtnStatus> status = MessageBtnStatus.normal.obs;
  Color sendMessageTitleColor = const Color(0xFF00C427);
  Timer? timer;
  bool argeenStatus = false;

  RxString _name = "".obs;
  get name => _name.value;
  set name(value) => _name.value = value;
  RxString _idNum = "".obs;
  get idNum => _idNum;
  set idNum(value) => _idNum.value = value;

  @override
  void onReady() {
    super.onReady();
    Loading.show();
    LoanAPI.bindBankGetUserInfo().then((SimpleUserModel? model) {
      if (model != null) {
        name = desensitizeUsername(username: model.name ?? "");
        idNum = desensitizeCard(cardNo: model.idNum ?? "");
      }
      Loading.close();
    });
  }

  String desensitizeUsername({required String username}) {
    if (username.length < 2) {
      return username;
    } else {
      int count = username.length - 1;
      String first = username.substring(0, 1);
      String end = "*" * count;
      String result = "$first$end";
      return result;
    }
  }

  String desensitizeCard({required String cardNo}) {
    if (cardNo.length < 8) {
      return cardNo;
    } else {
      int count = cardNo.length - 7;
      String end = cardNo.substring(cardNo.length - 1, cardNo.length);
      String first = cardNo.substring(0, 6);
      String center = "*" * count;
      return "$first$center$end";
    }
  }

  @override
  void onClose() {
    super.onClose();
    timer?.cancel();
  }

  void sendMessageCodeOnTap() {
    if (GetUtils.isPhoneNumber(phoneController.text)) {
      if (status.value == MessageBtnStatus.normal) {
        sendMessageTitleColor = const Color(0x6600C427);
        //可以发送验证码
        status.value = MessageBtnStatus.fetching;
        //网络请求
        LoanAPI.sendMessageWithBindinBankCard(phone: phoneController.text).then((value) {
          if (value != null) {
            // SmartDialog.showToast("短信已发送", alignment: Alignment.center);
            //网络请求完成
            status.value = MessageBtnStatus.interval;
            currentOutTime = OutTime;
            sendMessageTitleColor = const Color(0x6600C427);
            sendMessageBtnTitle.value = "重新获取($currentOutTime)s";
            //启动倒计时
            timer?.cancel();
            timer = Timer.periodic(const Duration(seconds: 1), (t) {
              currentOutTime--;
              sendMessageBtnTitle.value = "重新获取($currentOutTime)s";
              if (currentOutTime <= 0) {
                t.cancel();
                status.value = MessageBtnStatus.normal;
                sendMessageBtnTitle.value = "重新获取";
                sendMessageTitleColor = const Color(0xFF00C427);
              }
            });
          } else {
            sendMessageTitleColor = const Color(0x6600C427);
            status.value = MessageBtnStatus.normal;
            SmartDialog.showToast("短信发送失败", alignment: Alignment.center);
          }
        });
      }
    } else {
      // Toast.show(context, message)
      SmartDialog.showToast("请输入正确的手机号", alignment: Alignment.center);
    }
  }

  void showBankList() {
    Loading.show();
    LoanAPI.getCanUsedBanList().then((HFQBankListModel? model) {
      if (model != null) {
        Get.bottomSheet(
            HFQCanUseBankListView(
              listData: model.bankList ?? [],
            ),
            ignoreSafeArea: true);
      } else {
        SmartDialog.showToast("列表获取失败", alignment: Alignment.center);
      }

      Loading.close();
    });
  }

  Future<int> sureBindinBankCard() async {
    if (banknumerController.text.isEmpty || banknumerController.text.length < 16) {
      SmartDialog.showToast("请输入银行卡号", alignment: Alignment.center);
      return 0;
    }

    if (openController.text.isEmpty) {
      SmartDialog.showToast("请输入开户行", alignment: Alignment.center);
      return 0;
    }

    if (!GetUtils.isPhoneNumber(phoneController.text)) {
      SmartDialog.showToast("请输入正确的手机号", alignment: Alignment.center);
      return 0;
    }

    if (codeController.text.isEmpty || codeController.text.length != 6) {
      SmartDialog.showToast("请输入正确的验证码", alignment: Alignment.center);
      return 0;
    }

    if (!argeenStatus) {
      SmartDialog.showToast("请阅读并同意《代扣服务协议书》", alignment: Alignment.center);
      return 0;
    }
    HFQBindinBancardListRequetModel requestModel = HFQBindinBancardListRequetModel();
    requestModel.bankCardNum = banknumerController.text;
    requestModel.openBank = openController.text;
    requestModel.reserveMobile = phoneController.text;
    var data = {"dynamicCode": codeController.text, "userBankInfoEntity": requestModel.toJson()};
    _showLoadingDialog();
    var result = await LoanAPI.binDinCard(requestJson: data);
    if (result != null && result == 0) {
      Get.back();
      // if (value != null) {
      Get.dialog(const HFQBindinbankCardSuccessView()); //绑卡成功
      Future.delayed(const Duration(seconds: 2), () {
        Get.back();
        Get.back();
      });
      return 1;
    } else {
      Get.back();
      Get.dialog(barrierDismissible: false, const HFQBindinBankCardFailedView()); //绑卡失败
      return 0;
    }
  }

  String showBankName() {
    return openController.text;
  }

  String showbankNum() {
    return banknumerController.text.substring(banknumerController.text.length - 6, banknumerController.text.length - 1);
  }

  String banNumDetail() {
    return banknumerController.text;
  }

  void onTapProtocol() {
    Map data = {
      "agreement": [
        {"label": "hfq_dkfwxy", "type": "1"}
      ]
    };
    Get.toNamed(RouteNames.htmlpage, arguments: {"data": data});
  }

  _showLoadingDialog() {
    Get.dialog(
        barrierDismissible: true,
        Center(
          child: Container(
            width: kSize525,
            height: kSize436,
            padding: EdgeInsets.fromLTRB(kSize40, kSize16, kSize40, kSize40),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(kSize20), color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: kSize200,
                  child: Lottie.asset('assets/lottie/loading.json'),
                ),
                SizedBox(height: kSize16),
                Text(
                  "银行卡正在绑定中，请稍等",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: kFontSize32, fontWeight: FontWeight.w800, color: const Color(0xFF333333)),
                ),
                SizedBox(height: kSize16),
                Text(
                  "正在绑定中，正常10-60秒内将会完成。某些银行卡添加可能需要较多时间（正常现象），您可以先退出此页面，之后再查看添加结果。",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: kFontSize24, color: const Color(0xFF888888)),
                )
              ],
            ),
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    banknumerController.dispose();
    openController.dispose();
    phoneController.dispose();
    codeController.dispose();
    bankNumFocusNode.dispose();
    openNumFocusNode.dispose();
    phoneNumFocusNode.dispose();
    codeNumFocusNode.dispose();
  }
}
