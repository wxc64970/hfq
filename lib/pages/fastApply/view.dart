import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';
import 'package:youyi_wallet/pages/fastApply/controller.dart';
import 'package:youyi_wallet/pages/fastApply/widgets/bottom.dart';
import 'package:youyi_wallet/pages/fastApply/widgets/productDetail.dart';
import 'package:youyi_wallet/pages/fastApply/widgets/productInfo.dart';

class HFQFastApplyPage extends GetView<HFQFastApplyController> {
  const HFQFastApplyPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.model = Get.arguments["data"];
    return Scaffold(
      appBar: fastAppBar(
        onPressed: () {
          Get.back();
        }, //const ScrollerLabelView(scrollText: "贷款前以任何名义收取保证金等各种费用都是骗子")
        title: LayoutBuilder(builder: (_, con) {
          return Container(
            width: con.maxWidth - kSize32,
            height: kSize56,
            padding: EdgeInsets.fromLTRB(kSize16, kSize10, kSize16, kSize10),
            decoration: BoxDecoration(
                color: const Color(0x0D2B66FF),
                borderRadius: BorderRadius.circular(kSize16)),
            child: Row(
              children: [
                Icon(
                  Icons.notification_important,
                  color: const Color(0xFF2B66FF),
                  size: kSize24,
                ),
                SizedBox(width: kSize10),
                Text(
                  "贷款前以任何名义收取保证金等各种费用都是骗子",
                  style: TextStyle(
                      fontSize: kFontSize24, color: const Color(0xFF2B66FF)),
                )
              ],
            ),
          );
        }),
      ),
      body: pagebg(
          child: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              const HFQFastApplyProductInfo(),
              SizedBox(height: kSize24),
              const HFQFastApplyProductDetail(),
              SizedBox(height: kSize16),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "本次服务由${controller.model?.name ?? "**"}提供，平台仅提供信息展示",
                  style: TextStyle(
                      fontSize: kFontSize24, color: const Color(0xFFCCCCCC)),
                ),
              )
            ],
          )),
          const HFQFastApplyBottomView(),
        ],
      )),
    );
  }
}
