import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:youyi_wallet/common/index.dart';

import '../index.dart';

class LargeListWidget extends GetView<LargeController> {
  const LargeListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.largeList.length == 0
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
            children: largeProductListWidget(),
          ));
  }

  List<Widget> largeProductListWidget() {
    return List.generate(controller.largeList.length, (index) {
      LargeProductDataModel item = controller.largeList[index];
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
                        child: Container(
                          width: kSize48,
                          height: kSize48,
                          child: Image.network(
                            item.logo ?? "",
                            width: kSize48,
                            height: kSize48,
                            fit: BoxFit.contain,
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
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/hfq_check.png',
                        width: kSize32,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        width: kSize8,
                      ),
                      Text(
                        '预审通过',
                        style: TextStyle(
                          fontSize: kFontSize26,
                          color: const Color(0xff00C427),
                          height: 1,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
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
                    '预计可借 (元)',
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '¥',
                    style: TextStyle(
                      fontSize: kFontSize32,
                      color: const Color(0xff333333),
                      height: 1,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    '${item.highAmount ?? 10000}',
                    style: TextStyle(
                      fontSize: kFontSize64,
                      color: const Color(0xff333333),
                      height: 1,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: tagListWidget([
                      "最高${item.maxMonth ?? 12}期",
                      "月利息${item.monthRate ?? 0.36}%"
                    ]),
                  ),
                  btnFlatButtonWidget(
                      onPressed: () {
                        Get.toNamed(RouteNames.largeApply,
                            arguments: {"data": item});
                      },
                      width: kSize200,
                      height: 72,
                      title: "立即申请",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kFontSize28,
                          fontWeight: FontWeight.w600,
                          height: 1),
                      radius: 100),
                ],
              )
            ],
          ),
        ),
      );
    });
  }

  List<Widget> tagListWidget(tags) {
    const length = 2;
    return List.generate(length, (index) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: kSize8, vertical: kSize8),
        margin: EdgeInsets.only(right: kSize8),
        decoration: const BoxDecoration(
          color: Color(0x122B66FF),
        ),
        child: Text(
          tags[index],
          style: TextStyle(
              fontSize: kFontSize24, color: const Color(0xFF2B66FF), height: 1),
        ),
      );
    });
  }
}
