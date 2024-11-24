import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';
import 'package:youyi_wallet/common/utils/network_image.dart';
import 'package:youyi_wallet/pages/large/index.dart';
import 'package:youyi_wallet/pages/largeApply/largeApplyController.dart';
import 'package:youyi_wallet/pages/largeApply/widgets/largeApplyBottom.dart';
import 'package:youyi_wallet/pages/largeApply/widgets/largeApplyFrom.dart';

class HFQlargeApplyPage extends GetView<HFQLargeApplyController> {
  const HFQlargeApplyPage({super.key});

  @override
  Widget build(BuildContext context) {
    LargeProductDataModel model = Get.arguments["data"];
    controller.tag = model.tags ?? "";
    controller.name = model.name ?? "";
    controller.companyName = model.channelInfo ?? "";

    return Scaffold(
      appBar: appBar(
        title: model.name ?? "",
        onPressed: () {
          Get.back();
        },
      ),
      body: pagebg(
          child: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              Container(
                padding: EdgeInsets.only(left: kSize16),
                height: kSize64,
                decoration: BoxDecoration(
                    color: Color(0x1A00C427),
                    borderRadius: BorderRadius.circular(kSize16)),
                child: Row(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: Color(0xFF00C427),
                    ),
                    SizedBox(width: kSize16),
                    Text(
                      "您的额度初审已通过",
                      style: TextStyle(
                          fontSize: kFontSize24,
                          color: const Color(0xFF00C427)),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: kSize24),
                padding: EdgeInsets.all(kSize32),
                height: 292.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kSize20),
                    color: const Color(0xFFFFFFFF)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "借款金额 | 元",
                      style: TextStyle(
                          fontSize: kFontSize24,
                          color: const Color(0xFF888888)),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "¥",
                          style: TextStyle(
                              fontSize: kFontSize42,
                              color: const Color(0xFF333333)),
                        ),
                        Text(
                          "${model.highAmount ?? 0}",
                          style: TextStyle(
                              fontSize: kFontSize96,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF333333)),
                        )
                      ],
                    ),
                    Text(
                      "最快3分钟放款，实际以审核为准",
                      style: TextStyle(
                          fontSize: kFontSize24,
                          color: const Color(0xFF888888)),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: kSize32),
                  padding:
                      EdgeInsets.fromLTRB(kSize32, kSize8, kSize32, kSize8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kSize20),
                      color: const Color(0xFFFFFFFF)),
                  child: Column(
                    children: [
                      const HFQLargeApplyFrom(
                          title: "身份信息：", statusString: "已通过"),
                      Divider(color: Color(0x80CCCCCC), height: kSize2),
                      const HFQLargeApplyFrom(
                          title: "留资信息：", statusString: "已通过"),
                      // Divider(color: Color(0x80CCCCCC), height: kSize2),
                      // HFQLargeApplyFrom(title: "贷款用途：", statusString: "购买家具或家电")
                    ],
                  )),
              Container(
                  margin: EdgeInsets.only(top: kSize32),
                  padding: EdgeInsets.all(kSize32),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kSize20),
                      color: const Color(0xFFFFFFFF)),
                  child: Row(
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "匹配贷款平台",
                            style: TextStyle(
                                fontSize: kFontSize28,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF3D3D3D)),
                          ),
                          SizedBox(height: kSize8),
                          Text(
                            "综合下款率最高，放款快",
                            style: TextStyle(
                                fontSize: kFontSize24,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF888888)),
                          )
                        ],
                      )),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              networkImage(
                                  width: kSize32,
                                  height: kSize32,
                                  url: model.logo ?? ""),
                              SizedBox(width: kSize16),
                              Text(
                                model.name ?? "",
                                style: TextStyle(
                                    fontSize: kFontSize28,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF3D3D3D)),
                              )
                            ],
                          ),
                          SizedBox(height: kSize8),
                          Text(
                            "总申请人数：96162",
                            style: TextStyle(
                                fontSize: kFontSize24,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF888888)),
                          )
                        ],
                      ))
                    ],
                  )),
            ],
          )),
          const HFQLargeApplyPageBottom()
        ],
      )),
    );
  }
}
