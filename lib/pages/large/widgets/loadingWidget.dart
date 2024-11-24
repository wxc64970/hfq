import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:lottie/lottie.dart';
import 'package:youyi_wallet/common/index.dart';

import '../index.dart';

class LargeListWidget extends GetView<LargeController> {
  const LargeListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return pagebg(
        child: Column(
      children: [
        SizedBox(height: MediaQuery.of(Get.context!).padding.top + kSize40),
        Text(
          "审核中",
          style: TextStyle(fontSize: kFontSize32, color: Color(0xff333333), fontWeight: FontWeight.w600, height: 1),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: kSize200,
                child: Lottie.asset('assets/lottie/loading.json'),
              ),
              SizedBox(height: kSize16),
              Obx(() => Text(
                    "${controller.state.progress}%",
                    style: TextStyle(fontSize: kFontSize42, color: AppColors.primaryElement, fontWeight: FontWeight.w600, height: 1),
                  )),
              SizedBox(
                height: kSize8,
              ),
              Text(
                "额度审核中...",
                style: TextStyle(fontSize: kFontSize32, color: AppColors.primaryElement, fontWeight: FontWeight.w600, height: 1),
              ),
              SizedBox(
                height: kSize16,
              ),
              Text(
                "预计审核时间2-7秒",
                style: TextStyle(fontSize: kFontSize28, color: Color(0xff888888), fontWeight: FontWeight.w400, height: 1),
              )
            ],
          ),
        )
      ],
    ));
  }
}
