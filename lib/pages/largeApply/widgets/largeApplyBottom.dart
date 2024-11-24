import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/values/constantsSize.dart';
import 'package:youyi_wallet/pages/largeApply/largeApplyController.dart';

class HFQLargeApplyPageBottom extends GetView<HFQLargeApplyController> {
  const HFQLargeApplyPageBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                  width: kSize32,
                  height: kSize32,
                  'assets/images/hfq_large_apply_info_safe.png'),
              SizedBox(width: kSize16),
              Text(
                "此信息已智能加密，隐私严格保密",
                style: TextStyle(
                    fontSize: kFontSize24, color: const Color(0xFFCCCCCC)),
              )
            ],
          ),
        ),
        SizedBox(height: kSize32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: controller.argennBtnPressed,
              child: Obx(() => Icon(
                    !controller.argreenStatus
                        ? Icons.circle_outlined
                        : Icons.check_circle,
                    size: kSize32,
                    color: const Color(0xFF00C427),
                  )),
            ),
            InkWell(
              onTap: controller.argennBtnPressed,
              child: SizedBox(width: kSize16),
            ),
            Expanded(
                child: RichText(
              maxLines: 100,
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        '提示：惠分期根据您的资质，匹配到第三方合作贷款机构，您同意授权我们将您填写的个人信息共享给（${controller.companyName}）处理，请您申请前仔细阅读',
                    style: TextStyle(
                        color: const Color(0xFFCCCCCC), fontSize: kSize24),
                  ),
                  TextSpan(
                    text: '《个人信息共享授权协议》',
                    recognizer: TapGestureRecognizer()
                      ..onTap = controller.userInfoShareProtocol,
                    style: TextStyle(
                        color: const Color(0xFF888888),
                        fontSize: kSize24,
                        fontWeight: FontWeight.w800,
                        decoration: TextDecoration.underline),
                  ),
                  TextSpan(
                    text: '《第三方风险提示及免责声明》',
                    recognizer: TapGestureRecognizer()
                      ..onTap = controller.loanInfoProtocol,
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
          onTap: controller.readApply,
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
