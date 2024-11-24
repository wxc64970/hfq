import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/values/constantsSize.dart';

class HFQBindinBankCardFailedView extends StatelessWidget {
  const HFQBindinBankCardFailedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 488.w,
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
                'assets/images/hfq_bindin_bank_card_failed.png'),
            SizedBox(height: kSize32),
            Text(
              "绑卡失败",
              style: TextStyle(
                  fontSize: kFontSize32,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFFD84309)),
            ),
            SizedBox(height: kSize16),
            Text(
              "请核对并修改信息后，再重新提交",
              style: TextStyle(
                  fontSize: kFontSize24, color: const Color(0xFF888888)),
            ),
            SizedBox(height: kSize32),
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                height: kSize64,
                width: 320.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kSize88 / 2),
                    color: const Color(0xFF2B66FF)),
                child: Text(
                  "重新绑卡",
                  style: TextStyle(
                      fontSize: kFontSize24,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFFFFFFF)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
