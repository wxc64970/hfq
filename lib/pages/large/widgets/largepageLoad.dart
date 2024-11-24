import 'package:flutter/material.dart';
import 'package:youyi_wallet/common/index.dart';

class HFQLargepageLoadView extends StatelessWidget {
  const HFQLargepageLoadView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
            width: kSize300, height: kSize160, 'assets/images/hfq_42.png'),
        Text(
          "80%",
          style: TextStyle(
              fontSize: kFontSize32,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF2B66FF)),
        ),
        SizedBox(height: kSize8),
        Text(
          "额度审核中...",
          style: TextStyle(
              fontSize: kFontSize32,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF2B66FF)),
        ),
        SizedBox(height: kSize16),
        Text(
          "预计审核时间2-7秒",
          style:
              TextStyle(fontSize: kFontSize28, color: const Color(0xFF888888)),
        )
      ],
    );
  }
}
