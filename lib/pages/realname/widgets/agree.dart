import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

import '../index.dart';

class agreeWidget extends GetView<RealnameController> {
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
            style: TextStyle(color: const Color(0xffCCCCCC), fontSize: kFontSize24),
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
                text: "《人脸核身服务个人信息处理授权协议》",
                style: TextStyle(
                  color: AppColors.primaryElement,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Map data = {
                      "agreement": [
                        {"label": "hfq_rlhs", "type": "1"}
                      ]
                    };
                    Get.toNamed(RouteNames.htmlpage, arguments: {"data": data});
                  },
              ),
            ],
          ),
        )),
      ],
    );
  }
}
