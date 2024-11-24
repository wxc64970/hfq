import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

import '../index.dart';

class agreeWidget extends GetView<FacesuccessController> {
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    controller.state.checkboxData = !controller.state.checkboxData;
                  },
                  child: Text(
                    '本人已阅读同意',
                    style: TextStyle(color: const Color(0xffCCCCCC), fontSize: kFontSize24),
                  ),
                ),
                SizedBox(
                  height: kSize10,
                ),
                InkWell(
                  onTap: controller.handleUserAgreement,
                  child: Text(
                    "《个人信息处理授权书》",
                    style: TextStyle(color: Color(0xff888888), fontSize: kFontSize24),
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
