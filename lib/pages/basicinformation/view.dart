import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class BasicinformationPage extends GetView<BasicinformationController> {
  const BasicinformationPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: pagebg(
            child: SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    margin: EdgeInsets.only(bottom: kSize24),
                    padding: EdgeInsets.all(kSize32),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(kSize20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "学历",
                              style: TextStyle(fontSize: kFontSize28, color: Color(0xff333333), fontWeight: FontWeight.w500, height: 1),
                            ),
                            InkWell(
                              onTap: controller.handleEducation,
                              child: Row(
                                children: [
                                  Obx(() => Text(
                                        controller.state.education == "" ? "请选择" : controller.state.education,
                                        style: TextStyle(fontSize: kFontSize28, color: Color(0xff888888), height: 1),
                                      )),
                                  SizedBox(
                                    width: kSize16,
                                  ),
                                  Image.asset(
                                    "assets/images/hfq_39.png",
                                    width: kSize40,
                                    fit: BoxFit.contain,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: kSize2,
                          width: Get.width,
                          margin: EdgeInsets.only(top: kSize32, bottom: kSize32),
                          color: Color(0xffCCCCCC).withOpacity(0.5),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "婚姻状况",
                              style: TextStyle(fontSize: kFontSize28, color: Color(0xff333333), fontWeight: FontWeight.w500, height: 1),
                            ),
                            InkWell(
                              onTap: controller.handleMaritalStatus,
                              child: Row(
                                children: [
                                  Obx(() => Text(
                                        controller.state.maritalStatus == "" ? "请选择" : controller.state.maritalStatus,
                                        style: TextStyle(fontSize: kFontSize28, color: Color(0xff888888), height: 1),
                                      )),
                                  SizedBox(
                                    width: kSize16,
                                  ),
                                  Image.asset(
                                    "assets/images/hfq_39.png",
                                    width: kSize40,
                                    fit: BoxFit.contain,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: kSize2,
                          width: Get.width,
                          margin: EdgeInsets.only(top: kSize32, bottom: kSize32),
                          color: Color(0xffCCCCCC).withOpacity(0.5),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "职业",
                              style: TextStyle(fontSize: kFontSize28, color: Color(0xff333333), fontWeight: FontWeight.w500, height: 1),
                            ),
                            InkWell(
                              onTap: controller.handdeProfessional,
                              child: Row(
                                children: [
                                  Obx(() => Text(
                                        controller.state.professional == "" ? "请选择" : controller.state.professional,
                                        style: TextStyle(fontSize: kFontSize28, color: Color(0xff888888), height: 1),
                                      )),
                                  SizedBox(
                                    width: kSize16,
                                  ),
                                  Image.asset(
                                    "assets/images/hfq_39.png",
                                    width: kSize40,
                                    fit: BoxFit.contain,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: kSize24),
                    padding: EdgeInsets.all(kSize32),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(kSize20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "紧急联系人1",
                          style: TextStyle(
                            fontSize: kFontSize32,
                            color: AppColors.primaryElement,
                            fontWeight: FontWeight.w500,
                            height: 1,
                          ),
                        ),
                        SizedBox(
                          height: kSize24,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "姓名",
                              style: TextStyle(fontSize: kFontSize28, color: Color(0xff333333), fontWeight: FontWeight.w500, height: 1),
                            ),
                            Expanded(
                              child: TextField(
                                  cursorColor: AppColors.primaryElement,
                                  controller: controller.state.name1Controller,
                                  keyboardType: TextInputType.text,
                                  textAlign: TextAlign.end,
                                  focusNode: controller.state.name1FocusNode,
                                  inputFormatters: [
                                    // FilteringTextInputFormatter.allow(RegExp("[\u4e00-\u9fa5]")), //只能输入汉字[a-zA-Z]|[\u4e00-\u9fa5]|[0-9]
                                    // LengthLimitingTextInputFormatter(20), //最大长度
                                    CustomizedTextInputFormatter(filterPattern: RegExp("[\u4e00-\u9fa5]")),
                                    CustomizedLengthTextInputFormatter(10)
                                  ],
                                  decoration: InputDecoration(
                                    hintText: "请输入姓名",
                                    border: InputBorder.none,
                                    isCollapsed: true,
                                    hintStyle: TextStyle(color: Color(0xff888888), fontSize: kFontSize28),
                                  ),
                                  style: TextStyle(fontSize: kFontSize24, color: Colors.black)),
                            )
                          ],
                        ),
                        Container(
                          height: kSize2,
                          width: Get.width,
                          margin: EdgeInsets.only(top: kSize32, bottom: kSize32),
                          color: Color(0xffCCCCCC).withOpacity(0.5),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "关系",
                              style: TextStyle(fontSize: kFontSize28, color: Color(0xff333333), fontWeight: FontWeight.w500, height: 1),
                            ),
                            InkWell(
                              onTap: () {
                                controller.handleRelation(1);
                              },
                              child: Row(
                                children: [
                                  Obx(() => Text(
                                        controller.state.emergencyContact1['relation'] == null ? "请选择" : controller.state.emergencyContact1['relation'],
                                        style: TextStyle(fontSize: kFontSize28, color: Color(0xff888888), height: 1),
                                      )),
                                  SizedBox(
                                    width: kSize16,
                                  ),
                                  Image.asset(
                                    "assets/images/hfq_39.png",
                                    width: kSize40,
                                    fit: BoxFit.contain,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: kSize2,
                          width: Get.width,
                          margin: EdgeInsets.only(top: kSize32, bottom: kSize32),
                          color: Color(0xffCCCCCC).withOpacity(0.5),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "手机号",
                              style: TextStyle(fontSize: kFontSize28, color: Color(0xff333333), fontWeight: FontWeight.w500, height: 1),
                            ),
                            Expanded(
                              child: TextField(
                                  cursorColor: AppColors.primaryElement,
                                  controller: controller.state.phone1Controller,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.end,
                                  focusNode: controller.state.phone1FocusNode,
                                  decoration: InputDecoration(
                                    hintText: "请输入手机号",
                                    border: InputBorder.none,
                                    isCollapsed: true,
                                    hintStyle: TextStyle(color: Color(0xff888888), fontSize: kFontSize28),
                                  ),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                    LengthLimitingTextInputFormatter(11),
                                  ],
                                  style: TextStyle(fontSize: kFontSize24, color: Colors.black)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: kSize24),
                    padding: EdgeInsets.all(kSize32),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(kSize20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "紧急联系人2",
                          style: TextStyle(
                            fontSize: kFontSize32,
                            color: AppColors.primaryElement,
                            fontWeight: FontWeight.w500,
                            height: 1,
                          ),
                        ),
                        SizedBox(
                          height: kSize24,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "姓名",
                              style: TextStyle(fontSize: kFontSize28, color: Color(0xff333333), fontWeight: FontWeight.w500, height: 1),
                            ),
                            Expanded(
                              child: TextField(
                                  cursorColor: AppColors.primaryElement,
                                  controller: controller.state.name2Controller,
                                  keyboardType: TextInputType.text,
                                  textAlign: TextAlign.end,
                                  focusNode: controller.state.name2FocusNode,
                                  inputFormatters: [
                                    // FilteringTextInputFormatter.allow(), //只能输入汉字[a-zA-Z]|[\u4e00-\u9fa5]|[0-9]
                                    CustomizedTextInputFormatter(filterPattern: RegExp("[\u4e00-\u9fa5]")),
                                    CustomizedLengthTextInputFormatter(10)
                                  ],
                                  decoration: InputDecoration(
                                    hintText: "请输入姓名",
                                    border: InputBorder.none,
                                    isCollapsed: true,
                                    hintStyle: TextStyle(color: Color(0xff888888), fontSize: kFontSize28),
                                  ),
                                  style: TextStyle(fontSize: kFontSize24, color: Colors.black)),
                            )
                          ],
                        ),
                        Container(
                          height: kSize2,
                          width: Get.width,
                          margin: EdgeInsets.only(top: kSize32, bottom: kSize32),
                          color: Color(0xffCCCCCC).withOpacity(0.5),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "关系",
                              style: TextStyle(fontSize: kFontSize28, color: Color(0xff333333), fontWeight: FontWeight.w500, height: 1),
                            ),
                            InkWell(
                              onTap: () {
                                controller.handleRelation(2);
                              },
                              child: Row(
                                children: [
                                  Obx(() => Text(
                                        controller.state.emergencyContact2['relation'] == null ? "请选择" : controller.state.emergencyContact2['relation'],
                                        style: TextStyle(fontSize: kFontSize28, color: Color(0xff888888), height: 1),
                                      )),
                                  SizedBox(
                                    width: kSize16,
                                  ),
                                  Image.asset(
                                    "assets/images/hfq_39.png",
                                    width: kSize40,
                                    fit: BoxFit.contain,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: kSize2,
                          width: Get.width,
                          margin: EdgeInsets.only(top: kSize32, bottom: kSize32),
                          color: Color(0xffCCCCCC).withOpacity(0.5),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "手机号",
                              style: TextStyle(fontSize: kFontSize28, color: Color(0xff333333), fontWeight: FontWeight.w500, height: 1),
                            ),
                            Expanded(
                              child: TextField(
                                  cursorColor: AppColors.primaryElement,
                                  controller: controller.state.phone2Controller,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.end,
                                  focusNode: controller.state.phone2FocusNode,
                                  decoration: InputDecoration(
                                    hintText: "请输入手机号",
                                    border: InputBorder.none,
                                    isCollapsed: true,
                                    hintStyle: TextStyle(color: Color(0xff888888), fontSize: kFontSize28),
                                  ),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                    LengthLimitingTextInputFormatter(11),
                                  ],
                                  style: TextStyle(fontSize: kFontSize24, color: Colors.black)),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(kSize40, kSize24, kSize40, kSize80),
          decoration: BoxDecoration(color: Colors.white, border: Border(top: BorderSide(width: kSize1, color: Color(0xffCCCCCC).withOpacity(0.5)))),
          width: Get.width,
          child: Column(
            children: [
              Text.rich(TextSpan(
                style: TextStyle(
                  fontSize: kFontSize24,
                  color: Color(0xffcccccc),
                ),
                children: [
                  const TextSpan(text: "已有"),
                  TextSpan(
                      text: "100万",
                      style: TextStyle(
                        color: Color(0xffD88900),
                      )),
                  const TextSpan(text: "人在本平台成功申请贷款"),
                ],
              )),
              SizedBox(
                height: kSize24,
              ),
              agreeWidget(),
              SizedBox(
                height: kSize24,
              ),
              btnFlatButtonWidget(
                  onPressed: controller.handleNext, title: "下一步", height: 104, width: Get.width, style: TextStyle(fontSize: kFontSize32, color: Colors.white, fontWeight: FontWeight.w500))
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BasicinformationController>(
      builder: (_) {
        return WillPopScope(
            onWillPop: () {
              controller.onWillPops();
              return Future.value(false);
            },
            child: GestureDetector(
              onTap: controller.handleUnfocus,
              child: Scaffold(
                appBar: appBar(
                  title: "基本信息",
                  onPressed: () {
                    controller.onWillPops();
                  },
                ),
                body: _buildView(),
              ),
            ));
      },
    );
  }
}
