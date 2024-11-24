import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:youyi_wallet/common/values/constantsSize.dart';
import 'package:youyi_wallet/pages/fastApply/controller.dart';

class HFQFastApplyProductDetail extends GetView<HFQFastApplyController> {
  const HFQFastApplyProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(kSize32, kSize40, kSize32, 0),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kSize20), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "产品详情分析",
              style: TextStyle(
                  fontSize: kFontSize32,
                  color: const Color(0xFF333333),
                  fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, kSize40, 0, kSize24),
              padding: EdgeInsets.all(kSize24),
              height: 232.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kSize20),
                  color: const Color(0xFFF7F7F7)),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HFQFastApplyProductDetailItem(
                      title: "年龄条件", statusString: "符合"),
                  HFQFastApplyProductDetailItem(
                      title: "信用初审", statusString: "符合"),
                  HFQFastApplyProductDetailItem(
                      title: "风控初审", statusString: "符合"),
                ],
              ),
            ),
            HFQFastApplyProductDetailFrom(
                title: "公司名称",
                statusString: controller.model?.channelInfo ?? ""),
            Divider(color: Color(0x80CCCCCC), height: kSize2),
            const HFQFastApplyProductDetailFrom(
                title: "计算方式", statusString: "等额本息"),
            Divider(color: Color(0x80CCCCCC), height: kSize2),
            HFQFastApplyProductDetailFrom(
                title: "综合通过率", statusString: "${Random().nextInt(4) + 95}%"),
            Divider(color: Color(0x80CCCCCC), height: kSize2),
            const HFQFastApplyProductDetailFrom(
                title: "循环额度", statusString: "不支持"),
          ],
        ));
  }
}

class HFQFastApplyProductDetailItem extends StatelessWidget {
  final String title;
  final String statusString;
  const HFQFastApplyProductDetailItem(
      {super.key, required this.title, required this.statusString});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style:
              TextStyle(fontSize: kFontSize28, color: const Color(0xFF3D3D3D)),
        ),
        SizedBox(width: kSize30),
        Expanded(
            child: Divider(
          height: 2.w,
          color: const Color(0x80CCCCCC),
        )),
        SizedBox(width: kSize30),
        Text(
          statusString,
          style:
              TextStyle(fontSize: kFontSize28, color: const Color(0xFF2B66FF)),
        ),
      ],
    );
  }
}

class HFQFastApplyProductDetailFrom extends StatelessWidget {
  final String title;
  final String statusString;
  const HFQFastApplyProductDetailFrom(
      {super.key, required this.title, required this.statusString});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kSize96,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: kFontSize28, color: const Color(0xFF333333)),
          ),
          Text(
            statusString,
            style: TextStyle(
                fontSize: kFontSize28,
                color: const Color(0xFF333333),
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
