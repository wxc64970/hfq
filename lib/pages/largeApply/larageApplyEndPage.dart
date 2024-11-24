import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

class HFQLargeApplyEndPage extends StatelessWidget {
  const HFQLargeApplyEndPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: Get.arguments["title"] ?? "",
        onPressed: () {
          Get.back();
        },
      ),
      body: pagebg(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
              width: kSize400, height: kSize400, 'assets/images/hfq_38.png'),
          SizedBox(height: kSize32),
          Text(
            "恭喜您，您的贷款申请已发布成功",
            style: TextStyle(
                fontSize: kFontSize28,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF00C427)),
          ),
          SizedBox(height: kSize48),
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: kSize88,
              width: kSize500,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kSize88 / 2),
                  color: const Color(0xFF2B66FF)),
              child: Text(
                "返回首页",
                style: TextStyle(
                    fontSize: kFontSize28,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFFFFFFF)),
              ),
            ),
          ),
          SizedBox(height: kSize80),
          Container(
            margin: EdgeInsets.only(left: kSize32, right: kSize32),
            padding: EdgeInsets.fromLTRB(kSize32, kSize48, kSize32, kSize48),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kSize20),
                color: Colors.white),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                        width: kSize32,
                        height: kSize32,
                        'assets/images/hfq_large_apply_end_warning.png'),
                    SizedBox(width: kSize10),
                    Text(
                      "安全提示",
                      style: TextStyle(
                          fontSize: kFontSize28,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF333333)),
                    )
                  ],
                ),
                SizedBox(height: kSize16),
                RichText(
                  maxLines: 100,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '注意',
                        style: TextStyle(
                            color: const Color(0xFF888888), fontSize: kSize24),
                      ),
                      TextSpan(
                        text: '平台不会向您收取任何费用',
                        style: TextStyle(
                            color: const Color(0xFFD84309),
                            fontSize: kSize24,
                            fontWeight: FontWeight.w800),
                      ),
                      TextSpan(
                        text: '，若有人向您收取会员费、中介费、手续费、测试金各项费用，',
                        style: TextStyle(
                            color: const Color(0xFF888888), fontSize: kSize24),
                      ),
                      TextSpan(
                        text: '切勿盲信。',
                        style: TextStyle(
                            color: const Color(0xFF333333),
                            fontSize: kSize24,
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: kSize24),
          Text(
            "近期诈骗频繁：警惕香港，境外的短信或电话，提高防范意识",
            style: TextStyle(
                fontSize: kFontSize22, color: const Color(0xFFCCCCCC)),
          )
        ],
      )),
    );
  }
}
