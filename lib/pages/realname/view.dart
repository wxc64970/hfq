import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';
import 'package:youyi_wallet/common/utils/network_image.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class RealnamePage extends GetView<RealnameController> {
  const RealnamePage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return pagebg(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: kSize20,
          ),
          Image.asset(
            "assets/images/hfq_15.png",
            width: Get.width,
            fit: BoxFit.contain,
          ),
          SizedBox(
            height: kSize16,
          ),
          Container(
            width: Get.width,
            padding: EdgeInsets.all(kSize32),
            margin: EdgeInsets.only(bottom: kSize24),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(kSize20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "上传身份证照片",
                  style: TextStyle(fontSize: kFontSize28, color: Color(0xff333333), height: 1, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: kSize24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.handleUpload(1);
                      },
                      child: Obx(() => controller.state.idCard1 == ""
                          ? Image.asset(
                              "assets/images/hfq_16.png",
                              width: kSize290,
                              fit: BoxFit.contain,
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(kSize20),
                              child: networkImage(
                                width: kSize290,
                                height: kSize254,
                                url: controller.state.idCard1,
                              ),
                            )),
                    ),
                    InkWell(
                      onTap: () {
                        controller.handleUpload(2);
                      },
                      child: Obx(() => controller.state.idCard2 == ""
                          ? Image.asset(
                              "assets/images/hfq_48.png",
                              width: kSize290,
                              fit: BoxFit.contain,
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(kSize20),
                              child: networkImage(
                                width: kSize290,
                                height: kSize254,
                                url: controller.state.idCard2,
                              ),
                            )),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            width: Get.width,
            padding: EdgeInsets.all(kSize32),
            margin: EdgeInsets.only(bottom: kSize24),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(kSize20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: kSize28, bottom: kSize28),
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(width: kSize2, color: Color(0xffCCCCCC).withOpacity(0.5)))),
                  child: Row(
                    children: [
                      Text(
                        "姓名",
                        style: TextStyle(fontSize: kFontSize28, color: Color(0xff333333), fontWeight: FontWeight.w600, height: 1),
                      ),
                      Expanded(
                        child: TextField(
                            readOnly: true,
                            controller: controller.nameController,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.end,
                            focusNode: controller.nameFocusNode,
                            decoration: InputDecoration(
                              hintText: "姓名",
                              border: InputBorder.none,
                              isCollapsed: true,
                              hintStyle: TextStyle(color: Color(0xff888888), fontSize: kFontSize24),
                              // focusedBorder: OutlineInputBorder(
                              //   borderSide: BorderSide(color: Colors.blue), // 设置聚焦时边框颜色，也会影响光标颜色
                              // ),
                            ),
                            style: TextStyle(fontSize: kFontSize24, color: Colors.black)),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: kSize28, bottom: kSize28),
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(width: kSize2, color: Color(0xffCCCCCC).withOpacity(0.5)))),
                  child: Row(
                    children: [
                      Text(
                        "身份证",
                        style: TextStyle(fontSize: kFontSize28, color: Color(0xff333333), fontWeight: FontWeight.w600, height: 1),
                      ),
                      Expanded(
                        child: TextField(
                            readOnly: true,
                            controller: controller.idNumberController,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.end,
                            focusNode: controller.idNumberFocusNode,
                            decoration: InputDecoration(
                              hintText: "身份证",
                              border: InputBorder.none,
                              isCollapsed: true,
                              hintStyle: TextStyle(color: Color(0xff888888), fontSize: kFontSize24),
                              // focusedBorder: OutlineInputBorder(
                              //   borderSide: BorderSide(color: Colors.blue), // 设置聚焦时边框颜色，也会影响光标颜色
                              // ),
                            ),
                            style: TextStyle(fontSize: kFontSize24, color: Colors.black)),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: kSize28, bottom: kSize28),
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(width: kSize2, color: Color(0xffCCCCCC).withOpacity(0.5)))),
                  child: Row(
                    children: [
                      Text(
                        "有效期",
                        style: TextStyle(fontSize: kFontSize28, color: Color(0xff333333), fontWeight: FontWeight.w600, height: 1),
                      ),
                      Expanded(
                        child: TextField(
                            readOnly: true,
                            controller: controller.validController,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.end,
                            focusNode: controller.validFocusNode,
                            decoration: InputDecoration(
                              hintText: "有效期",
                              border: InputBorder.none,
                              isCollapsed: true,
                              hintStyle: TextStyle(color: Color(0xff888888), fontSize: kFontSize24),
                              // focusedBorder: OutlineInputBorder(
                              //   borderSide: BorderSide(color: Colors.blue), // 设置聚焦时边框颜色，也会影响光标颜色
                              // ),
                            ),
                            style: TextStyle(fontSize: kFontSize24, color: Colors.black)),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: kSize28, bottom: kSize28),
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(width: kSize2, color: Color(0xffCCCCCC).withOpacity(0.5)))),
                  child: Row(
                    children: [
                      Text(
                        "地址",
                        style: TextStyle(fontSize: kFontSize28, color: Color(0xff333333), fontWeight: FontWeight.w600, height: 1),
                      ),
                      Expanded(
                        child: TextField(
                            readOnly: true,
                            controller: controller.addressController,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.end,
                            focusNode: controller.addressFocusNode,
                            decoration: InputDecoration(
                              hintText: "地址",
                              border: InputBorder.none,
                              isCollapsed: true,
                              hintStyle: TextStyle(color: Color(0xff888888), fontSize: kFontSize24),
                              // focusedBorder: OutlineInputBorder(
                              //   borderSide: BorderSide(color: Colors.blue), // 设置聚焦时边框颜色，也会影响光标颜色
                              // ),
                            ),
                            style: TextStyle(fontSize: kFontSize24, color: Colors.black)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: kSize110,
          ),
          Center(
            child: agreeWidget(),
          ),
          SizedBox(
            height: kSize24,
          ),
          btnFlatButtonWidget(height: 104, width: Get.width, title: "下一步", onPressed: controller.handleNext, style: TextStyle(color: Colors.white, fontSize: kFontSize32, height: 1))
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RealnameController>(
      id: "realname",
      builder: (_) {
        return WillPopScope(
          onWillPop: () {
            controller.onWillPops();
            return Future.value(false);
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: appBar(
              title: "实名认证",
              onPressed: () {
                controller.onWillPops();
              },
            ),
            body: GestureDetector(
                onTap: () {
                  controller.nameFocusNode.unfocus();
                  controller.idNumberFocusNode.unfocus();
                  controller.validFocusNode.unfocus();
                  controller.addressFocusNode.unfocus();
                },
                child: _buildView()),
          ),
        );
      },
    );
  }
}
