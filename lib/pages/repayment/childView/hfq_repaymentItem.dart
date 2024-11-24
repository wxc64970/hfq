import 'package:flutter/material.dart';
import 'package:youyi_wallet/common/index.dart';

class HFQRepaymentItem extends StatelessWidget {
  final String value;
  final String subTitle;
  final CrossAxisAlignment alignment;
  const HFQRepaymentItem(
      {super.key,
      required this.value,
      required this.subTitle,
      this.alignment = CrossAxisAlignment.start});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(
          subTitle,
          style: TextStyle(
              fontSize: kFontSize22,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFCCCCCC)),
        ),
        SizedBox(height: kSize8),
        Text(
          value,
          style: TextStyle(
              fontSize: kFontSize48,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFFFFFFF)),
        )
      ],
    );
  }
}
