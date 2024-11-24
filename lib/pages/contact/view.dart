import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

import 'index.dart';

class ContactPage extends GetView<ContactController> {
  const ContactPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return pagebg(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: kSize98,
          ),
          Image.asset(
            "assets/images/hfq_35.png",
            width: kSize120,
            fit: BoxFit.contain,
          ),
          SizedBox(
            height: kSize24,
          ),
          Text(
            "惠分期",
            style: TextStyle(fontSize: kFontSize48, color: AppColors.primaryElement, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: kSize80,
          ),
          Container(
            padding: EdgeInsets.all(kSize32),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(kSize20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/hfq_36.png",
                          width: kSize32,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          width: kSize24,
                        ),
                        Text(
                          "客服热线",
                          style: TextStyle(fontSize: kFontSize28, color: Color(0xff333333), height: 1),
                        )
                      ],
                    ),
                    InkWell(
                      onTap: controller.ToTel,
                      child: Row(
                        children: [
                          Text(
                            "${Constants.serviceTel}",
                            style: TextStyle(fontSize: kFontSize24, color: Color(0xff888888), height: 1),
                          ),
                          SizedBox(
                            width: kSize24,
                          ),
                          Image.asset(
                            "assets/images/hfq_32.png",
                            width: kSize48,
                            fit: BoxFit.contain,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: kSize32, bottom: kSize32),
                  height: kSize2,
                  color: Color(0xffCCCCCC).withOpacity(0.5),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/hfq_37.png",
                          width: kSize32,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          width: kSize24,
                        ),
                        Text(
                          "当前版本",
                          style: TextStyle(fontSize: kFontSize28, color: Color(0xff333333), height: 1),
                        )
                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Text(
                            "V${controller.state.version}",
                            style: TextStyle(fontSize: kFontSize24, color: Color(0xff888888), height: 1),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                controller.state.agreementList.isEmpty
                    ? SizedBox()
                    : Column(
                        children: List.generate(
                            controller.state.agreementList.length,
                            (index) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: kSize32, bottom: kSize32),
                                      height: kSize2,
                                      color: Color(0xffCCCCCC).withOpacity(0.5),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Map data = {
                                          "agreement": [
                                            {"label": controller.state.agreementList[index]['label'], "type": controller.state.agreementList[index]['type']}
                                          ]
                                        };
                                        Get.toNamed(RouteNames.htmlpage, arguments: {"data": data});
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              child: Text(
                                            controller.state.agreementList[index]['title'],
                                            style: TextStyle(fontSize: kFontSize28, color: Color(0xff333333), height: 1),
                                          )),
                                          Image.asset(
                                            "assets/images/hfq_32.png",
                                            width: kSize48,
                                            fit: BoxFit.contain,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                      ),
              ],
            ),
          ),
          SizedBox(
            height: kSize80,
          )
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactController>(
      builder: (_) {
        return Scaffold(
          appBar: appBar(
            title: "设置",
            onPressed: () {
              Get.back();
            },
          ),
          body: _buildView(),
        );
      },
    );
  }
}
