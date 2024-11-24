import 'package:flutter/material.dart';
import 'package:youyi_wallet/common/values/constantsSize.dart';

class HFQLargepageNoDataView extends StatelessWidget {
  const HFQLargepageNoDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
            width: kSize400,
            height: kSize400,
            'assets/images/hfq_large_nodata.png'),
        Text(
          "暂无适合您的产品",
          style: TextStyle(
              fontSize: kFontSize28,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF333333)),
        ),
        SizedBox(height: kSize8),
        Text(
          "可到极速贷查看更多产品～",
          style:
              TextStyle(fontSize: kFontSize24, color: const Color(0xFF888888)),
        ),
      ],
    );
  }
}
