import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:youyi_wallet/common/index.dart';

import 'index.dart';

class Reviewloading2Page extends GetView<Reviewloading2Controller> {
  const Reviewloading2Page({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return pagebg(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: kSize200,
            child: Lottie.asset('assets/lottie/loading.json'),
          ),
          Text(
            "资料审核中...",
            style: TextStyle(fontSize: kFontSize32, fontWeight: FontWeight.w600, height: 1, color: AppColors.primaryElement),
          ),
          SizedBox(
            height: kSize16,
          ),
          Text(
            "可能需要等待几分钟",
            style: TextStyle(fontSize: kFontSize28, fontWeight: FontWeight.w400, height: 1, color: Color(0xff888888)),
          ),
          SizedBox(
            height: kSize360,
          ),
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Reviewloading2Controller>(
      builder: (_) {
        return WillPopScope(
          onWillPop: () {
            return Future.value(false);
          },
          child: Scaffold(
            appBar: AppBar(
              leading: SizedBox(),
              backgroundColor: Color(0xffC5DEFF),
              centerTitle: true,
              title: Text(
                "审核中",
                style: TextStyle(fontSize: kFontSize32, color: Color(0xff333333), fontWeight: FontWeight.w600, height: 1),
              ),
            ),
            body: _buildView(),
          ),
        );
      },
    );
  }
}
