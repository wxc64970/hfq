import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

import '../index.dart';

class MyLoanWidget extends GetView<MineController> {
  const MyLoanWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(vertical: kSize24, horizontal: kSize32),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(kSize20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "我的贷款",
            style: TextStyle(fontSize: kFontSize28, color: Color(0xff333333), height: 1, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: kSize32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: loanListWidget(),
          ),
          SizedBox(
            height: kSize10,
          )
        ],
      ),
    );
  }

  List<Widget> loanListWidget() {
    return List.generate(controller.state.myloanList.length, (index) {
      final item = controller.state.myloanList[index];
      return InkWell(
        onTap: () {
          controller.handleLoan(index);
        },
        child: Column(
          children: [
            Image.asset(
              item['icon'],
              width: kSize48,
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: kSize10,
            ),
            Text(
              item['title'],
              style: TextStyle(fontSize: kFontSize22, color: Color(0xff333333), height: 1),
            )
          ],
        ),
      );
    });
  }
}
