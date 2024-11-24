import 'package:flutter/material.dart';
import 'package:youyi_wallet/common/index.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/pages/repayment/childView/hfq_repaymentInfoItemView.dart';
import 'package:youyi_wallet/pages/repayment/repaymentInfo/repaymentInfoController.dart';
import 'package:youyi_wallet/pages/repayment/repaymentMode.dart';
import 'package:youyi_wallet/pages/repayment/state.dart';

class RepaymentInfoPage extends GetView<Repaymentinfocontroller> {
  const RepaymentInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    RepayPlanEntityList model = Get.arguments["model"];

    return Scaffold(
      appBar: appBar(
        title: "待还款",
        onPressed: () {
          Get.back();
        },
      ),
      body: pagebg(
          child: Align(
        alignment: Alignment.topCenter,
        child: HFQRepaymentInfoItemView(
          model: model,
          btnTitle: "去还款",
          // rtWidget: Image.asset(
          //     width: kSize144,
          //     height: kSize50,
          //     "assets/images/hfq_repayment_new_bill_icon.png"),
          productNameWiget: Text("产品名称",
              style: TextStyle(
                  fontSize: kFontSize28,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF333333))),
          onTap: () {
            Get.toNamed(RouteNames.repaymentMake, arguments: {"model": model});
          },
        ),
      )),
    );
  }
}
