import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:youyi_wallet/common/index.dart';
import 'package:youyi_wallet/pages/large/widgets/largeList.dart';

import 'index.dart';

class LargePage extends StatefulWidget {
  const LargePage({super.key});

  @override
  State<LargePage> createState() => _LargePageState();
}

class _LargePageState extends State<LargePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _LargeViewGetX();
    // return HFQLargepageLoadView();
    // return HFQLargepageNoDataView();
  }
}

class _LargeViewGetX extends GetView<LargeController> {
  const _LargeViewGetX({super.key});

  // 主视图
  Widget _buildView() {
    return pagebg(
        child: SmartRefresher(
      onRefresh: controller.onRefresh,
      controller: controller.reConroller,
      enablePullUp: false,
      child: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: kSize24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('大额贷',
                    style: TextStyle(
                      fontSize: kFontSize36,
                      color: const Color(0xff333333),
                      height: 1,
                      fontWeight: FontWeight.w600,
                    )),
                GestureDetector(
                  onTap: controller.getUserLocation,
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/hfq_local.png",
                        width: kSize32,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        width: kSize8,
                      ),
                      Obx(
                        () => Text(controller.location,
                            style: TextStyle(
                              fontSize: kFontSize28,
                              color: AppColors.primaryElement,
                              height: 1,
                            )),
                      )
                    ],
                  ),
                )
              ],
            ),
            // SizedBox(
            //   height: kSize40,
            // ),
            // InkWell(
            //   onTap: () {},
            //   child: Container(
            //     padding: EdgeInsets.symmetric(
            //         vertical: kSize28, horizontal: kSize24),
            //     decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(kSize20),
            //         boxShadow: [
            //           BoxShadow(
            //             color: Colors.grey.withOpacity(0.1),
            //             // spreadRadius: kSize6,
            //             blurRadius: kSize10,
            //             offset: Offset(0, kSize6),
            //           ),
            //         ]),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Row(
            //           children: [
            //             Text(
            //               '已成功申请机构：X家',
            //               style: TextStyle(
            //                   fontSize: kFontSize28,
            //                   color: const Color(0xff333333),
            //                   height: 1,
            //                   fontWeight: FontWeight.w600),
            //             )
            //           ],
            //         ),
            //         Row(
            //           children: [
            //             Text(
            //               '查看',
            //               style: TextStyle(
            //                   fontSize: kFontSize24,
            //                   color: const Color(0xff888888),
            //                   height: 1),
            //             ),
            //             SizedBox(
            //               width: kSize6,
            //             ),
            //             Image.asset(
            //               "assets/images/hfq_32.png",
            //               width: kSize32,
            //               fit: BoxFit.contain,
            //             )
            //           ],
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            SizedBox(
              height: kSize40,
            ),
            Obx(() => controller.largeList.length == 0
                ? Container()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Text("您的资料通过以下机构预审，请立即借款",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: kFontSize28,
                                  color: const Color(0xff888888),
                                  height: 1,
                                )),
                            SizedBox(
                              height: kSize24,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.primaryElement,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(kSize100),
                              ),
                              margin: const EdgeInsets.symmetric(),
                              padding: EdgeInsets.symmetric(
                                vertical: kSize8,
                                horizontal: kSize12,
                              ),
                              child: Text("申请多家机构，有助于提额和下款率",
                                  style: TextStyle(
                                    fontSize: kFontSize24,
                                    color: AppColors.primaryElement,
                                    height: 1,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: kSize40,
                      ),
                    ],
                  )),
            const LargeListWidget(),
            SizedBox(
              height: kSize24,
            ),
            // //以上贷款产品均为外部机构提供，请您在后续使用中独立做出 判断并承担相应风险，点击查看
            // Text.rich(
            //   textAlign: TextAlign.center,
            //   TextSpan(
            //     text: '以上贷款产品均为外部机构提供，请您在后续使用中独立做出 判断并承担相应风险，点击查看',
            //     children: const [
            //       TextSpan(
            //         text: '《风险告知书》',
            //         style: TextStyle(
            //           color: Color(0xff999999),
            //         ),
            //       ),
            //     ],
            //     style: TextStyle(
            //         fontSize: kFontSize24,
            //         color: const Color(0xffcccccc),
            //         height: 1.5),
            //   ),
            // ),
          ],
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LargeController>(
      init: LargeController(),
      id: "large",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xffC5DEFF),
            toolbarHeight: 0,
          ),
          body: _buildView(),
          // body: pagebg(child: HFQLargepageLoadView()),
          // body: pagebg(child: HFQLargepageNoDataView()),
        );
      },
    );
  }
}
