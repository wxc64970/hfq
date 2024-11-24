import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

import 'index.dart';

class ReviewsuccessPage extends GetView<ReviewsuccessController> {
  const ReviewsuccessPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return pagebg(
        child: Column(
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
          "恭喜您审批通过！",
          style: TextStyle(color: Color(0xff00C427), fontSize: kFontSize32, height: 1, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: kSize70,
        ),
        Stack(
          children: [
            Image.asset(
              "assets/images/hfq_45.png",
              width: kSize686,
              fit: BoxFit.contain,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: kSize340,
                  height: kSize176,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${controller.state.totalAmount}",
                        style: TextStyle(fontSize: kFontSize48, color: Colors.white, height: 1, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: kSize10,
                      ),
                      Text(
                        "审批总额度（元）",
                        style: TextStyle(fontSize: kFontSize22, color: Color(0xffCCCCCC), height: 1),
                      )
                    ],
                  ),
                ),
                Container(
                  width: kSize2,
                  height: kSize96,
                  color: Colors.white24,
                ),
                SizedBox(
                  width: kSize340,
                  height: kSize176,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${controller.state.availableCredit}",
                        style: TextStyle(fontSize: kFontSize48, color: Colors.white, height: 1, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: kSize10,
                      ),
                      Text(
                        "可用额度（元）",
                        style: TextStyle(fontSize: kFontSize22, color: Color(0xffCCCCCC), height: 1),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: kSize380,
        ),
        InkWell(
          onTap: controller.toHandleNext,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: kSize22, horizontal: kSize110),
            decoration: BoxDecoration(color: AppColors.primaryElement, borderRadius: BorderRadius.circular(kSize100)),
            child: Text(
              "去提现",
              style: TextStyle(fontSize: kFontSize32, color: Colors.white, height: 1, fontWeight: FontWeight.w500),
            ),
          ),
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReviewsuccessController>(
      builder: (_) {
        return Scaffold(
          appBar: appBar(
            title: "审核结果",
            onPressed: () => Get.back(),
          ),
          body: _buildView(),
        );
      },
    );
  }
}
