import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';
import 'package:youyi_wallet/common/utils/network_image.dart';
import 'package:youyi_wallet/pages/home_ls/homeLSController.dart';

class HFQLoanSupermarketBottomSheetView extends GetView<HomeLSController> {
  const HFQLoanSupermarketBottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: kSize32, right: kSize32),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(kSize20),
              topRight: Radius.circular(kSize20)),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffC5DEFF), Color(0xffF7F7F7), Color(0xffF7F7F7)],
          )),
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: kSize72),
              Expanded(
                  child: ListView(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: Text(
                      "恭喜您通过产品初审",
                      style: TextStyle(
                          fontSize: kFontSize32,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF333333)),
                    ),
                  ),
                  SizedBox(height: kSize40),
                  Row(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: Container(
                              width: kSize32,
                              height: kSize32,
                              color: const Color(0xFFD8D8D8),
                              child: networkImage(
                                  width: kSize32,
                                  height: kSize32,
                                  url:
                                      controller.getAlertProductInfo()["logo"]),
                            ),
                          ),
                          SizedBox(width: kSize16),
                          Text(
                            controller.getAlertProductInfo()["name"],
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: kFontSize28,
                                fontWeight: FontWeight.w800,
                                color: const Color(0xFF333333)),
                          ),
                        ],
                      ),
                      SizedBox(width: kSize32),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DefaultTextStyle(
                                  style: TextStyle(fontSize: kSize22),
                                  child: const Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                            text: "已有",
                                            style: TextStyle(
                                                color: Color(0xFF888888))),
                                        TextSpan(
                                            text: "3786人",
                                            style: TextStyle(
                                                color: Color(0xFF333333))),
                                        TextSpan(
                                          text: "发起贷款度",
                                          style: TextStyle(
                                              color: Color(0xFF888888)),
                                        ),
                                      ],
                                    ),
                                  )),
                              Text(
                                "下款率：${controller.getAlertProductInfo()["downloadRate"]}%",
                                style: TextStyle(
                                    color: const Color(0xFFD84309),
                                    fontSize: kFontSize22),
                              )
                            ],
                          ),
                          SizedBox(height: kSize8),
                          Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: kSize8,
                                decoration: BoxDecoration(
                                    color: const Color(0x80CCCCCC),
                                    borderRadius:
                                        BorderRadius.circular(kSize8 / 2)),
                              ),
                              LayoutBuilder(builder: (_, c) {
                                return Container(
                                  width: c.maxWidth *
                                      double.parse(
                                          controller.getAlertProductInfo()[
                                              "downloadRate"]) /
                                      100.0,
                                  height: kSize8,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFD84309),
                                      borderRadius:
                                          BorderRadius.circular(kSize8 / 2)),
                                );
                              })
                            ],
                          )
                        ],
                      ))
                    ],
                  ),
                  SizedBox(height: kSize32),
                  Container(
                    // height: 352.w,
                    padding: EdgeInsets.all(kSize32),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kSize20),
                        color: const Color(0xFF2B66FF)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            HFQLoanSupermarketBottomSheetViewItem(
                                title: "初审额度",
                                value:
                                    controller.getAlertProductInfo()["amount"],
                                unit: "万"),
                            Container(
                              width: kSize2,
                              height: kSize120,
                              color: const Color(0x33FFFFFF),
                            ),
                            HFQLoanSupermarketBottomSheetViewItem(
                                title: "借多久 (月)",
                                value:
                                    controller.getAlertProductInfo()["month"],
                                unit: "月"),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: kSize24, left: kSize32, right: kSize32),
                          padding: EdgeInsets.fromLTRB(
                              kSize32, kSize24, kSize32, kSize24),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(kSize20),
                              color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const InfoItem(
                                title: "预估利息",
                                value: "9600",
                                crossAxisAlignment: CrossAxisAlignment.start,
                              ),
                              const InfoItem(
                                  title: "月均还款",
                                  value: "8734",
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center),
                              InfoItem(
                                  title: "月利率",
                                  value:
                                      controller.getAlertProductInfo()["rate"],
                                  crossAxisAlignment: CrossAxisAlignment.end)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: kSize32),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        "本地信用分析",
                        style: TextStyle(
                            fontSize: kFontSize28,
                            fontWeight: FontWeight.w800,
                            color: const Color(0xFF333333)),
                      )),
                      Text(
                        "符合",
                        style: TextStyle(
                            fontSize: kFontSize28,
                            color: const Color(0xFF2B66FF)),
                      ),
                      Icon(
                        Icons.check_circle,
                        color: const Color(0xFF00C427),
                        size: kSize32,
                      )
                    ],
                  ),
                  SizedBox(height: kSize32),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        "个人信用初审",
                        style: TextStyle(
                            fontSize: kFontSize28,
                            fontWeight: FontWeight.w800,
                            color: const Color(0xFF333333)),
                      )),
                      Text(
                        "符合",
                        style: TextStyle(
                            fontSize: kFontSize28,
                            color: const Color(0xFF2B66FF)),
                      ),
                      Icon(
                        Icons.check_circle,
                        color: const Color(0xFF00C427),
                        size: kSize32,
                      )
                    ],
                  ),
                ],
              )),
              SizedBox(height: kSize32),
              Text(
                "根据您的资质评估，该产品通过率最高",
                style: TextStyle(
                    fontSize: kFontSize24, color: const Color(0xFFD88900)),
              ),
              SizedBox(height: kSize32),
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: kSize88,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kSize88 / 2),
                          color: const Color(0x1A2B66FF)),
                      child: Text(
                        "放弃借款",
                        style: TextStyle(
                            fontSize: kFontSize28,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF2B66FF)),
                      ),
                    ),
                  )),
                  SizedBox(width: kSize16),
                  Expanded(
                      child: InkWell(
                    onTap: controller.applyAlertproduct,
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
                  )),
                ],
              ),
              SizedBox(height: kSize60),
            ],
          ),
          Positioned(
            top: kSize24,
            right: 0,
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                alignment: Alignment.center,
                width: kSize48,
                height: kSize48,
                child: Icon(Icons.close,
                    color: const Color(0xFF888888), size: kSize32),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HFQLoanSupermarketBottomSheetViewItem extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  const HFQLoanSupermarketBottomSheetViewItem(
      {super.key,
      required this.title,
      required this.value,
      required this.unit});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style:
              TextStyle(fontSize: kFontSize28, color: const Color(0xFFCCCCCC)),
        ),
        SizedBox(height: kSize8),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: value,
              style: TextStyle(
                  fontSize: kFontSize64,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          TextSpan(
              text: unit,
              style: TextStyle(fontSize: kFontSize24, color: Colors.white))
        ]))
      ],
    );
  }
}

class InfoItem extends StatelessWidget {
  final String title;
  final String value;
  final CrossAxisAlignment crossAxisAlignment;
  const InfoItem(
      {super.key,
      required this.title,
      required this.value,
      this.crossAxisAlignment = CrossAxisAlignment.start});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          title,
          style:
              TextStyle(fontSize: kFontSize28, color: const Color(0xFF888888)),
        ),
        SizedBox(height: kSize8),
        Text(
          value,
          style: TextStyle(
              fontSize: kFontSize42,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF333333)),
        ),
      ],
    );
  }
}
