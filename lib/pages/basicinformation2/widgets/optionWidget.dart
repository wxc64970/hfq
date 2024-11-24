import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

import '../index.dart';

/// hello
class OptionWidget extends GetView<Basicinformation2Controller> {
  final String title;
  final String keys;
  final List data;
  const OptionWidget(this.title, this.keys, this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int initialItem = 0;
    if (keys == "loanAmount") {
      if (controller.state.loanAmount != 0) {
        initialItem = controller.loanAmountList.indexWhere((item) => item == controller.state.loanAmount);
      }
    } else if (keys == "loanPeriod") {
      if (controller.state.loanPeriod != 0) {
        initialItem = controller.loanPeriodList.indexWhere((item) => item == controller.state.loanPeriod);
      }
    } else if (keys == "monthlyInc") {
      if (controller.state.monthlyInc != "") {
        initialItem = controller.monthlyIncList.indexWhere((item) => item == controller.state.monthlyInc);
      }
    } else if (keys == "accumulationFund") {
      if (controller.state.accumulationFund != "") {
        initialItem = controller.dataList.indexWhere((item) => item == controller.state.accumulationFund);
      }
    } else if (keys == "houseProperty") {
      if (controller.state.houseProperty != "") {
        initialItem = controller.dataList.indexWhere((item) => item == controller.state.houseProperty);
      }
    } else if (keys == "vehicle") {
      if (controller.state.vehicle != "") {
        initialItem = controller.dataList.indexWhere((item) => item == controller.state.vehicle);
      }
    } else if (keys == "ziMa") {
      if (controller.state.ziMa != "") {
        initialItem = controller.ziMaList.indexWhere((item) => item == controller.state.ziMa);
      }
    } else if (keys == "has") {
      if (controller.state.has != "") {
        initialItem = controller.dataList.indexWhere((item) => item == controller.state.has);
      }
    } else if (keys == "insurance") {
      if (controller.state.insurance != "") {
        initialItem = controller.insuranceList.indexWhere((item) => item == controller.state.insurance);
      }
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: Get.width,
          padding: EdgeInsets.fromLTRB(kSize32, kSize46, kSize32, kSize80),
          decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(kSize24), topRight: Radius.circular(kSize24)), color: Color(0xffF7F7F7)),
          child: Column(
            children: [
              SizedBox(
                width: Get.width,
                height: kSize48,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: kFontSize32, color: Color(0xff333333), fontWeight: FontWeight.w600, height: 1),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: InkWell(
                        onTap: () {
                          Get.back();
                          if (keys == "loanAmount") {
                            if (controller.state.loanAmount == 0) {
                              controller.state.loanAmount = controller.loanAmountList[0];
                            }
                          } else if (keys == "loanPeriod") {
                            if (controller.state.loanPeriod == 0) {
                              controller.state.loanPeriod = controller.loanPeriodList[0];
                            }
                          } else if (keys == "monthlyInc") {
                            if (controller.state.monthlyInc == "") {
                              controller.state.monthlyInc = controller.monthlyIncList[0];
                            }
                          } else if (keys == "accumulationFund") {
                            if (controller.state.accumulationFund == "") {
                              controller.state.accumulationFund = controller.dataList[0];
                            }
                          } else if (keys == "houseProperty") {
                            if (controller.state.houseProperty == "") {
                              controller.state.houseProperty = controller.dataList[0];
                            }
                          } else if (keys == "vehicle") {
                            if (controller.state.vehicle == "") {
                              controller.state.vehicle = controller.dataList[0];
                            }
                          } else if (keys == "ziMa") {
                            if (controller.state.ziMa == "") {
                              controller.state.ziMa = controller.ziMaList[0];
                            }
                          } else if (keys == "has") {
                            if (controller.state.has == "") {
                              controller.state.has = controller.dataList[0];
                            }
                          } else if (keys == "insurance") {
                            if (controller.state.insurance == "") {
                              controller.state.insurance = controller.insuranceList[0];
                            }
                          }
                        },
                        child: Text(
                          "确认",
                          style: TextStyle(fontSize: kFontSize28, color: AppColors.primaryElement, fontWeight: FontWeight.w500, height: 1),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: kSize50,
              ),
              SizedBox(
                height: kSize360,
                child: CupertinoPicker(
                  scrollController: FixedExtentScrollController(initialItem: initialItem),
                  itemExtent: kSize90, // 每个item的高度
                  onSelectedItemChanged: (value) {
                    if (keys == "loanAmount") {
                      controller.state.loanAmount = data[value];
                    } else if (keys == "loanPeriod") {
                      controller.state.loanPeriod = data[value];
                    } else if (keys == "monthlyInc") {
                      controller.state.monthlyInc = data[value];
                    } else if (keys == "accumulationFund") {
                      controller.state.accumulationFund = data[value];
                    } else if (keys == "houseProperty") {
                      controller.state.houseProperty = data[value];
                    } else if (keys == "vehicle") {
                      controller.state.vehicle = data[value];
                    } else if (keys == "ziMa") {
                      controller.state.ziMa = data[value];
                    } else if (keys == "has") {
                      controller.state.has = data[value];
                    } else if (keys == "insurance") {
                      controller.state.insurance = data[value];
                    }
                  },
                  children: data.map((month) {
                    return Center(
                        child: Text(
                      "$month",
                      style: TextStyle(color: Color(0xff333333), fontSize: kFontSize32, fontWeight: FontWeight.w600),
                    ));
                  }).toList(),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
