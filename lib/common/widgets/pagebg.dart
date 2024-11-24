import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

Widget pagebg({
  Widget? child,
}) {
  return Container(
    width: Get.width,
    height: Get.height,
    padding: EdgeInsets.only(left: kSize32, right: kSize32),
    decoration: BoxDecoration(
        gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: const [Color(0xffC5DEFF), Color(0xffF7F7F7), Color(0xffF7F7F7)],
    )),
    child: child,
  );
}
