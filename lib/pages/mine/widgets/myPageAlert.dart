import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';
import 'package:youyi_wallet/common/utils/network_image.dart';
import 'package:youyi_wallet/pages/mine/index.dart';

class HFQMineAlertView extends GetView<MineController> {
  const HFQMineAlertView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: kSize62, right: kSize62),

      // color: Colors.c/,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(kSize48),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kSize20),
                color: Colors.white),
            // height: 710.w,
            child: Column(
              children: [
                Text(
                  "推荐今日高下款产品",
                  style: TextStyle(
                      fontSize: kSize36,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF333333)),
                ),
                SizedBox(height: kSize24),
                Container(
                  width: kSize500,
                  // height: kSize250,
                  padding: EdgeInsets.all(kSize32),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: kSize2, color: const Color(0xFFD84309)),
                      borderRadius: BorderRadius.circular(kSize20),
                      color: const Color(0x14D84309)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: Container(
                              width: kSize32,
                              height: kSize32,
                              color: const Color(0xFFD8D8D8),
                              child: networkImage(
                                  width: kSize32,
                                  height: kSize32,
                                  url: controller.productLogo()),
                            ),
                          ),
                          SizedBox(width: kSize16),
                          SizedBox(
                            width: ((Get.size.width - kSize64 - kSize40) / 3 -
                                kSize48 -
                                kSize32 -
                                kSize16),
                            child: Text(
                              controller.productName(),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: kFontSize28,
                                  fontWeight: FontWeight.w800,
                                  color: const Color(0xFF333333)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: kSize16),
                      Text(
                        "初审额度 (元)",
                        style: TextStyle(
                            fontSize: kSize24, color: const Color(0xFF888888)),
                      ),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: "¥",
                            style: TextStyle(
                                fontSize: kFontSize28,
                                color: const Color(0xFF333333))),
                        TextSpan(
                            text: controller.amount(),
                            style: TextStyle(
                                fontSize: kFontSize36,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF333333)))
                      ])),
                      SizedBox(height: kSize24),
                      Container(
                        padding: EdgeInsets.fromLTRB(
                            kSize12, kSize8, kSize12, kSize8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kSize8),
                            color: const Color(0x1AD88900)),
                        child: Text(
                          "凭借身份证借5万，秒到账",
                          style: TextStyle(
                              fontSize: kFontSize22,
                              color: const Color(0xFFD88900)),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: kSize24),
                Row(
                  children: [
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                            width: kSize32,
                            height: kSize32,
                            'assets/images/hfq_mine_alert_moneny.png'),
                        SizedBox(width: kSize8),
                        Text(
                          controller.dayRate(),
                          style: TextStyle(
                              fontSize: kFontSize24,
                              color: const Color(0xFF888888)),
                        )
                      ],
                    )),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                            width: kSize32,
                            height: kSize32,
                            'assets/images/hfq_mine_alert_calendar.png'),
                        SizedBox(width: kSize8),
                        Text(
                          controller.time(),
                          style: TextStyle(
                              fontSize: kFontSize24,
                              color: const Color(0xFF888888)),
                        )
                      ],
                    ))
                  ],
                ),
                SizedBox(height: kSize24),
                Text(
                  "根据您的资质评估，该产品通过率最高",
                  style: TextStyle(
                      fontSize: kFontSize24, color: const Color(0xFF00C427)),
                ),
                SizedBox(height: kSize24),
                InkWell(
                  onTap: controller.apply,
                  child: Container(
                    height: kSize88,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kSize88 / 2),
                        color: const Color(0xFF2B66FF)),
                    child: Text(
                      "领取额度",
                      style: TextStyle(
                          fontSize: kFontSize28,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
                SizedBox(height: kSize24),
                Text(
                  "176,877 已放款",
                  style: TextStyle(
                      fontSize: kFontSize22, color: const Color(0xFF888888)),
                ),
              ],
            ),
          ),
          SizedBox(height: kSize60),
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Image.asset(
                width: kSize64,
                height: kSize64,
                'assets/images/hfq_mine_alert_close.png'),
          )
        ],
      ),
    );
  }
}
