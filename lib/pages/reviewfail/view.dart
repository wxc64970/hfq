import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

import 'index.dart';

class ReviewfailPage extends GetView<ReviewfailController> {
  const ReviewfailPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return pagebg(
        child: Column(
      children: [
        SizedBox(
          height: kSize240,
        ),
        Image.asset(
          "assets/images/hfq_43.png",
          width: kSize360,
          fit: BoxFit.contain,
        ),
        SizedBox(
          height: kSize36,
        ),
        Obx(() => Text(
              controller.state.content,
              style: TextStyle(fontSize: kFontSize32, fontWeight: FontWeight.w600, height: 1, color: Color(0xffD84309)),
            )),
        SizedBox(
          height: kSize360,
        ),
        InkWell(
          onTap: controller.backHome,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: kSize22, horizontal: kSize68),
            decoration: BoxDecoration(color: Color(0xff2B66FF).withOpacity(0.1), borderRadius: BorderRadius.circular(kSize100)),
            child: Obx(
              () => Text("返回首页(${controller.state.times}s)", style: TextStyle(fontSize: kFontSize32, color: AppColors.primaryElement)),
            ),
          ),
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReviewfailController>(
      builder: (_) {
        return WillPopScope(
          onWillPop: () {
            return Future.value(false);
          },
          child: Scaffold(
            appBar: AppBar(
              leading: SizedBox(),
              backgroundColor: Color(0xffC5DEFF),
              centerTitle: true,
              title: Text(
                controller.state.title,
                style: TextStyle(fontSize: kFontSize32, color: Color(0xff333333), fontWeight: FontWeight.w600, height: 1),
              ),
            ),
            body: _buildView(),
          ),
        );
      },
    );
  }
}
