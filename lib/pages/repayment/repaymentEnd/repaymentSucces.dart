import 'package:flutter/material.dart';
import 'package:youyi_wallet/common/index.dart';
import 'package:get/get.dart';

class HFQRepaymentSuccessPage extends StatelessWidget {
  const HFQRepaymentSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: "还款",
        onPressed: () async {
          // Get.offAllNamed(RouteNames.);
          await UserStore.to.getUserStatus();
          Get.back();
        },
      ),
      body: pagebg(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(width: kSize400, height: kSize400, "assets/images/hfq_repayment_success.png"),
          SizedBox(height: kSize32),
          Text(
            "还款成功",
            style: TextStyle(fontSize: kFontSize32, color: const Color(0xFF00C427)),
          ),
          SizedBox(height: kSize200),
          InkWell(
            onTap: () {
              // Get.until(
              //     (route) => Get.currentRoute == RouteNames.repaymentMain);
              // Get.back(RouteNames.repaymentMain);
              Get.offNamed(RouteNames.repaymentMain);
            },
            child: Container(
              alignment: Alignment.center,
              width: kSize400,
              height: kSize88,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(kSize88 / 2), color: const Color(0xFF2B66FF)),
              child: Text(
                "查看还款记录",
                style: TextStyle(fontSize: kFontSize32, color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: kSize32),
          InkWell(
            onTap: () async {
              await UserStore.to.getUserStatus();
              Get.back();
            },
            child: Container(
              alignment: Alignment.center,
              width: kSize400,
              height: kSize88,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(kSize88 / 2), color: const Color(0x1A2B66FF)),
              child: Text(
                "返回首页",
                style: TextStyle(fontSize: kFontSize32, color: const Color(0xFF2B66FF)),
              ),
            ),
          )
        ],
      )),
    );
  }
}
