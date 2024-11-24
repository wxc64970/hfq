import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

import '../index.dart';

class backoneWidget extends GetView<RealnameController> {
  const backoneWidget({Key? key}) : super(key: key);

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/hfq_17.png",
                          width: kSize48,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          width: kSize24,
                        ),
                        Text(
                          "信息加密保护中...",
                          style: TextStyle(fontSize: kFontSize36, fontWeight: FontWeight.w600, height: 1, color: AppColors.primaryElement),
                        )
                      ],
                    ),
                    SizedBox(
                      height: kSize32,
                    ),
                    Text(
                      "仅用于身份证核验即借款审核，请放心填写",
                      style: TextStyle(fontSize: kFontSize28, color: Color(0xff888888), height: 1),
                    ),
                    SizedBox(
                      height: kSize56,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: controller.tobacktwo,
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
