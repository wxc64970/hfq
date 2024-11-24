import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youyi_wallet/common/index.dart';

import '../index.dart';

class MymenuWidget extends GetView<MineController> {
  const MymenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.all(kSize32),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(kSize20), boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          // spreadRadius: kSize6,
          blurRadius: kSize10,
          offset: Offset(0, kSize6),
        ),
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: menuListWidget(),
      ),
    );
  }

  List<Widget> menuListWidget() {
    return List.generate(controller.state.mymenuList.length, (index) {
      final item = controller.state.mymenuList[index];
      return InkWell(
        onTap: () async {
          if (item['title'] == "专属客服") {
            final Uri url = Uri.parse('tel:${Constants.serviceTel}');
            await launchUrl(url);
          }
        },
        child: Container(
          padding: EdgeInsets.only(top: kSize28, bottom: kSize28),
          decoration: BoxDecoration(
              // border: Border(bottom: BorderSide(width: kSize2, color: Color(0xffCCCCCC).withOpacity(0.5))),
              ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    item['icon'],
                    width: kSize32,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    width: kSize24,
                  ),
                  Text(
                    item['title'],
                    style: TextStyle(fontSize: kFontSize28, color: Color(0xff333333), height: 1, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              Row(
                children: [
                  item['subtitle'] != null
                      ? Text(
                          item['subtitle'],
                          style: TextStyle(fontSize: kFontSize24, color: Color(0xff888888), height: 1),
                        )
                      : SizedBox(),
                  SizedBox(
                    width: kSize16,
                  ),
                  Image.asset(
                    "assets/images/hfq_32.png",
                    width: kSize48,
                    fit: BoxFit.contain,
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
