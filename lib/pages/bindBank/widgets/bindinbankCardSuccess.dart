import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youyi_wallet/common/index.dart';

class HFQBindinbankCardSuccessView extends StatelessWidget {
  const HFQBindinbankCardSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 376.w,
        margin: EdgeInsets.only(left: kSize100, right: kSize100),
        padding: EdgeInsets.fromLTRB(kSize56, kSize72, kSize56, kSize48),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(kSize20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
                width: kSize120,
                height: kSize120,
                'assets/images/hfq_bindin_bank_card_succes.png'),
            SizedBox(height: kSize32),
            Text(
              "绑卡成功",
              style: TextStyle(
                  fontSize: kFontSize32,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF00C427)),
            ),
            SizedBox(height: kSize16),
            Text(
              "恭喜您绑卡验证通过！",
              style: TextStyle(
                  fontSize: kFontSize24, color: const Color(0xFF888888)),
            ),
          ],
        ),
      ),
    );
  }
}
