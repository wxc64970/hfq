import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

import 'index.dart';

class SettingPage extends GetView<SettingController> {
  const SettingPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return pagebg(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: kSize58,
        ),
        Container(
          padding: EdgeInsets.all(kSize32),
          margin: EdgeInsets.only(bottom: kSize48),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(kSize20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: controller.handleContact,
                child: Container(
                  padding: EdgeInsets.only(top: kSize28, bottom: kSize28),
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(width: kSize2, color: Color(0xffCCCCCC).withOpacity(0.5)))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/hfq_33.png",
                            width: kSize32,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(
                            width: kSize24,
                          ),
                          Text(
                            "关于我们",
                            style: TextStyle(fontSize: kFontSize28, color: Color(0xff333333), fontWeight: FontWeight.w600, height: 1),
                          )
                        ],
                      ),
                      Image.asset(
                        "assets/images/hfq_32.png",
                        width: kSize48,
                        fit: BoxFit.contain,
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: controller.logOut,
                child: Container(
                  padding: EdgeInsets.only(top: kSize28, bottom: kSize28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/hfq_34.png",
                            width: kSize32,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(
                            width: kSize24,
                          ),
                          Text(
                            "退出登录",
                            style: TextStyle(fontSize: kFontSize28, color: Color(0xff333333), fontWeight: FontWeight.w600, height: 1),
                          )
                        ],
                      ),
                      Image.asset(
                        "assets/images/hfq_32.png",
                        width: kSize48,
                        fit: BoxFit.contain,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Center(
          child: InkWell(
            onTap: controller.cancelAccount,
            child: Text(
              "注销账号",
              style: TextStyle(fontSize: kFontSize24, color: AppColors.primaryElement),
            ),
          ),
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      builder: (_) {
        return Scaffold(
          appBar: appBar(
            title: "设置",
            onPressed: () {
              Get.back();
            },
          ),
          body: _buildView(),
        );
      },
    );
  }
}
