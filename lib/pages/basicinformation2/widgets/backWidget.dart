import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

import '../index.dart';

class backWidget extends GetView<Basicinformation2Controller> {
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
                      "今日放款名额即将抢光",
                      style: TextStyle(fontSize: kFontSize36, color: Color(0xff333333), fontWeight: FontWeight.w600, height: 1),
                    ),
                    SizedBox(
                      height: kSize16,
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
                    // SizedBox(
                    //   height: kSize32,
                    // ),
                    // Image.asset(
                    //   "assets/images/hfq_44.png",
                    //   width: Get.width,
                    //   fit: BoxFit.contain,
                    // ),
                    SizedBox(
                      height: kSize32,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "今日成功放款率:",
                          style: TextStyle(fontSize: kFontSize28, color: Color(0xff888888), height: 1),
                        ),
                        Text(
                          "96%",
                          style: TextStyle(fontSize: kFontSize28, color: Color(0xff00C427), height: 1),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: kSize40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            // Get.offUntil(GetPageRoute(page: () => ApplicationPage()), (route) => false);
                            // Future.delayed(Duration.zero, () {
                            //   Get.toNamed(RouteNames.application);
                            // });
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
