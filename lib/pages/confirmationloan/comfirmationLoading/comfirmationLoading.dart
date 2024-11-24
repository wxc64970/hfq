import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:youyi_wallet/common/index.dart';
import 'package:youyi_wallet/pages/confirmationloan/comfirmationLoading/comfiremationLoadingController.dart';

class HFQComfirmationLoadPage extends GetView<ComfiremationLoadingController> {
  const HFQComfirmationLoadPage({super.key});
  // StreamController stream = StreamController();

  @override
  Widget build(BuildContext context) {
    final request = Get.arguments;
    controller.applyLoan(requestData: request);
    return WillPopScope(
      onWillPop: () async {
        await UserStore.to.getUserStatus();
        controller.update(['home']);
        controller.onWillPop;
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: SizedBox(),
          centerTitle: true,
          backgroundColor: Color(0xffC5DEFF),
          title: Text(
            "确认借款",
            style: TextStyle(fontSize: kFontSize32, color: Color(0xff333333), fontWeight: FontWeight.w600, height: 1),
          ),
        ),
        body: pagebg(
            child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: kSize32),
              padding: EdgeInsets.symmetric(vertical: kSize16, horizontal: kSize8),
              decoration: BoxDecoration(color: Color(0xffD84309).withOpacity(0.1), borderRadius: BorderRadius.circular(kSize16)),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/hfq_46.png",
                    width: kSize40,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    width: kSize16,
                  ),
                  Text(
                    "恭喜您！已为您匹配到低费率借款服务",
                    style: TextStyle(fontSize: kFontSize24, color: const Color(0xffD84309), height: 1),
                  )
                ],
              ),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: kSize200,
                  child: Lottie.asset('assets/lottie/loading.json'),
                ),
                Obx(() => Text("(${controller.currentTime}s)", style: TextStyle(fontSize: kFontSize22, color: const Color(0xFF888888)))),
                Text(
                  '确认借款中，请勿离开',
                  style: TextStyle(fontSize: kFontSize32, color: const Color(0xFF2B66FF)),
                ),
                Text(
                  '请勿离开，否则可能会引起放款失败',
                  style: TextStyle(fontSize: kFontSize28, color: const Color(0xFF888888)),
                )
              ],
            ))
          ],
        )),
      ),
    );
  }
}
