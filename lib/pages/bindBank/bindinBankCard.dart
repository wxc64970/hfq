import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';
import 'package:youyi_wallet/pages/bindBank/bindinController.dart';
import 'package:youyi_wallet/pages/confirmationloan/index.dart';

class HFQBindinBankCardpage extends StatefulWidget {
  const HFQBindinBankCardpage({super.key});

  @override
  State<HFQBindinBankCardpage> createState() => _HFQBindinBankCardpageState();
}

class _HFQBindinBankCardpageState extends State<HFQBindinBankCardpage> {
  late BindingBankCardController pageController;
  late ConfirmationloanController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<ConfirmationloanController>();
    pageController = Get.put(BindingBankCardController());
    // pageController.confirmationloanController = controller;
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(
          title: "添加银行卡",
          onPressed: () {
            Get.back();
          },
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: pagebg(
              child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: kSize230,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(kSize20), color: const Color(0xFFEEEEEE)),
                            child: Column(
                              children: [
                                Container(
                                  height: kSize140,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(kSize20), color: const Color(0xFFFFFFFF)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Obx(() => Text(
                                            pageController.name,
                                            style: TextStyle(fontSize: kFontSize48, fontWeight: FontWeight.bold, color: const Color(0xFF333333)),
                                          )),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0, kSize42, 0, kSize42),
                                        width: kSize2,
                                        color: const Color(0x80CCCCCC),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          //
                                          Text(
                                            "我要借(元)",
                                            style: TextStyle(fontSize: kFontSize42, fontWeight: FontWeight.w500, color: const Color(0xFF333333)),
                                          ),
                                          Text(
                                            "${controller.state.amount}",
                                            style: TextStyle(fontSize: kFontSize32, fontWeight: FontWeight.w500, color: const Color(0xFF333333)),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                    child: Center(
                                        child: Obx(
                                  () => Text("身份证号:${pageController.idNum}", style: TextStyle(fontSize: kFontSize28, color: const Color(0xFF888888))),
                                )))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: kSize80,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "请绑定实体银行卡，以免借款失败",
                                    style: TextStyle(fontSize: kFontSize24, color: const Color(0xFFCCCCCC)),
                                  ),
                                ),
                                InkWell(
                                  onTap: pageController.showBankList,
                                  child: Text(
                                    "支持银行列表",
                                    style: TextStyle(fontSize: kFontSize24, color: const Color(0xFF2B66FF)),
                                  ),
                                ),
                                SizedBox(width: kSize10),
                                Icon(
                                  Icons.menu,
                                  size: kSize32,
                                  color: const Color(0xFF2B66FF),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(kSize32, kSize40, kSize32, kSize40),
                            height: kSize560,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(kSize20)),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: kSize32),
                                  height: kSize100,
                                  decoration: BoxDecoration(color: Color(0xFFF8F8F8), borderRadius: BorderRadius.circular(kSize20)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                        "银行卡号",
                                        style: TextStyle(fontSize: kFontSize28, color: const Color(0xff333333), fontWeight: FontWeight.w600, height: 1),
                                      )),
                                      Expanded(
                                        child: TextField(
                                            controller: pageController.banknumerController,
                                            keyboardType: TextInputType.number,
                                            textAlign: TextAlign.start,
                                            focusNode: pageController.bankNumFocusNode,
                                            inputFormatters: [HFQTextFieldFormatter(maxLength: 19, style: InputStyle.onlyNum)],
                                            decoration: InputDecoration(
                                              hintText: "请输入银行卡",
                                              border: InputBorder.none,
                                              isCollapsed: true,
                                              hintStyle: TextStyle(color: const Color(0xff888888), fontSize: kFontSize24),
                                              // focusedBorder: OutlineInputBorder(
                                              //   borderSide: BorderSide(color: Colors.blue), // 设置聚焦时边框颜色，也会影响光标颜色
                                              // ),
                                            ),
                                            style: TextStyle(fontSize: kFontSize24, color: Colors.black)),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: kSize24),
                                Container(
                                  padding: EdgeInsets.only(left: kSize32),
                                  height: kSize100,
                                  decoration: BoxDecoration(color: const Color(0xFFF8F8F8), borderRadius: BorderRadius.circular(kSize20)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                        "开户行",
                                        style: TextStyle(fontSize: kFontSize28, color: const Color(0xff333333), fontWeight: FontWeight.w600, height: 1),
                                      )),
                                      Expanded(
                                        child: TextField(
                                            controller: pageController.openController,
                                            keyboardType: TextInputType.text,
                                            textAlign: TextAlign.start,
                                            focusNode: pageController.openNumFocusNode,
                                            inputFormatters: [HFQTextFieldFormatter(maxLength: 100)],
                                            decoration: InputDecoration(
                                              hintText: "中国银行xx支行",
                                              border: InputBorder.none,
                                              isCollapsed: true,
                                              hintStyle: TextStyle(color: const Color(0xff888888), fontSize: kFontSize24),
                                              // focusedBorder: OutlineInputBorder(
                                              //   borderSide: BorderSide(color: Colors.blue), // 设置聚焦时边框颜色，也会影响光标颜色
                                              // ),
                                            ),
                                            style: TextStyle(fontSize: kFontSize24, color: Colors.black)),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: kSize24),
                                Container(
                                  padding: EdgeInsets.only(left: kSize32),
                                  height: kSize100,
                                  decoration: BoxDecoration(color: const Color(0xFFF8F8F8), borderRadius: BorderRadius.circular(kSize20)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                        "银行预留手机号",
                                        style: TextStyle(fontSize: kFontSize28, color: const Color(0xff333333), fontWeight: FontWeight.w600, height: 1),
                                      )),
                                      Expanded(
                                        child: TextField(
                                            controller: pageController.phoneController,
                                            keyboardType: TextInputType.number,
                                            textAlign: TextAlign.start,
                                            focusNode: pageController.phoneNumFocusNode,
                                            inputFormatters: [HFQTextFieldFormatter(maxLength: 11, style: InputStyle.onlyNum)],
                                            decoration: InputDecoration(
                                              hintText: "请输入银行卡预留手机号",
                                              border: InputBorder.none,
                                              isCollapsed: true,
                                              hintStyle: TextStyle(color: const Color(0xff888888), fontSize: kFontSize24),
                                              // focusedBorder: OutlineInputBorder(
                                              //   borderSide: BorderSide(color: Colors.blue), // 设置聚焦时边框颜色，也会影响光标颜色
                                              // ),
                                            ),
                                            style: TextStyle(fontSize: kFontSize24, color: Colors.black)),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: kSize24),
                                Container(
                                  padding: EdgeInsets.only(left: kSize32),
                                  height: kSize100,
                                  decoration: BoxDecoration(color: const Color(0xFFF8F8F8), borderRadius: BorderRadius.circular(kSize20)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                        "验证码",
                                        style: TextStyle(fontSize: kFontSize28, color: const Color(0xff333333), fontWeight: FontWeight.w600, height: 1),
                                      )),
                                      Expanded(
                                        child: TextField(
                                            controller: pageController.codeController,
                                            keyboardType: TextInputType.number,
                                            textAlign: TextAlign.start,
                                            focusNode: pageController.codeNumFocusNode,
                                            inputFormatters: [HFQTextFieldFormatter(maxLength: 6, style: InputStyle.onlyNum)],
                                            decoration: InputDecoration(
                                              hintText: "请输入验证码",
                                              border: InputBorder.none,
                                              isCollapsed: true,
                                              hintStyle: TextStyle(color: const Color(0xff888888), fontSize: kFontSize24),
                                              // focusedBorder: OutlineInputBorder(
                                              //   borderSide: BorderSide(color: Colors.blue), // 设置聚焦时边框颜色，也会影响光标颜色
                                              // ),
                                            ),
                                            style: TextStyle(fontSize: kFontSize24, color: Colors.black)),
                                      ),
                                      Obx(() => InkWell(
                                            onTap: () {
                                              FocusScope.of(context).requestFocus(FocusNode()); //收起键盘
                                              pageController.sendMessageCodeOnTap();
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: double.infinity,
                                              padding: EdgeInsets.fromLTRB(kSize32, 0, kSize32, 0),
                                              // color: Colors.red,
                                              child: pageController.status.value == MessageBtnStatus.fetching
                                                  ? CupertinoActivityIndicator(color: pageController.sendMessageTitleColor)
                                                  : Text(
                                                      pageController.sendMessageBtnTitle.value,
                                                      style: TextStyle(color: pageController.sendMessageTitleColor),
                                                    ),
                                            ),
                                          ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
              HFQBindinBankCardBottomView(
                argreenOnTap: (status) {
                  pageController.argeenStatus = status;
                },
                comfireBindinTap: () {
                  FocusScope.of(context).requestFocus(FocusNode()); //收起键盘
                  pageController.sureBindinBankCard().then((value) {
                    if (value == 1) {
                      controller.state.hasBank.value = true;
                      controller.state.bankName.value = pageController.showBankName();
                      controller.state.bankNum.value = pageController.showbankNum();
                      controller.state.bankNumAll = pageController.banNumDetail();
                    }
                  });
                },
                protocolOnTap: pageController.onTapProtocol,
              )
            ],
          )),
        ));
  }
}

