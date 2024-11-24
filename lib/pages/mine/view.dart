import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class MinePage extends StatefulWidget {
  final int type;
  const MinePage({Key? key, required this.type}) : super(key: key);

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _MineViewGetX(
      type: widget.type,
    );
  }
}

class _MineViewGetX extends GetView<MineController> {
  final int type;
  const _MineViewGetX({Key? key, required this.type}) : super(key: key);

  // 主视图
  Widget _buildView() {
    controller.type = type;
    return pagebg(
        child: SingleChildScrollView(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: kSize24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(RouteNames.setting);
                },
                child: Image.asset(
                  "assets/images/hfq_21.png",
                  width: kSize48,
                  fit: BoxFit.contain,
                ),
              )
            ],
          ),
          SizedBox(
            height: kSize40,
          ),
          Row(
            children: [
              ClipOval(
                child: Image.asset(
                  "assets/images/hfq_20.png",
                  width: kSize120,
                  height: kSize120,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: kSize24,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    UserStore.to.profile,
                    style: TextStyle(
                        fontSize: kFontSize36,
                        color: Color(0xff333333),
                        height: 1,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: kSize8,
                  ),
                  Text(
                    "为奋斗的你加油！",
                    style: TextStyle(
                        fontSize: kFontSize24,
                        color: AppColors.primaryElement,
                        height: 1),
                  )
                ],
              )
            ],
          ),
          // SizedBox(
          //   height: kSize40,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Container(
          //       width: kSize330,
          //       height: kSize220,
          //       clipBehavior: Clip.antiAlias,
          //       decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(kSize20)),
          //       child: Stack(
          //         children: [
          //           Positioned(
          //             right: 0,
          //             bottom: 0,
          //             child: Image.asset(
          //               "assets/images/hfq_22.png",
          //               width: kSize170,
          //               fit: BoxFit.contain,
          //             ),
          //           ),
          //           Container(
          //             padding: EdgeInsets.all(kSize24),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Text(
          //                   "我要还款",
          //                   style: TextStyle(fontSize: kFontSize28, color: Color(0xff333333), height: 1, fontWeight: FontWeight.w600),
          //                 ),
          //                 SizedBox(
          //                   height: kSize30,
          //                 ),
          //                 GestureDetector(
          //                   onTap: () {
          //                     print(RouteNames.repaymentMain);
          //                     Get.toNamed(RouteNames.repaymentMain);
          //                   },
          //                   child: Container(
          //                     padding: EdgeInsets.symmetric(vertical: kSize10, horizontal: kSize24),
          //                     decoration: BoxDecoration(color: Color(0xff2B66FF).withOpacity(0.1), borderRadius: BorderRadius.circular(kSize100)),
          //                     child: Text(
          //                       "去查看",
          //                       style: TextStyle(fontSize: kFontSize24, color: AppColors.primaryElement, fontWeight: FontWeight.w500, height: 1),
          //                     ),
          //                   ),
          //                 )
          //               ],
          //             ),
          //           )
          //         ],
          //       ),
          //     ),
          //     Container(
          //       width: kSize330,
          //       height: kSize220,
          //       clipBehavior: Clip.antiAlias,
          //       decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(kSize20)),
          //       child: Stack(
          //         children: [
          //           Positioned(
          //             right: 0,
          //             bottom: 0,
          //             child: Image.asset(
          //               "assets/images/hfq_23.png",
          //               width: kSize170,
          //               fit: BoxFit.contain,
          //             ),
          //           ),
          //           Container(
          //             padding: EdgeInsets.all(kSize24),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Text(
          //                   "查信用污点",
          //                   style: TextStyle(fontSize: kFontSize28, color: Color(0xff333333), height: 1, fontWeight: FontWeight.w600),
          //                 ),
          //                 SizedBox(
          //                   height: kSize30,
          //                 ),
          //                 GestureDetector(
          //                   onTap: () {
          //                     Get.dialog(HFQMineAlertView(), barrierDismissible: false);
          //                   },
          //                   child: Container(
          //                     padding: EdgeInsets.symmetric(vertical: kSize10, horizontal: kSize24),
          //                     decoration: BoxDecoration(color: Color(0xff2B66FF).withOpacity(0.1), borderRadius: BorderRadius.circular(kSize100)),
          //                     child: Text(
          //                       "去查看",
          //                       style: TextStyle(fontSize: kFontSize24, color: AppColors.primaryElement, fontWeight: FontWeight.w500, height: 1),
          //                     ),
          //                   ),
          //                 )
          //               ],
          //             ),
          //           )
          //         ],
          //       ),
          //     )
          //   ],
          // ),
          SizedBox(
            height: kSize32,
          ),
          MyLoanWidget(),
          SizedBox(
            height: kSize32,
          ),
          MymenuWidget()
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineController>(
      init: MineController(),
      id: "mine",
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
