import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

import '../index.dart';

/// hello
class BodyWidget extends GetView<LoanbasicinformationController> {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
          child: pagebg(
              child: Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: SingleChildScrollView(
                              padding: EdgeInsets.zero,
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                SizedBox(
                                  height: kSize24,
                                ),
                                Image.asset(
                                  "assets/images/hfq_50.png",
                                  width: Get.width,
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(
                                  height: kSize16,
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: kSize24),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(kSize20), color: Colors.white),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: Get.width,
                                        padding: EdgeInsets.all(kSize24),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(kSize20), topRight: Radius.circular(kSize20)), color: const Color(0xffD88900).withOpacity(0.1)),
                                        child: Center(
                                          child: Text.rich(
                                              style: TextStyle(fontSize: kFontSize30, color: const Color(0xff3D3D3D), fontWeight: FontWeight.w500, height: 1),
                                              const TextSpan(children: [
                                                TextSpan(text: "填写"),
                                                TextSpan(text: "相关信息", style: TextStyle(color: Color(0xffE99022))),
                                                TextSpan(text: "，即刻完成激活"),
                                              ])),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(kSize32),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
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
                                                      controller: controller.nameController,
                                                      keyboardType: TextInputType.text,
                                                      textAlign: TextAlign.end,
                                                      focusNode: controller.nameFocusNode,
                                                      onChanged: controller.onChanged1,
                                                      inputFormatters: [CustomizedTextInputFormatter(filterPattern: RegExp("[\u4e00-\u9fa5]")), CustomizedLengthTextInputFormatter(10)],
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
                                              color: const Color(0xffCCCCCC).withOpacity(0.5),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  "身份证",
                                                  style: TextStyle(fontSize: kFontSize28, color: const Color(0xff333333), fontWeight: FontWeight.w500, height: 1),
                                                ),
                                                Expanded(
                                                  child: TextField(
                                                      cursorColor: AppColors.primaryElement,
                                                      controller: controller.idCardController,
                                                      keyboardType: TextInputType.number,
                                                      textAlign: TextAlign.end,
                                                      focusNode: controller.idCardFocusNode,
                                                      onChanged: controller.onChanged2,
                                                      // inputFormatters: [],
                                                      decoration: InputDecoration(
                                                        hintText: "请输入身份证",
                                                        border: InputBorder.none,
                                                        isCollapsed: true,
                                                        hintStyle: TextStyle(color: const Color(0xff888888), fontSize: kFontSize28),
                                                      ),
                                                      style: TextStyle(fontSize: kFontSize24, color: Colors.black)),
                                                )
                                              ],
                                            ),
                                            Container(
                                              height: kSize2,
                                              width: Get.width,
                                              margin: EdgeInsets.only(top: kSize32, bottom: kSize32),
                                              color: const Color(0xffCCCCCC).withOpacity(0.5),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  "现居城市",
                                                  style: TextStyle(fontSize: kFontSize28, color: const Color(0xff333333), fontWeight: FontWeight.w500, height: 1),
                                                ),
                                                SizedBox(
                                                  width: kSize30,
                                                ),
                                                Expanded(
                                                  child: InkWell(
                                                    onTap: controller.handleAddress,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            controller.state.address.cityName == null ? "请选择" : "${controller.state.address.provinceName},${controller.state.address.cityName}",
                                                            style: TextStyle(fontSize: kFontSize28, color: const Color(0xff888888), height: 1),
                                                            textAlign: TextAlign.end,
                                                          ),
                                                        ),
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
                                                  ),
                                                )
                                              ],
                                            ),
                                            Container(
                                              height: kSize2,
                                              width: Get.width,
                                              margin: EdgeInsets.only(top: kSize32, bottom: kSize20),
                                              color: const Color(0xffCCCCCC).withOpacity(0.5),
                                            ),
                                            Text(
                                              "金融机构不支持跨地区申请贷款，请如实选择贷款城市",
                                              style: TextStyle(fontSize: kFontSize20, color: const Color(0xff888888)),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                !controller.state.isShow
                                    ? const SizedBox()
                                    : Container(
                                        margin: EdgeInsets.only(bottom: kSize24),
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(kSize20), color: Colors.white),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: Get.width,
                                              padding: EdgeInsets.all(kSize24),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(kSize20), topRight: Radius.circular(kSize20)),
                                                  color: const Color(0xffD88900).withOpacity(0.1)),
                                              child: Center(
                                                child: Text.rich(
                                                    style: TextStyle(fontSize: kFontSize30, color: const Color(0xff3D3D3D), fontWeight: FontWeight.w500, height: 1),
                                                    const TextSpan(children: [
                                                      TextSpan(text: "请修改确认您的"),
                                                      TextSpan(text: "真实信息", style: TextStyle(color: Color(0xffE99022))),
                                                      TextSpan(text: "，通过率提升"),
                                                      TextSpan(text: "80%", style: TextStyle(color: Color(0xffE99022))),
                                                    ])),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(kSize32),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  ...List.generate(controller.state.formDatas.length, (index) {
                                                    var item = controller.state.formDatas[index];
                                                    return Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        InkWell(
                                                          splashColor: Colors.transparent,
                                                          highlightColor: Colors.transparent,
                                                          onTap: () {
                                                            print(1111);
                                                            controller.state.formDatas[index]['isExpanded'].value = !item['isExpanded'].value;
                                                            controller.update();
                                                          },
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Text(
                                                                item['title'],
                                                                style: TextStyle(fontSize: kFontSize28, color: const Color(0xff333333), fontWeight: FontWeight.w500, height: 1),
                                                              ),
                                                              SizedBox(
                                                                width: kSize30,
                                                              ),
                                                              Expanded(
                                                                child: Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child: Text(
                                                                        controller.state.selectDatas[item['field']] == "" ? "请选择" : controller.state.selectDatas[item['field']],
                                                                        style: TextStyle(fontSize: kFontSize28, color: const Color(0xff888888), height: 1),
                                                                        textAlign: TextAlign.end,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: kSize16,
                                                                    ),
                                                                    Image.asset(
                                                                      item['isExpanded'].value ? "assets/images/hfq_repayment_arrow_down.png" : "assets/images/hfq_payment_arrow_right.png",
                                                                      width: kSize40,
                                                                      fit: BoxFit.contain,
                                                                    )
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          height: kSize2,
                                                          width: Get.width,
                                                          margin: EdgeInsets.only(top: kSize32, bottom: kSize32),
                                                          color: const Color(0xffCCCCCC).withOpacity(0.5),
                                                        ),
                                                        !item['isExpanded'].value
                                                            ? const SizedBox()
                                                            : Wrap(
                                                                spacing: kSize26,
                                                                runSpacing: kSize32,
                                                                children: [
                                                                  ...List.generate(item['list'].length, (i) {
                                                                    var it = item['list'][i];
                                                                    return InkWell(
                                                                      splashColor: Colors.transparent,
                                                                      highlightColor: Colors.transparent,
                                                                      onTap: () {
                                                                        controller.state.selectDatas[item['field']] = it;
                                                                        controller.state.selectDatas.update(item['field'], (value) => it);
                                                                        controller.update();
                                                                      },
                                                                      child: Container(
                                                                        width: kSize190,
                                                                        height: kSize58,
                                                                        clipBehavior: Clip.none,
                                                                        decoration: BoxDecoration(
                                                                            image: DecorationImage(
                                                                                image: AssetImage(
                                                                                    controller.state.selectDatas[item['field']] == it ? "assets/images/hfq_52.png" : "assets/images/hfq_51.png"),
                                                                                fit: BoxFit.contain)),
                                                                        child: Stack(
                                                                          clipBehavior: Clip.none,
                                                                          children: [
                                                                            item['isTips'] == i
                                                                                ? Positioned(
                                                                                    left: 0,
                                                                                    top: -kSize10,
                                                                                    child: Image.asset(
                                                                                      "assets/images/hfq_53.png",
                                                                                      width: kSize80,
                                                                                      fit: BoxFit.contain,
                                                                                    ),
                                                                                  )
                                                                                : const SizedBox(),
                                                                            SizedBox(
                                                                              width: Get.width,
                                                                              height: Get.height,
                                                                              child: Center(
                                                                                child: Text(
                                                                                  it,
                                                                                  style: TextStyle(fontSize: kFontSize22, color: const Color(0xff3D3D3D)),
                                                                                ),
                                                                              ),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    );
                                                                  })
                                                                ],
                                                              ),
                                                        SizedBox(
                                                          height: kSize40,
                                                        )
                                                      ],
                                                    );
                                                  })
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                              ]))),
                      !controller.state.isShow
                          ? const SizedBox()
                          : Container(
                              padding: EdgeInsets.fromLTRB(kSize30, kSize30, kSize30, kSize60),
                              child: btnFlatButtonWidget(
                                  onPressed: controller.handleApply,
                                  title: "立即申请",
                                  height: 76,
                                  width: Get.width,
                                  style: TextStyle(fontSize: kFontSize32, color: Colors.white, fontWeight: FontWeight.w500)),
                            )
                    ],
                  ))))
    ]);
  }
}
