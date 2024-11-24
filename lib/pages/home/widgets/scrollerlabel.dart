import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:youyi_wallet/common/values/constantsSize.dart';

class ScrollerLabelView extends StatelessWidget {
  final String scrollText;
  const ScrollerLabelView({super.key, required this.scrollText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: kSize20, horizontal: kSize16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kSize16),
          gradient: LinearGradient(colors: [
            const Color(0xffD84309).withOpacity(0.1),
            Colors.transparent
          ])),
      child: Row(
        children: [
          Image.asset(
            "assets/images/hfq_07.png",
            width: kSize32,
            fit: BoxFit.contain,
          ),
          SizedBox(
            width: kSize8,
          ),
          Text(
            "温馨提示",
            style: TextStyle(
                color: const Color(0xffD84309),
                fontSize: kFontSize28,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: kSize16,
          ),
          Expanded(
            child: SizedBox(
              width: Get.width,
              height: kSize40,
              child: Marquee(
                text: scrollText,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: kFontSize24,
                    color: const Color(0xff888888)),
                blankSpace: 16.0,
                velocity: 20.0,
                pauseAfterRound: const Duration(seconds: 1),
                startPadding: 10.0,
                accelerationDuration: const Duration(seconds: 1),
                accelerationCurve: Curves.linear,
                decelerationDuration: const Duration(milliseconds: 500),
                decelerationCurve: Curves.easeOut,
              ),
            ),
          )
        ],
      ),
    );
  }
}
