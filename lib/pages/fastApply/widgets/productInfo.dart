import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/utils/network_image.dart';
import 'package:youyi_wallet/common/values/constantsSize.dart';
import 'package:youyi_wallet/pages/fastApply/controller.dart';

class HFQFastApplyProductInfo extends GetView<HFQFastApplyController> {
  const HFQFastApplyProductInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(kSize32, kSize40, kSize32, kSize40),
      width: double.infinity,
      height: 428.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kSize20), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              networkImage(
                  width: kSize40,
                  height: kSize40,
                  url: controller.model?.logo ?? ""),
              SizedBox(width: kSize16),
              Text(
                controller.model?.name ?? "",
                style: TextStyle(
                    fontSize: kFontSize28, color: const Color(0xFF3D3D3D)),
              ),
              SizedBox(width: kSize16),
              Image.asset(
                  width: kSize182,
                  height: kSize40,
                  'assets/images/hfq_fast_apply_used.png'),
            ],
          ),
          SizedBox(height: kSize28),
          Divider(
            height: kSize2,
            color: const Color(0x80CCCCCC),
          ),
          SizedBox(height: kSize16),
          Text(
            "借多少",
            style: TextStyle(
                fontSize: kFontSize24, color: const Color(0xFF333333)),
          ),
          // SizedBox(height: kSize16),
          Text(
            controller.model?.highAmount ?? "0",
            style: TextStyle(
                fontSize: kFontSize96,
                color: const Color(0xFF333333),
                fontWeight: FontWeight.bold),
          ),
          // SizedBox(height: kSize16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HFQFastApplyProductInfoItem(
                title: "借多久",
                value: '${controller.model?.maxMonth ?? 12}个月',
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              Container(
                width: kSize2,
                height: kSize60,
                color: const Color(0x80CCCCCC),
              ),
              const HFQFastApplyProductInfoItem(title: "最快放款", value: '10分钟'),
              Container(
                width: kSize2,
                height: kSize60,
                color: const Color(0x80CCCCCC),
              ),
              HFQFastApplyProductInfoItem(
                title: "参考月利息",
                value: '${controller.model?.monthRate ?? "0.36"}%',
                crossAxisAlignment: CrossAxisAlignment.end,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class HFQFastApplyProductInfoItem extends StatelessWidget {
  final String title;
  final String value;
  final CrossAxisAlignment crossAxisAlignment;
  const HFQFastApplyProductInfoItem(
      {super.key,
      required this.title,
      required this.value,
      this.crossAxisAlignment = CrossAxisAlignment.start});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: kSize24, color: const Color(0xFF888888)),
        ),
        SizedBox(height: kSize6),
        Text(
          value,
          style: TextStyle(fontSize: kSize28, color: const Color(0xFF333333)),
        )
      ],
    );
  }
}
