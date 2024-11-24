import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

import '../index.dart';

/// hello
class OptionWidget extends GetView<BasicinformationController> {
  final String title;
  final String keys;
  final List data;
  const OptionWidget(this.title, this.keys, this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.fromLTRB(kSize32, kSize46, kSize32, kSize80),
      decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(kSize24), topRight: Radius.circular(kSize24)), color: Color(0xffF7F7F7)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
                    },
                    child: Image.asset(
                      "assets/images/hfq_18.png",
                      width: kSize48,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: kSize50,
          ),
          keys == "professional"
              ? Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(data.length, (index) {
                        final item = data[index];
                        return Obx(() => InkWell(
                              onTap: () {
                                Get.back();
                                if (keys == "education") {
                                  controller.state.education = item;
                                } else if (keys == "maritalStatus") {
                                  controller.state.maritalStatus = item;
                                } else if (keys == "maritalStatus") {
                                  controller.state.maritalStatus = item;
                                } else if (keys == "relation1") {
                                  controller.state.relation = item;
                                  controller.state.emergencyContact1['relation'] = item;
                                } else if (keys == "relation2") {
                                  controller.state.relation = item;
                                  controller.state.emergencyContact2['relation'] = item;
                                } else if (keys == "professional") {
                                  controller.state.professional = item;
                                }
                              },
                              child: Container(
                                width: Get.width,
                                margin: EdgeInsets.only(bottom: kSize16),
                                padding: EdgeInsets.only(top: kSize24, bottom: kSize24),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(kSize20),
                                    color: keys == "education"
                                        ? controller.state.education == "" || controller.state.education != item
                                            ? Colors.white
                                            : Colors.black12
                                        : keys == "maritalStatus"
                                            ? controller.state.maritalStatus == "" || controller.state.maritalStatus != item
                                                ? Colors.white
                                                : Colors.black12
                                            : keys == "relation1"
                                                ? controller.state.emergencyContact1['relation'] == null || controller.state.emergencyContact1['relation'] != item
                                                    ? Colors.white
                                                    : Colors.black12
                                                : keys == "relation2"
                                                    ? controller.state.emergencyContact2['relation'] == null || controller.state.emergencyContact2['relation'] != item
                                                        ? Colors.white
                                                        : Colors.black12
                                                    : keys == "professional"
                                                        ? controller.state.professional == "" || controller.state.professional != item
                                                            ? Colors.white
                                                            : Colors.black12
                                                        : Colors.white),
                                child: Center(
                                  child: Text(
                                    item,
                                    style: TextStyle(fontSize: kFontSize28, color: Color(0xff333333), fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ));
                      }),
                    ),
                  ),
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(data.length, (index) {
                    final item = data[index];
                    return Obx(() => InkWell(
                          onTap: () {
                            Get.back();
                            if (keys == "education") {
                              controller.state.education = item;
                            } else if (keys == "maritalStatus") {
                              controller.state.maritalStatus = item;
                            } else if (keys == "maritalStatus") {
                              controller.state.maritalStatus = item;
                            } else if (keys == "relation1") {
                              controller.state.relation = item;
                              controller.state.emergencyContact1['relation'] = item;
                            } else if (keys == "relation2") {
                              controller.state.relation = item;
                              controller.state.emergencyContact2['relation'] = item;
                            } else if (keys == "professional") {
                              controller.state.professional = item;
                            }
                          },
                          child: Container(
                            width: Get.width,
                            margin: EdgeInsets.only(bottom: kSize16),
                            padding: EdgeInsets.only(top: kSize24, bottom: kSize24),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(kSize20),
                                color: keys == "education"
                                    ? controller.state.education == "" || controller.state.education != item
                                        ? Colors.white
                                        : Colors.black12
                                    : keys == "maritalStatus"
                                        ? controller.state.maritalStatus == "" || controller.state.maritalStatus != item
                                            ? Colors.white
                                            : Colors.black12
                                        : keys == "relation1"
                                            ? controller.state.emergencyContact1['relation'] == null || controller.state.emergencyContact1['relation'] != item
                                                ? Colors.white
                                                : Colors.black12
                                            : keys == "relation2"
                                                ? controller.state.emergencyContact2['relation'] == null || controller.state.emergencyContact2['relation'] != item
                                                    ? Colors.white
                                                    : Colors.black12
                                                : keys == "professional"
                                                    ? controller.state.professional == "" || controller.state.professional != item
                                                        ? Colors.white
                                                        : Colors.black12
                                                    : Colors.white),
                            child: Center(
                              child: Text(
                                item,
                                style: TextStyle(fontSize: kFontSize28, color: Color(0xff333333), fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ));
                  }),
                ),
        ],
      ),
    );
  }
}
