import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

import '../index.dart';

class backWidget extends GetView<BasicinformationController> {
  const backWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          // height: kSize400,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(kSize20), topRight: Radius.circular(kSize20)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: const [Color(0xffC5DEFF), Color(0xffF7F7F7), Color(0xffffffff)],
              )),
          child: Stack(
            children: [
              Positioned(
                right: kSize24,
                top: kSize24,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Image.asset(
                    "assets/images/hfq_18.png",
                    width: kSize48,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                width: Get.width,
                padding: EdgeInsets.only(top: kSize70, left: kSize48, right: kSize48, bottom: kSize40),
                child: Column(
                  children: [
                    Text(
                      "您确定放弃借款名额吗？",
                      style: TextStyle(fontSize: kFontSize36, color: Color(0xff333333), fontWeight: FontWeight.w600, height: 1),
                    ),
                    SizedBox(
                      height: kSize32,
                    ),
                    Image.asset(
                      "assets/images/hfq_40.png",
                      width: kSize400,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      "该项资料非常重要，仅用于额度评估",
                      style: TextStyle(fontSize: kFontSize28, color: Color(0xff888888), height: 1),
                    ),
                    SizedBox(
                      height: kSize40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/hfq_41.png",
                          width: kSize32,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          width: kSize16,
                        ),
                        Text(
                          "离开将无法评估您的额度",
                          style: TextStyle(color: Color(0xffD88900), fontSize: kFontSize24, height: 1),
                        )
                      ],
                    ),
                    SizedBox(
                      height: kSize56,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                            Get.back();
                          },
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
}
