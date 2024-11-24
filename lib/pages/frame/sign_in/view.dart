import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

import 'index.dart';

class SignInPage extends GetView<SignInController> {
  // 登录表单
  Widget _buildInputForm() {
    return Container(
      width: Get.width,
      child: Column(
        children: [
          inputIconPhoneEdit(
              controller: controller.phoneController,
              keyboardType: TextInputType.number,
              focusNode: controller.phoneFocusNode,
              height: 104,
              icon: "assets/images/phone.png",
              borderRadius: 100,
              decoration: InputDecoration(
                hintText: "请输入手机号",
                border: InputBorder.none,
                isCollapsed: true,
                hintStyle: TextStyle(
                    color: const Color(0xff888888), fontSize: kFontSize28),
                // focusedBorder: OutlineInputBorder(
                //   borderSide: BorderSide(color: Colors.blue), // 设置聚焦时边框颜色，也会影响光标颜色
                // ),
              ),
              style: TextStyle(fontSize: kFontSize28, color: Colors.black)),
        ],
      ),
    );
  }

  // 注册按钮
  Widget _buildSignupButton() {
    return btnFlatButtonWidget(
        onPressed: controller.handleNavSignUp,
        width: Get.width,
        height: 88,
        title: "登录查看额度",
        style: TextStyle(color: Colors.white, fontSize: kFontSize32, height: 1),
        radius: 100);
  }

  Widget agreeWidget() {
    return InkWell(
      onTap: () {
        print(12123);
      },
      child: Row(
        children: [
          SizedBox(
            width: kSize32,
            height: kSize32,
            child: Obx(() => Checkbox(
                value: controller.state.checkboxData,
                onChanged: controller.onChanged,
                activeColor: AppColors.primaryElement,
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                side: BorderSide(color: Color(0xffCCCCCC), width: kSize3),
                shape: CircleBorder())),
          ),
          SizedBox(
            width: kSize20,
          ),
          Expanded(
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                    color: const Color(0xffCCCCCC), fontSize: kFontSize22),
                children: [
                  TextSpan(
                    text: "登录即代表您同意",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        controller.state.checkboxData =
                            !controller.state.checkboxData;
                      },
                  ),
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
                        Get.toNamed(RouteNames.htmlpage,
                            arguments: {"data": data});
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
                        Get.toNamed(RouteNames.htmlpage,
                            arguments: {"data": data});
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
                        Get.toNamed(RouteNames.htmlpage,
                            arguments: {"data": data});
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.phoneFocusNode.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
            child: Stack(children: [
          Image.asset(
            "assets/images/loginbg.png",
            width: Get.width,
            height: Get.height,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.only(left: kSize64, right: kSize64),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: kSize260,
                      ),
                      Text(
                        "欢迎登录惠分期",
                        style: TextStyle(
                            fontSize: kFontSize64,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff333333),
                            height: 1),
                      ),
                      SizedBox(
                        height: kSize20,
                      ),
                      Text(
                        "让借钱更简单",
                        style: TextStyle(
                            fontSize: kFontSize36,
                            color: Color(0xff888888),
                            height: 1),
                      ),
                      SizedBox(
                        height: kSize240,
                      ),
                      _buildInputForm(),
                      SizedBox(
                        height: kSize16,
                      ),
                      Text(
                        "未注册手机号验证后自动创建惠分期账号",
                        style: TextStyle(
                            color: Color(0xffCCCCCC),
                            fontSize: kFontSize24,
                            height: 1),
                      ),
                      SizedBox(
                        height: kSize80,
                      ),
                      _buildSignupButton()
                    ],
                  ),
                ),
                agreeWidget(),
                SizedBox(
                  height: kSize100,
                )
              ],
            ),
          )
        ])),
      ),
    );
  }
}
