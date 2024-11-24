import 'package:flutter/material.dart';
import 'package:youyi_wallet/common/index.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/pages/repayment/childView/hfq_repaymentBankListView.dart';
import 'package:youyi_wallet/pages/repayment/childView/hfq_repaymentInfoItemView.dart';
import 'package:youyi_wallet/pages/repayment/makeRepayment/makeRepaymentController.dart';
import 'package:youyi_wallet/pages/repayment/repaymentMode.dart';

class RepaymentMakePage extends GetView<RepaymentMakeController> {
  const RepaymentMakePage({super.key});

  @override
  Widget build(BuildContext context) {
    RepayPlanEntityList model = Get.arguments["model"];
    controller.model = model;
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
        child: Column(
          children: [
            // Container(
            //   margin: EdgeInsets.fromLTRB(0, kSize16, 0, kSize16),
            //   padding: EdgeInsets.only(left: kSize8),
            //   height: kSize72,
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(kSize16),
            //       color: const Color(0x1AD84309)),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       Image.asset(
            //           width: kSize40,
            //           height: kSize40,
            //           "assets/images/hfq_repayment_notifier.png"),
            //       SizedBox(width: kSize16),
            //       Text(
            //         "恭喜您！已为您匹配到低费率借款服务",
            //         style: TextStyle(
            //             fontSize: kFontSize24, color: const Color(0xFFD84309)),
            //       )
            //     ],
            //   ),
            // ),
            HFQRepaymentInfoItemView(
              model: model,
              btnTitle: "立即还款",
              // rtWidget: Image.asset(
              //     width: kSize144,
              //     height: kSize50,
              //     "assets/images/hfq_repayment_lose_day.png"),
              onTap: controller.applyRepaymentSendMessageCode,
            ),
            Obx(() => HFQRepaymentbanklistview(bankName: controller.bankName.value)),
            // Container(
            //   margin: EdgeInsets.only(top: kSize48),
            //   height: kSize80,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       Text(
            //         "常见问题解答",
            //         style: TextStyle(
            //             fontSize: kFontSize24, color: const Color(0xFF888888)),
            //       ),
            //       Image.asset(
            //           width: kSize32,
            //           height: kSize32,
            //           'assets/images/hfq_payment_arrow_right.png')
            //     ],
            //   ),
            // )
          ],
        ),
      )),
    );
  }
}
