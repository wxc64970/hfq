import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';
import 'package:youyi_wallet/pages/Application/controller.dart';
import 'package:youyi_wallet/pages/fast/index.dart';
import 'package:youyi_wallet/pages/home/widgets/loanSupermarketMenu.dart';
import 'package:youyi_wallet/pages/home/widgets/scrollerlabel.dart';
import 'package:youyi_wallet/pages/home_ls/homeLSController.dart';
import 'package:youyi_wallet/pages/large/index.dart';

class HFQLoanSupermarketView extends StatelessWidget {
  final HomeLSController controller;
  const HFQLoanSupermarketView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HFQLoanSupermarketMenuView(dataList: controller.loanSupermarketMenu),
        SizedBox(height: kSize24),
        ScrollerLabelView(scrollText: controller.scrollText),
        SizedBox(height: kSize44),
        Obx(() => controller.largeList.length > 0
            ? const HFQLoanSupermarketMenuTitleView(
                title: "特别推荐", subtitle: "根据用户反馈评测今日下款率最高产品")
            : Container()),
        Obx(() =>
            SizedBox(height: controller.largeList.length > 0 ? kSize32 : 0)),
        Obx(() => Wrap(
              spacing: kSize20,
              children: List.generate(
                  controller.largeList.length > 3
                      ? 3
                      : controller.largeList.length, (index) {
                return HFQLoanSupermarketProductItem(
                  ontap: () {
                    Get.toNamed(RouteNames.largeApply,
                        arguments: {"data": controller.largeList[index]});
                  },
                  model: controller.largeList[index],
                );
              }),
            )),
        Obx(() =>
            SizedBox(height: controller.largeList.length > 0 ? kSize32 : 0)),
        Obx(() => controller.fastList.length > 0
            ? HFQLoanSupermarketMenuTitleView(
                title: "精选贷款",
                subtitle: "精选最符合您资质的贷款产品",
                traingWidget: InkWell(
                  onTap: () {
                    // Get.bottomSheet(const HFQLoanSupermarketBottomSheetView(),
                    //     isDismissible: false);
                    ApplicationController applicationController =
                        Get.find<ApplicationController>();
                    applicationController.handleNavBarTap(1);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "更多贷款",
                        style: TextStyle(
                            fontSize: kFontSize24,
                            color: const Color(0xFF2B66FF)),
                      ),
                      SizedBox(width: kSize10),
                      Image.asset(
                          width: kSize32,
                          height: kSize32,
                          color: const Color(0xFF2B66FF),
                          'assets/images/hfq_payment_arrow_right.png')
                    ],
                  ),
                ),
              )
            : Container()),
        SizedBox(height: kSize32),
        Obx(() => Wrap(
              spacing: kSize20,
              children: List.generate(
                  controller.fastList.length > 3
                      ? 3
                      : controller.fastList.length, (index) {
                return HFQLoanSupermarketProductItem(
                    ontap: () {
                      Get.toNamed(RouteNames.fastApply,
                          arguments: {"data": controller.fastList[index]});
                      // controller.loanSupermarketProductitemCliecked();
                    },
                    model: LargeProductDataModel(),
                    fastModel: controller.fastList[index]);
              }),
            ))
      ],
    );
  }
}

class HFQLoanSupermarketMenuTitleView extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget? traingWidget;
  const HFQLoanSupermarketMenuTitleView(
      {super.key,
      required this.title,
      required this.subtitle,
      this.traingWidget});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: title,
                  style: TextStyle(
                      fontSize: kFontSize32,
                      color: const Color(0xff333333),
                      fontWeight: FontWeight.w600,
                      height: 1)),
              const TextSpan(text: "  "),
              TextSpan(
                text: subtitle,
                style: TextStyle(
                    fontSize: kFontSize24, color: const Color(0xFF888888)),
              ),
            ],
          ),
        ),
        Expanded(child: traingWidget ?? Container())
      ],
    );
  }
}

class HFQLoanSupermarketProductItem extends StatelessWidget {
  final Function()? ontap;
  final LargeProductDataModel model;
  final FastProductDataModel? fastModel;
  const HFQLoanSupermarketProductItem(
      {super.key, this.ontap, required this.model, this.fastModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (Get.size.width - kSize64 - kSize40) / 3,
      padding: EdgeInsets.all(kSize24),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(kSize20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                child: Container(
                  width: kSize32,
                  height: kSize32,
                  color: const Color(0xFFD8D8D8),
                  child: Image.network(
                    width: kSize32,
                    height: kSize32,
                    fastModel == null
                        ? model.logo ?? ""
                        : (fastModel?.logo ?? ""),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: kSize16),
              SizedBox(
                width: ((Get.size.width - kSize64 - kSize40) / 3 -
                    kSize48 -
                    kSize32 -
                    kSize16),
                child: Text(
                  fastModel == null ? model.name ?? "" : fastModel?.name ?? "",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: kFontSize28,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF333333)),
                ),
              )
            ],
          ),
          SizedBox(height: kSize20),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: fastModel == null
                        ? "${(model.lowAmount ?? 0) ~/ 10000}-${(model.highAmount ?? 0) ~/ 10000}万"
                        : "${double.parse((fastModel?.lowAmount ?? "0")) ~/ 10000}-${double.parse((fastModel?.highAmount ?? "0")) ~/ 10000}万",
                    style: TextStyle(
                        fontSize: kFontSize24,
                        color: const Color(0xFF2B66FF),
                        fontWeight: FontWeight.w600,
                        height: 1)),
                TextSpan(
                  text: "额度",
                  style: TextStyle(
                      fontSize: kFontSize24, color: const Color(0xFF333333)),
                ),
              ],
            ),
          ),
          SizedBox(height: kSize16),
          Text(
            "通过率${Random().nextInt(4) + 95}%",
            style: TextStyle(fontSize: kSize22, color: const Color(0xFFD88900)),
          ),
          SizedBox(height: kSize16),
          InkWell(
            onTap: ontap,
            child: Container(
              margin: const EdgeInsets.all(0),
              height: kSize56,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kSize56 / 2),
                  color: const Color(0xFF2B66FF)),
              child: Text(
                "申请借款",
                style: TextStyle(fontSize: kFontSize24, color: Colors.white),
              ),
            ),
          )
        ],
      ),
      // child: ,
    );
  }
}
