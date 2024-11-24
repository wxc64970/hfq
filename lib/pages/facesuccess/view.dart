import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

import 'index.dart';
// import 'widgets/widgets.dart';

class FacesuccessPage extends GetView<FacesuccessController> {
  const FacesuccessPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return pagebg(
        child: Column(
      children: [
        Expanded(
          child: SizedBox(
            height: Get.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/hfq_38.png",
                  width: kSize400,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: kSize32,
                ),
                Text(
                  "人脸识别成功",
                  style: TextStyle(fontSize: kFontSize32, fontWeight: FontWeight.w500, color: Color(0xff00C427)),
                )
              ],
            ),
          ),
        ),
        // agreeWidget(),
        SizedBox(
          height: kSize24,
        ),
        btnFlatButtonWidget(
            title: "下一步", onPressed: controller.handleNext, height: 104, width: Get.width, style: TextStyle(fontSize: kFontSize32, color: Colors.white, height: 1, fontWeight: FontWeight.w500)),
        SizedBox(
          height: kSize80,
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FacesuccessController>(
      builder: (_) {
        return Scaffold(
          appBar: appBar(
            title: "人脸识别",
            onPressed: () {
              Get.back();
            },
          ),
          body: _buildView(),
        );
      },
    );
  }
}
