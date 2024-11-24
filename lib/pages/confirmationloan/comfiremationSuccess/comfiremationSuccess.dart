import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';
import 'package:youyi_wallet/pages/home/index.dart';

class HFQComfiremationSuccessPage extends StatelessWidget {
  const HFQComfiremationSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    return Scaffold(
        appBar: appBar(
          title: "产品名称",
          onPressed: () async {
            await UserStore.to.getUserStatus();
            controller.update(['home']);
            Get.back();
          },
        ),
        body: pagebg(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: kSize200),
              Image.asset(height: kSize360, 'assets/images/hfq_comfiremation_success.png'),
              SizedBox(height: kSize10),
              Text(
                '借款成功',
                style: TextStyle(fontSize: kFontSize32, color: const Color(0xFF333333)),
              )
            ],
          ),
        ));
  }
}
