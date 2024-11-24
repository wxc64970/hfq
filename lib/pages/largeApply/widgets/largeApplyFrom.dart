import 'package:flutter/material.dart';
import 'package:youyi_wallet/common/values/constantsSize.dart';

class HFQLargeApplyFrom extends StatelessWidget {
  final String title;
  final String statusString;
  const HFQLargeApplyFrom(
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
