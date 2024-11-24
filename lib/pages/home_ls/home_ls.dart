import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youyi_wallet/common/index.dart';
import 'package:youyi_wallet/common/utils/network_image.dart';
import 'package:youyi_wallet/common/values/constants.dart';
import 'package:youyi_wallet/common/values/constantsSize.dart';
import 'package:youyi_wallet/common/widgets/button.dart';
import 'package:youyi_wallet/common/widgets/pagebg.dart';
import 'package:youyi_wallet/pages/home/widgets/hfqHomeBottom.dart';
import 'package:youyi_wallet/pages/home/widgets/loanSupermarket.dart';
import 'package:youyi_wallet/pages/home_ls/homeLSController.dart';

class HomeLSPage extends StatefulWidget {
  const HomeLSPage({super.key});

  @override
  State<HomeLSPage> createState() => _HomeLSPageState();
}

class _HomeLSPageState extends State<HomeLSPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _HomeLSBuild();
  }
}

class _HomeLSBuild extends GetView<HomeLSController> {
  const _HomeLSBuild({super.key});

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
                  TextSpan(
                      text: "惠分期",
                      style: TextStyle(
                          fontSize: kFontSize36,
                          color: const Color(0xff333333),
                          fontWeight: FontWeight.w600,
                          height: 1)),
                  TextSpan(
                    text: "丨",
                    style: TextStyle(
                        fontSize: kFontSize36,
                        color: const Color(0xff333333),
                        fontWeight: FontWeight.w600,
                        height: 1),
                  ),
                  TextSpan(
                    text: "让借钱更简单",
                    style: TextStyle(
                        fontSize: kFontSize28,
                        color: const Color(0xff333333),
                        height: 1),
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
          child: SizedBox(
              width: Get.width,
              height: Get.height,
              child: SmartRefresher(
                enablePullUp: false,
                controller: controller.refreshController,
                onRefresh: controller.onRefresh,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
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
                            // color: Colors.pink,
                            padding: EdgeInsets.symmetric(
                                vertical: kSize32, horizontal: kSize40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    ClipOval(
                                      child: Obx(() =>
                                          controller.productUrl.length == 0
                                              ? Image.asset(
                                                  width: kSize32,
                                                  height: kSize32,
                                                  'assets/images/hfq_49.png')
                                              : networkImage(
                                                  width: kSize32,
                                                  height: kSize32,
                                                  url: controller.productUrl)),
                                    ),
                                    SizedBox(
                                      width: kSize8,
                                    ),
                                    Obx(() => Text(
                                          controller.productName,
                                          style: TextStyle(
                                              fontSize: kFontSize28,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        )),
                                    SizedBox(
                                      width: kSize16,
                                    ),
                                    Text(
                                      "合规持牌机构丨仅需三步激活额度",
                                      style: TextStyle(
                                          fontSize: kFontSize24,
                                          color: const Color(0xffCCCCCC)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: kSize18,
                                ),
                                Container(
                                  width: Get.width,
                                  height: kSize2,
                                  color:
                                      const Color(0xffCCCCCC).withOpacity(0.5),
                                ),
                                SizedBox(
                                  height: kSize32,
                                ),
                                Obx(() => controller.number == -1
                                    ? SizedBox(
                                        height: kSize80,
                                      )
                                    : Center(
                                        child: Text(
                                          "预估可借额度 (元)",
                                          style: TextStyle(
                                              fontSize: kFontSize28,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )),
                                Obx(() => controller.number == -1
                                    ? Center(
                                        child: Text(
                                        "暂无可用额度",
                                        style: TextStyle(
                                          fontSize: kFontSize48,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey,
                                        ),
                                      ))
                                    : Center(
                                        child: AnimatedDigitWidget(
                                        value: controller.number,
                                        loop: true,
                                        textStyle: TextStyle(
                                          fontSize: kFontSize96,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                        enableSeparator: true,
                                        duration:
                                            const Duration(milliseconds: 800),
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
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xffFFA236),
                                            width: kSize1),
                                        borderRadius:
                                            BorderRadius.circular(kSize100)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Image.asset(
                                          "assets/images/hfq_11.png",
                                          width: kSize32,
                                          fit: BoxFit.contain,
                                        ),
                                        Text(
                                          "合规平台 借钱首选",
                                          style: TextStyle(
                                              fontSize: kFontSize24,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xffFFA236)),
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
                                    style: TextStyle(
                                        fontSize: kFontSize24,
                                        color: const Color(0xffCCCCCC)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                              bottom: kSize30,
                              left: kSize32,
                              child: Center(
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Obx(() => btnFlatButtonWidget(
                                        onPressed: controller.checkLoanInfo,
                                        gbColor: controller.number == -1
                                            ? Colors.grey
                                            : AppColors.primaryElement,
                                        width: Get.width - kSize126,
                                        height: 88,
                                        title: "查看额度",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: kFontSize32,
                                            height: 1),
                                        radius: 100)),
                                    Positioned(
                                        top: -kSize20,
                                        right: kSize32,
                                        child: Image.asset(
                                            "assets/images/hfq_13.png",
                                            width: kSize210,
                                            fit: BoxFit.contain))
                                  ],
                                ),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: kSize40,
                      ),
                      HFQLoanSupermarketView(controller: controller),
                      Obx(() => SizedBox(
                          height: (controller.largeList.length > 0 ||
                                  controller.fastList.length > 0)
                              ? kSize56
                              : 0)),
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
    return GetBuilder<HomeLSController>(
      init: HomeLSController(),
      id: "home_ls",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xffC5DEFF),
            toolbarHeight: 0,
          ),
          body: _buildView(),
        );
      },
    );
  }
}
