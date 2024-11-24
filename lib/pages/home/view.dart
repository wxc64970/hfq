import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youyi_wallet/common/index.dart';
import 'package:youyi_wallet/pages/home/widgets/hfqHomeBottom.dart';
import 'package:youyi_wallet/pages/home/widgets/scrollerlabel.dart';

import 'index.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _HomeViewGetX();
  }
}

class _HomeViewGetX extends GetView<HomeController> {
  const _HomeViewGetX({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return pagebg(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: kSize20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: "惠分期", style: TextStyle(fontSize: kFontSize36, color: Color(0xff333333), fontWeight: FontWeight.w600, height: 1)),
                  TextSpan(
                    text: "丨",
                    style: TextStyle(fontSize: kFontSize36, color: Color(0xff333333), fontWeight: FontWeight.w600, height: 1),
                  ),
                  TextSpan(
                    text: "让借钱更简单",
                    style: TextStyle(fontSize: kFontSize28, color: Color(0xff333333), height: 1),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () async {
                // Get.toNamed(RouteNames.confirmationloan);
                final Uri url = Uri.parse('tel:${Constants.serviceTel}');
                await launchUrl(url);
              },
              child: Image.asset(
                "assets/images/hfq_02.png",
                width: kSize48,
                fit: BoxFit.contain,
              ),
            )
          ],
        ),
        SizedBox(
          height: kSize20,
        ),
        Expanded(
          child: Container(
              width: Get.width,
              height: Get.height,
              child: SmartRefresher(
                enablePullUp: true,
                controller: controller.refreshController,
                onRefresh: controller.onRefresh,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Stack(
                        children: [
                          Image.asset(
                            "assets/images/hfq_03.png",
                            width: Get.width,
                            fit: BoxFit.contain,
                          ),
                          Container(
                            width: Get.width,
                            // height: kSize772,
                            padding: EdgeInsets.symmetric(vertical: kSize32, horizontal: kSize40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    // Container(
                                    //   width: kSize32,
                                    //   height: kSize32,
                                    //   decoration: BoxDecoration(color: Color(0xffD8D8D8), borderRadius: BorderRadius.circular(kSize100)),
                                    // ),
                                    Image.asset(
                                      "assets/images/hfq_49.png",
                                      width: kSize40,
                                      fit: BoxFit.contain,
                                    ),
                                    SizedBox(
                                      width: kSize8,
                                    ),
                                    Text(
                                      "优享贷",
                                      style: TextStyle(fontSize: kFontSize28, color: Colors.white, fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      width: kSize16,
                                    ),
                                    Text(
                                      "合规持牌机构丨仅需三步激活额度",
                                      style: TextStyle(fontSize: kFontSize24, color: Color(0xffCCCCCC)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: kSize18,
                                ),
                                Container(
                                  width: Get.width,
                                  height: kSize2,
                                  color: Color(0xffCCCCCC).withOpacity(0.5),
                                ),
                                SizedBox(
                                  height: kSize32,
                                ),
                                Center(
                                  child: SizedBox(
                                    height: kSize50,
                                    child: Obx(() => Text(
                                          UserStore.to.userStatus == 5
                                              ? "恭喜您通过审批额度(元)"
                                              : UserStore.to.userStatus == 3 || UserStore.to.userStatus == 7 || UserStore.to.userStatus == 8 || UserStore.to.userStatus == 6
                                                  ? ""
                                                  : "预估可借额度 (元)",
                                          style: TextStyle(fontSize: kFontSize28, color: Colors.white, fontWeight: FontWeight.w500),
                                        )),
                                  ),
                                ),
                                Center(
                                    child: Obx(() => UserStore.to.userStatus == 3 || UserStore.to.userStatus == 7 || UserStore.to.userStatus == 8
                                        ? SizedBox(
                                            height: kSize130,
                                            child: Center(
                                              child: Text(
                                                "暂无可用额度",
                                                style: TextStyle(fontSize: kFontSize48, color: Colors.white.withOpacity(0.5), height: 1, fontWeight: FontWeight.w500),
                                              ),
                                            ),
                                          )
                                        : UserStore.to.userStatus == 6
                                            ? SizedBox(
                                                height: kSize130,
                                                child: Center(
                                                  child: Text(
                                                    "借款正在申请中",
                                                    style: TextStyle(fontSize: kFontSize48, color: Colors.white.withOpacity(0.5), height: 1, fontWeight: FontWeight.w500),
                                                  ),
                                                ),
                                              )
                                            : AnimatedDigitWidget(
                                                value: controller.number,
                                                // controller: _controller,
                                                loop: true,
                                                textStyle: TextStyle(
                                                  fontSize: kFontSize96,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ),
                                                enableSeparator: true,
                                                duration: Duration(milliseconds: 800),
                                                curve: Curves.easeInOut,
                                                autoSize: true,
                                                animateAutoSize: true,
                                              ))),
                                SizedBox(
                                  height: kSize16,
                                ),
                                Center(
                                  child: Container(
                                    width: kSize284,
                                    height: kSize48,
                                    decoration: BoxDecoration(border: Border.all(color: Color(0xffFFA236), width: kSize1), borderRadius: BorderRadius.circular(kSize100)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Image.asset(
                                          "assets/images/hfq_11.png",
                                          width: kSize32,
                                          fit: BoxFit.contain,
                                        ),
                                        Text(
                                          "合规平台 借钱首选",
                                          style: TextStyle(fontSize: kFontSize24, fontWeight: FontWeight.w500, color: Color(0xffFFA236)),
                                        ),
                                        Image.asset(
                                          "assets/images/hfq_12.png",
                                          width: kSize32,
                                          fit: BoxFit.contain,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: kSize16,
                                ),
                                Center(
                                  child: Text(
                                    "日息最低0.02%-最快3分钟放款-高通过率",
                                    style: TextStyle(fontSize: kFontSize24, color: Color(0xffCCCCCC)),
                                  ),
                                ),
                                SizedBox(
                                  height: kSize70,
                                ),
                                Stack(
                                  children: [
                                    Obx(() => btnFlatButtonWidget(
                                        onPressed: controller.handleSeeCredit,
                                        gbColor: UserStore.to.userStatus == 3 || UserStore.to.userStatus == 8 ? Colors.grey : AppColors.primaryElement,
                                        width: Get.width,
                                        height: 88,
                                        title: UserStore.to.userStatus == 5
                                            ? "去提现"
                                            : UserStore.to.userStatus == 7
                                                ? "去还款"
                                                : UserStore.to.userStatus == 2
                                                    ? "查看审核进度"
                                                    : UserStore.to.userStatus == 6
                                                        ? "查看提现进度"
                                                        : UserStore.to.userStatus == 3
                                                            ? "预审未通过"
                                                            : UserStore.to.userStatus == 8
                                                                ? "借款失败"
                                                                : "查看额度",
                                        style: TextStyle(color: Colors.white, fontSize: kFontSize32, height: 1),
                                        radius: 100)),
                                  ],
                                ),
                                Transform.translate(
                                  offset: Offset(kSize380, -kSize110),
                                  child: Image.asset("assets/images/hfq_13.png", width: kSize210, fit: BoxFit.contain),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      // SizedBox(
                      //   height: kSize40,
                      // ),
                      // HFQHomeMenuView(
                      //   dataList: controller.dataList,
                      //   ontap: (num) {
                      //     controller.number += num;
                      //     controller.refreshController.refreshFailed();
                      //   },
                      // ),
                      SizedBox(
                        height: kSize40,
                      ),
                      ScrollerLabelView(scrollText: controller.scrollText),
                      SizedBox(
                        height: kSize56,
                      ),
                      HFQHomeBottomView(bottomData: controller.bottomData),
                    ],
                  ),
                ),
              )),
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      id: "home",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xffC5DEFF),
            toolbarHeight: 0,
          ),
          body: _buildView(),
        );
      },
    );
  }
}
