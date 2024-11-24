import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

import '../index.dart';

class FastRankListWidget extends GetView<FastController> {
  const FastRankListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '今日排行榜',
          style: TextStyle(
              fontSize: kFontSize36,
              color: const Color(0xff333333),
              height: 1,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: kSize24,
        ),
        Obx(() => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: rankListWidget(),
            ))
      ],
    );
  }

  List<Widget> rankListWidget() {
    return List.generate(
        controller.fastList.length > 3 ? 3 : controller.fastList.length,
        (index) {
      FastProductDataModel item = controller.fastList[index == 0
          ? 1
          : index == 1
              ? 0
              : index];
      final rankConfig = controller.state.value.rankConfig[index];
      return Expanded(
          child: Container(
        width: kSize224,
        margin: EdgeInsets.only(bottom: kSize24),
        child: Column(
          children: [
            SizedBox(
              height: rankConfig['height'],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipOval(
                      child: SizedBox(
                        width: kSize160,
                        height: kSize160,
                        child: Image.network(
                          item.logo ?? '',
                          width: kSize160,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: kSize130,
                      child: btnFlatButtonWidget(
                          onPressed: () {
                            print("ssssss");
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
                    ),
                  ],
                ),
                SizedBox(
                  height: kSize40,
                ),
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    // background: linear-gradient( 180deg, rgba(43,102,255,0.4) 0%, rgba(240,244,249,0) 100%);
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xff2B66FF).withOpacity(0.4),
                          const Color(0xffF0F4F9).withOpacity(0)
                        ]),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: kSize32,
                      ),
                      Text(
                        item.name ?? "",
                        style: TextStyle(
                            fontSize: kFontSize36,
                            color: const Color(0xff333333),
                            height: 1,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: kSize24,
                      ),
                      Text(
                        rankConfig['title'],
                        style: TextStyle(
                            fontSize: kFontSize28,
                            color: const Color(0xff666666),
                            height: 1,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ));
    });
  }
}
