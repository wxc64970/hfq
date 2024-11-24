import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

import '../index.dart';

class FastListWidget extends GetView<FastController> {
  const FastListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.fastList.length == 0
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: kSize200),
                Image.asset(
                  'assets/images/hfq_large_nodata.png',
                  height: kSize400,
                ),
                Text(
                  "暂无适合您的产品",
                  style: TextStyle(
                      fontSize: kFontSize28, color: const Color(0xFF333333)),
                ),
                Text(
                  "可到极速贷查看更多产品～",
                  style: TextStyle(
                      fontSize: kFontSize24, color: const Color(0xFF888888)),
                )
              ],
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '新品推荐',
                style: TextStyle(
                    fontSize: kFontSize36,
                    color: const Color(0xff333333),
                    height: 1,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: kSize24,
              ),
              Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: fastProductListWidget(),
                  ))
            ],
          ));
  }

  List<Widget> fastProductListWidget() {
    return List.generate(controller.fastList.length, (index) {
      FastProductDataModel item = controller.fastList[index];
      return InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(kSize32),
          margin: EdgeInsets.only(bottom: kSize24),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(kSize20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  // spreadRadius: kSize6,
                  blurRadius: kSize10,
                  offset: Offset(0, kSize6),
                ),
              ]),
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: SizedBox(
                          width: kSize48,
                          height: kSize48,
                          child: Image.network(
                            item.logo ?? "",
                            width: kSize48,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: kSize12,
                      ),
                      Text(
                        item.name ?? "",
                        style: TextStyle(
                            fontSize: kFontSize28,
                            color: const Color(0xff333333),
                            height: 1,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: kSize16,
                      ),
                      // item['productTips'] != null
                      //     ? Container(
                      //         decoration: BoxDecoration(
                      //           color: const Color(0x1AD88900),
                      //           borderRadius: BorderRadius.circular(kSize32),
                      //         ),
                      //         padding: EdgeInsets.symmetric(
                      //             horizontal: kSize16, vertical: kSize8),
                      //         child: Text(
                      //           item['productTips'],
                      //           style: TextStyle(
                      //               fontSize: kFontSize24,
                      //               color: const Color(0xFFD88900),
                      //               height: 1),
                      //         ),
                      //       )
                      //     : const SizedBox(),
                    ],
                  ),
                  Row(
                    children: [
                      btnFlatButtonWidget(
                          onPressed: () {
                            Get.toNamed(RouteNames.fastApply,
                                arguments: {"data": item});
                          },
                          width: kSize160,
                          height: 52,
                          title: "立即申请",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: kFontSize24,
                              height: 1),
                          radius: 100),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: kSize24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '最高可借(元)',
                    style: TextStyle(
                      fontSize: kFontSize28,
                      color: const Color(0xff333333),
                      height: 1,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '${item.maxMonth ?? 12} (月)',
                    style: TextStyle(
                      fontSize: kFontSize24,
                      color: const Color(0xff999999),
                      height: 1,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: kSize16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${double.parse(item.lowAmount ?? "10000") ~/ 10000}-${double.parse(item.highAmount ?? "10000") ~/ 10000}万',
                    style: TextStyle(
                      fontSize: kFontSize42,
                      color: AppColors.primaryElement,
                      height: 1,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '${item.monthRate ?? 0.36}%月利息|${Random().nextInt(7) + 9}分钟放款',
                    style: TextStyle(
                      fontSize: kFontSize24,
                      color: const Color(0xff999999),
                      height: 1,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
