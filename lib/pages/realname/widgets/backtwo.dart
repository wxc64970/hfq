import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

import '../index.dart';

class backtwoWidget extends GetView<RealnameController> {
  const backtwoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(kSize20), topRight: Radius.circular(kSize20)),
          ),
          child: Stack(
            children: [
              Positioned(
                right: kSize24,
                top: kSize24,
                child: GestureDetector(
                  onTap: () {
                    for (var item in controller.state.surveyItems) {
                      item.isSelected.value = false;
                    }
                    Get.back();
                  },
                  child: Image.asset(
                    "assets/images/hfq_18.png",
                    width: kSize48,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                width: Get.width,
                padding: EdgeInsets.symmetric(vertical: kSize50, horizontal: kSize48),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "调查问卷",
                        style: TextStyle(fontSize: kFontSize32, color: Color(0xff333333), fontWeight: FontWeight.w600, height: 1),
                      ),
                    ),
                    SizedBox(
                      height: kSize58,
                    ),
                    Text(
                      "您放弃申请的原因是什么？（多选）",
                      style: TextStyle(fontSize: kFontSize32, color: Color(0xff333333), fontWeight: FontWeight.w500, height: 1),
                    ),
                    SizedBox(
                      height: kSize64,
                    ),
                    Column(
                      children: itemWidget(),
                    ),
                    SizedBox(
                      height: kSize30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: controller.gobacktwo,
                          child: Column(
                            children: [
                              Container(
                                height: kSize86,
                                padding: EdgeInsets.only(right: kSize100, left: kSize100),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(kSize50), color: Color(0xff2B66FF).withOpacity(0.1)),
                                child: Center(
                                  child: Text(
                                    "放弃名额",
                                    style: TextStyle(fontSize: kFontSize28, color: AppColors.primaryElement, height: 1, fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: kSize40,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: kSize16,
                        ),
                        GestureDetector(
                          onTap: () {
                            for (var item in controller.state.surveyItems) {
                              item.isSelected.value = false;
                            }
                            Get.back();
                          },
                          child: Column(
                            children: [
                              Container(
                                height: kSize86,
                                padding: EdgeInsets.only(right: kSize100, left: kSize100),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(kSize50), color: AppColors.primaryElement),
                                child: Center(
                                  child: Text(
                                    "继续借款",
                                    style: TextStyle(fontSize: kFontSize28, color: Colors.white, height: 1, fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              Transform.translate(
                                offset: Offset(kSize90, -kSize110),
                                child: Image.asset("assets/images/hfq_19.png", width: kSize190, fit: BoxFit.contain),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> itemWidget() {
    return List.generate(controller.state.surveyItems.length, (index) {
      final item = controller.state.surveyItems[index];
      return Obx(() => CheckboxListTile(
          value: item.isSelected.value,
          title: Text(item.title),
          onChanged: (value) {
            controller.toggleSelection(item.title);
          },
          controlAffinity: ListTileControlAffinity.leading,
          checkboxShape: CircleBorder()));
    });
  }
}
