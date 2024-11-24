import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';
import 'package:youyi_wallet/pages/confirmationloan/monthlyRepaymentDue/monthlyRepaymentDueController.dart';
import 'package:youyi_wallet/pages/repayment/childView/hfq_repaymentItem.dart';
import 'package:youyi_wallet/pages/repayment/controller.dart';
import 'package:youyi_wallet/pages/repayment/state.dart';

class RepaymentPage extends StatefulWidget {
  const RepaymentPage({super.key});

  @override
  State<RepaymentPage> createState() => _RepaymentPageState();
}

class _RepaymentPageState extends State<RepaymentPage>
    with SingleTickerProviderStateMixin {
  RepaymentController controller = Get.find<RepaymentController>();
  late TabController _tabController;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: controller.tabbarTitle.length, vsync: this, initialIndex: 0);
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: "还款", onPressed: () => Get.back()),
      body: pagebg(
          child: Column(
        children: [
          HFQRepaymentOrderView(
            monthRepaymentController: Monthlyrepaymentduecontroller(),
            repaymentController: controller,
          ),
          _tabbarView(),
          Expanded(
              child: PageView.builder(
                  controller: _pageController,
                  itemCount: controller.tabbarTitle.length,
                  onPageChanged: (value) {
                    controller.currentIndex = value;
                    _tabController.animateTo(value);
                  },
                  itemBuilder: (_, pageIndex) {
                    return Obx(() => ListView.builder(
                          // cacheExtent: kSize130,
                          itemCount: controller.pageCount(pageIndex),
                          itemBuilder: (BuildContext context, int listIndex) {
                            return HFQRepaymentListChildView(
                              skipTap: () {
                                controller.userPressedList(
                                    pageIndex: pageIndex, index: listIndex);
                              },
                              model: controller.listViewModel(
                                  pageIndex, listIndex),
                              onTap: () {
                                controller.changedItemOpenStatus(
                                    pageIndex: pageIndex, index: listIndex);
                              },
                            );
                          },
                        ));
                  })),
        ],
      )),
    );
  }

  Widget _tabbarView() {
    return Container(
      margin: EdgeInsets.only(top: kSize32),
      width: double.infinity,
      height: kSize88,
      color: const Color(0xFFFFFFFF),
      child: TabBar(
        tabs: controller.tabbarTitle.map((title) => Text(title)).toList(),
        indicatorColor: const Color(0xFF2B66FF), // 选项卡指示器颜色
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: kSize8,
        labelColor: const Color(0xFF333333), // 选中的选项卡标签颜色
        unselectedLabelColor: const Color(0xFFCCCCCC),
        controller: _tabController, // 未选中的选项卡标签颜色
        labelStyle: TextStyle(fontSize: kFontSize28),
        unselectedLabelStyle: TextStyle(fontSize: kFontSize28),
        onTap: (index) {
          controller.currentIndex = index;
          _pageController.animateToPage(index,
              duration: const Duration(microseconds: 300),
              curve: Curves.linear);
        },
      ),
    );
  }
}

class HFQRepaymentOrderView extends StatelessWidget {
  final Monthlyrepaymentduecontroller monthRepaymentController;
  final RepaymentController? repaymentController;
  const HFQRepaymentOrderView(
      {super.key,
      required this.monthRepaymentController,
      this.repaymentController});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: kSize278,
      padding: EdgeInsets.fromLTRB(kSize32, kSize16, kSize32, kSize16),
      // color: Colors.red,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/hfq_repayment_order_bg.png"))),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(kSize32, kSize40, kSize32, 0),
            child: Text(
              "我的订单",
              style: TextStyle(
                  fontSize: kFontSize28,
                  color: Colors.white,
                  fontWeight: FontWeight.w800),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(kSize32, kSize32, kSize32, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => HFQRepaymentItem(
                    value: repaymentController != null
                        ? "${repaymentController!.orderTotalAmount}"
                        : "${monthRepaymentController.orderTotalAmount}",
                    subTitle: "借款金额(元)")),
                Container(
                  alignment: Alignment.center,
                  width: kSize2,
                  height: kSize92,
                  color: const Color(0x33FFFFFF),
                ),
                SizedBox(
                  width: kSize150,
                  child: Obx(() => HFQRepaymentItem(
                        value: repaymentController != null
                            ? "${repaymentController!.orderPlanCount}"
                            : "${monthRepaymentController.orderPlanCount}",
                        subTitle: "期数",
                        alignment: CrossAxisAlignment.center,
                      )),
                ),
                Container(
                  alignment: Alignment.center,
                  width: kSize2,
                  height: kSize92,
                  color: const Color(0x33FFFFFF),
                ),
                Obx(() => HFQRepaymentItem(
                    value: repaymentController != null
                        ? "${repaymentController!.orderLoseLan}"
                        : "${monthRepaymentController.orderLoseLan}",
                    subTitle: "剩余应还(元)"))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HFQRepaymentListChildView extends StatelessWidget {
  final RepaymentModel model;
  final Function() onTap;
  final Function() skipTap;
  const HFQRepaymentListChildView(
      {super.key,
      required this.model,
      required this.onTap,
      required this.skipTap});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        children: [
          InkWell(
            onTap: skipTap,
            child: Container(
              padding: EdgeInsets.fromLTRB(kSize32, kSize24, kSize32, kSize24),
              // height: kSize130,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "¥${model.repaymentNum}",
                        style: TextStyle(
                            fontSize: kFontSize32,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF333333)),
                      ),
                      Text(
                        "还款日期: ${model.repaymentTime}",
                        style: TextStyle(
                            fontSize: kFontSize24,
                            color: const Color(0xFF888888)),
                      )
                    ],
                  )),
                  Container(
                    padding: EdgeInsets.all(kSize10),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: model.borderColor, width: kSize2),
                        borderRadius: BorderRadius.circular(kSize10)),
                    child: Text(
                      model.statusShowString,
                      style: TextStyle(
                          fontSize: kSize24, color: model.statusShowTextColor),
                    ),
                  ),
                  // SizedBox(width: kSize22),
                  // Obx(() => GestureDetector(
                  //       // onTap: onTap,
                  //       child: Container(
                  //         transform: Matrix4.rotationX(
                  //             model.showStatus.value ? 0.5 : 0.0),
                  //         child: Image.asset(
                  //             width: kSize32,
                  //             height: kSize32,
                  //             "assets/images/hfq_repayment_arrow_down.png"),
                  //       ),
                  //     ))
                ],
              ),
            ),
          ),
          // const Divider(),
          Container(
            margin: EdgeInsets.fromLTRB(kSize32, 0, kSize32, 0),
            height: kSize2,
            color: const Color(0x80CCCCCC),
          ),
          DefaultTextStyle(
              style:
                  TextStyle(fontSize: kSize24, color: const Color(0xFF888888)),
              child: Obx(() => Container(
                    padding: EdgeInsets.fromLTRB(kSize32, 0, kSize32, 0),
                    height: model.showStatus.value ? kSize60 : 0.0,
                    // height: kSize66,
                    color: const Color(0xFFF7F7F7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("利息:${model.interest}"),
                        Text("本金:${model.principal}")
                      ],
                    ),
                  )))
        ],
      ),
    );
  }
}