class HFQBindinBankCardBottomView extends StatelessWidget {
  final Function(bool status)? argreenOnTap;
  final Function()? protocolOnTap;
  final Function()? comfireBindinTap;
  bool status = false;
  StreamController controller = StreamController();
  HFQBindinBankCardBottomView({super.key, this.argreenOnTap, this.protocolOnTap, this.comfireBindinTap});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                status = !status;
                controller.add(status);
                if (argreenOnTap != null) {
                  argreenOnTap!(status);
                }
              },
              child: StreamBuilder(
                  stream: controller.stream,
                  builder: (_, snapshot) {
                    if (snapshot.hasData) {
                      bool tempStatus = snapshot.data as bool;
                      return Icon(
                        tempStatus ? Icons.check_circle : Icons.circle_outlined,
                        size: kSize32,
                        color: const Color(0xFF00C427),
                      );
                    }
                    return Icon(
                      Icons.circle_outlined,
                      size: kSize32,
                      color: const Color(0xFF00C427),
                    );
                  }),
            ),
            SizedBox(width: kSize16),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '本人已阅读同意',
                    style: TextStyle(color: const Color(0xFFCCCCCC), fontSize: kSize24),
                  ),
                  TextSpan(
                    text: '《代扣服务协议》',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        if (protocolOnTap != null) {
                          protocolOnTap!();
                        }
                      },
                    style: TextStyle(color: const Color(0xFF888888), fontSize: kSize24, fontWeight: FontWeight.w800, decoration: TextDecoration.underline),
                  ),
                ],
              ),
            )
          ],
        ),
        InkWell(
          onTap: comfireBindinTap,
          child: Container(
            height: kSize100,
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(kSize40, kSize24, kSize40, kSize10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(kSize100 / 2), color: const Color(0xFF2B66FF)),
            child: Text(
              "确认绑卡",
              style: TextStyle(fontSize: kFontSize32, color: Colors.white),
            ),
          ),
        )
      ],
    ));
  }
}

