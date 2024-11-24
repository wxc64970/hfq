import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

import '../index.dart';

class agreeWidget extends GetView<BasicinformationController> {
  const agreeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
                fontSize: kFontSize26,
                fontWeight: FontWeight.normal,
                color: Color(0xff333333),
              ),
              children: [
                TextSpan(
                  text: "本人已阅读同意",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      controller.state.checkboxData = !controller.state.checkboxData;
                    },
                ),
                TextSpan(
                  text: "《个人信息授权承诺协议》",
                  style: TextStyle(
                    color: AppColors.primaryElement,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Map data = {
                        "agreement": [
                          {"label": "hfq_grxxsqcns", "type": "2"}
                        ]
                      };
                      Get.toNamed(RouteNames.htmlpage, arguments: {"data": data});
                    },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
