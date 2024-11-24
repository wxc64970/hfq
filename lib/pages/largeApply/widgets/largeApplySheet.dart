import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/values/constantsSize.dart';
import 'package:youyi_wallet/pages/largeApply/largeApplyController.dart';

class HFQLargeApplySheetView extends GetView<HFQLargeApplyController> {
  const HFQLargeApplySheetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 864.w,
      padding: EdgeInsets.only(left: kSize32, right: kSize32),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(kSize20),
              topRight: Radius.circular(kSize20)),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffC5DEFF), Color(0xffF7F7F7), Color(0xffF7F7F7)],
          )),
      child: Column(
        children: [
          SizedBox(height: kSize32),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: kSize40,
                  height: kSize40,
                  alignment: Alignment.center,
                  child: const Icon(Icons.close),
                ),
              )
            ],
          ),
          Text(
            "${Random().nextInt(4) + 95}%用户已完成借款申请",
            style: TextStyle(
                fontSize: kSize32,
                fontWeight: FontWeight.w700,
                color: const Color(0xFFD84309)),
          ),
          SizedBox(height: kSize32),
          SizedBox(
            width: double.infinity,
            child: RichText(
              maxLines: 100,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '特别提示：',
                    style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: kSize28,
                        fontWeight: FontWeight.w800),
                  ),
                  TextSpan(
                    text:
                        '惠分期根据您的资质，已匹配到第三方合作贷款机构(${controller.companyName})，请您申请前仔细阅读 其中特别授权协议如下:',
                    style: TextStyle(
                        color: const Color(0xFF888888), fontSize: kSize28),
                  ),
                  TextSpan(
                    text: '《个人信息共享授权协议》',
                    recognizer: TapGestureRecognizer()
                      ..onTap = controller.userInfoShareProtocol,
                    style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: kSize28,
                        fontWeight: FontWeight.w800),
                  ),
                  TextSpan(
                    text: '《第三方风险提示及免责声明》',
                    recognizer: TapGestureRecognizer()
                      ..onTap = controller.loanInfoProtocol,
                    style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: kSize28,
                        fontWeight: FontWeight.w800),
                  ),
                  TextSpan(
                    text: '其中特别授权协议如下:',
                    style: TextStyle(
                        color: const Color(0xFF888888), fontSize: kSize28),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: kSize32),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(bottom: kSize24),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kSize20),
                color: Colors.white),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: kSize24),
                Text(
                  "《个人信息共享授权书》",
                  style: TextStyle(
                      fontSize: kSize28,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF333333)),
                ),
                SizedBox(height: kSize16),
                Padding(
                  padding: EdgeInsets.only(left: kSize24, right: kSize24),
                  child: Text(
                    "        保护用户个人信息是本平台的一项基本原则。本平台将按照本声明及《隐私政策》的规定收集、使用、储存和分享您的个人信息。",
                    style: TextStyle(
                        fontSize: kSize24,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF888888)),
                  ),
                ),
                SizedBox(height: kSize16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.fromLTRB(kSize16, kSize8, kSize16, kSize8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(kSize10),
                              bottomLeft: Radius.circular(kSize10)),
                          color: const Color(0x1A2B66FF)),
                      child: InkWell(
                        onTap: controller.userInfoShareProtocol,
                        child: Row(
                          children: [
                            Text(
                              "完整协议",
                              style: TextStyle(
                                  fontSize: kSize24,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF2B66FF)),
                            ),
                            Icon(Icons.arrow_forward_ios_outlined,
                                size: kSize24, color: const Color(0xFF2B66FF))
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: kSize32),
          InkWell(
            onTap: controller.applyLarge,
            child: Container(
              height: kSize88,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kSize88 / 2),
                  color: const Color(0xFF2B66FF)),
              child: Text(
                "同意协议 立即拿钱",
                style: TextStyle(
                    fontSize: kFontSize28,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFFFFFFF)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
