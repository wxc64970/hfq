import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';
import 'package:youyi_wallet/pages/confirmationloan/monthlyRepaymentDue/monthlyRepaymentDueController.dart';
import 'package:youyi_wallet/pages/confirmationloan/state.dart';
import 'package:youyi_wallet/pages/repayment/view.dart';

class HFQMonethlyRepaymentDuePage
    extends GetView<Monthlyrepaymentduecontroller> {
  const HFQMonethlyRepaymentDuePage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoanTrialListModel? model = Get.arguments["model"];
    controller.usedInputModel(model: model);

    return Scaffold(
      appBar: appBar(
        title: "还款",
        onPressed: () {
          Get.back();
        },
      ),
      body: pagebg(
          child: Column(
        children: [
          HFQRepaymentOrderView(monthRepaymentController: controller),
          SizedBox(height: 32.w),
          Expanded(
              child: Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20.w)),
            child: Obx(() => ListView.builder(
                  cacheExtent: kSize130,
                  itemCount: controller.showList.length,
                  itemBuilder: (BuildContext context, int listIndex) {
                    return HFQRepaymentListChildView(
                      skipTap: () {},
                      model: controller.showList[listIndex],
                      onTap: () {
                        controller.changedItemStatus(index: listIndex);
                      },
                    );
                  },
                )),
          ))
        ],
      )),
    );
  }
}