enum InputStyle {
  onlyNum, //RegExp(r'^[0-9]$')
  letter, //RegExp(r'^[a-zA-Z]$')
  chiness, //RegExp(r'^[\u4e00-\u9fa5]+$')
  iDCard, //RegExp(r'^\d{17}[\dXx]$')
  email, //RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
  custom, //自定义，需要传入RegExp
}

class HFQTextFieldFormatter extends TextInputFormatter {
  final int maxLength;
  final RegExp? regExp;
  final InputStyle style;
  HFQTextFieldFormatter({this.maxLength = 11, this.style = InputStyle.custom, this.regExp});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;
    if (newText.length > maxLength) {
      return oldValue;
    } else {
      RegExp? exp = _returnRegExt(regExp);
      if (exp != null) {
        if (exp.hasMatch(newText)) {
          return oldValue;
        }
        return newValue;
      } else {
        return newValue;
      }
    }
  }

  RegExp? _returnRegExt(RegExp? custonRegExp) {
    switch (style) {
      case InputStyle.onlyNum:
        return RegExp(r'[^0-9]');
      case InputStyle.letter:
        return RegExp(r'[^a-zA-Z]');
      case InputStyle.chiness:
        return RegExp(r'^[\u4e00-\u9fa5]+$');
      case InputStyle.email:
        return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      case InputStyle.iDCard:
        return RegExp(r'^\d{17}[\dXx]$');
      case InputStyle.custom:
        return custonRegExp;
    }
  }
}
