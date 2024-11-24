import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:youyi_wallet/common/values/constantsSize.dart';
import 'package:youyi_wallet/pages/fastApply/controller.dart';

class HFQFastApplyBottomView extends GetView<HFQFastApplyController> {
  const HFQFastApplyBottomView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: kSize32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: controller.argeenStatusChanged,
              child: Obx(() => Icon(
                    controller.argreenStatus
                        ? Icons.check_circle
                        : Icons.circle_outlined,
                    size: kSize32,
                    color: const Color(0xFF00C427),
                  )),
            ),
            InkWell(
              onTap: controller.argeenStatusChanged,
              child: SizedBox(width: kSize16),
            ),
            Expanded(
                child: RichText(
              maxLines: 99,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '已阅读同意',
                    style: TextStyle(
                        color: const Color(0xFFCCCCCC), fontSize: kSize24),
                  ),
                  TextSpan(
                    text: '《个人信息共享授权协议》',
                    recognizer: TapGestureRecognizer()
                      ..onTap = controller.serverprotocol,
                    style: TextStyle(
                        color: const Color(0xFF888888),
                        fontSize: kSize24,
                        fontWeight: FontWeight.w800,
                        decoration: TextDecoration.underline),
                  ),
                  TextSpan(
                    text: '和',
                    style: TextStyle(
                        color: const Color(0xFFCCCCCC), fontSize: kSize24),
                  ),
                  TextSpan(
                    text: '《第三方风险提示及免责声明》',
                    recognizer: TapGestureRecognizer()
                      ..onTap = controller.secrectprotocol,
                    style: TextStyle(
                        color: const Color(0xFF888888),
                        fontSize: kSize24,
                        fontWeight: FontWeight.w800,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ))
          ],
        ),
        InkWell(
          onTap: controller.apply,
          child: Container(
            height: kSize100,
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(kSize40, kSize24, kSize40, kSize80),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kSize100 / 2),
                color: const Color(0xFF2B66FF)),
            child: Text(
              "同意协议，马上领钱",
              style: TextStyle(fontSize: kFontSize32, color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
