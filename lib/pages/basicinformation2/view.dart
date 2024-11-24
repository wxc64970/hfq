import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class Basicinformation2Page extends GetView<Basicinformation2Controller> {
  const Basicinformation2Page({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return pagebg(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
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
                            "贷款金额",
                            style: TextStyle(fontSize: kFontSize28, color: Color(0xff333333), fontWeight: FontWeight.w500, height: 1),
                          ),
                          InkWell(
                            onTap: controller.handleLoanAmount,
                            child: Row(
                              children: [
                                Obx(() => Text(
                                      controller.state.loanAmount == 0 ? "请选择" : controller.state.loanAmount.toString(),
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
                            "贷款期限",
                            style: TextStyle(fontSize: kFontSize28, color: Color(0xff333333), fontWeight: FontWeight.w500, height: 1),
                          ),
                          InkWell(
                            onTap: controller.handleLoanPeriod,
                            child: Row(
                              children: [
                                Obx(() => Text(
                                      controller.state.loanPeriod == 0 ? "请选择" : controller.state.loanPeriod.toString(),
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
                            "月收入",
                            style: TextStyle(fontSize: kFontSize28, color: Color(0xff333333), fontWeight: FontWeight.w500, height: 1),
                          ),
                          InkWell(
                            onTap: controller.handleMonthlyInc,
                            child: Row(
                              children: [
                                Obx(() => Text(
                                      controller.state.monthlyInc == "" ? "请选择" : controller.state.monthlyInc,
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
                            "现居城市",
                            style: TextStyle(fontSize: kFontSize28, color: Color(0xff333333), fontWeight: FontWeight.w500, height: 1),
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
                                    child: Obx(() => Text(
                                          controller.state.address.areaName == null
                                              ? "请选择"
                                              : "${controller.state.address.provinceName},${controller.state.address.cityName},${controller.state.address.areaName}",
                                          style: TextStyle(fontSize: kFontSize28, color: Color(0xff888888), height: 1),
                                          textAlign: TextAlign.end,
                                        )),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "社保",
                            style: TextStyle(fontSize: kFontSize28, color: Color(0xff333333), fontWeight: FontWeight.w500, height: 1),
                          ),
                          InkWell(
                            onTap: controller.handleHas,
                            child: Row(
                              children: [
                                Obx(() => Text(
                                      controller.state.has == "" ? "请选择" : controller.state.has,
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
                            "公积金缴纳",
                            style: TextStyle(fontSize: kFontSize28, color: Color(0xff333333), fontWeight: FontWeight.w500, height: 1),
                          ),
                          InkWell(
                            onTap: controller.handleAccumulationFund,
                            child: Row(
                              children: [
                                Obx(() => Text(
                                      controller.state.accumulationFund == "" ? "请选择" : controller.state.accumulationFund,
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
                            "房产情况",
                            style: TextStyle(fontSize: kFontSize28, color: Color(0xff333333), fontWeight: FontWeight.w500, height: 1),
                          ),
                          InkWell(
                            onTap: controller.handleHouseProperty,
                            child: Row(
                              children: [
                                Obx(() => Text(
                                      controller.state.houseProperty == "" ? "请选择" : controller.state.houseProperty,
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
                            "车辆情况",
                            style: TextStyle(fontSize: kFontSize28, color: Color(0xff333333), fontWeight: FontWeight.w500, height: 1),
                          ),
                          InkWell(
                            onTap: controller.handleVehicle,
                            child: Row(
                              children: [
                                Obx(() => Text(
                                      controller.state.vehicle == "" ? "请选择" : controller.state.vehicle,
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
                            "芝麻信用分",
                            style: TextStyle(fontSize: kFontSize28, color: Color(0xff333333), fontWeight: FontWeight.w500, height: 1),
                          ),
                          InkWell(
                            onTap: controller.handleZiMa,
                            child: Row(
                              children: [
                                Obx(() => Text(
                                      controller.state.ziMa == "" ? "请选择" : controller.state.ziMa,
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
                            "个人保险",
                            style: TextStyle(fontSize: kFontSize28, color: Color(0xff333333), fontWeight: FontWeight.w500, height: 1),
                          ),
                          InkWell(
                            onTap: controller.handleInsurance,
                            child: Row(
                              children: [
                                Obx(() => Text(
                                      controller.state.insurance == "" ? "请选择" : controller.state.insurance,
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
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(kSize40, kSize24, kSize40, kSize80),
          decoration: BoxDecoration(color: Colors.white, border: Border(top: BorderSide(width: kSize1, color: Color(0xffCCCCCC).withOpacity(0.5)))),
          width: Get.width,
          child: Column(
            children: [
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
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Basicinformation2Controller>(
      builder: (_) {
        return WillPopScope(
            onWillPop: () {
              controller.onWillPops();
              return Future.value(false);
            },
            child: Scaffold(
              appBar: appBar(
                title: "基本信息",
                onPressed: () {
                  controller.onWillPops();
                },
              ),
              body: _buildView(),
            ));
      },
    );
  }
}
