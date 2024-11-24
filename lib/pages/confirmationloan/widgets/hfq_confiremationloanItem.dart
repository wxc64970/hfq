import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';
import 'package:youyi_wallet/pages/confirmationloan/index.dart';

enum HFQConfiremationloanValueType {
  time,
  amount,
  scale,
  mothRepaymentAmount,
  bank,
}

class HFQConfiremationLoanItemView extends StatelessWidget {
  final TextStyle titleStyle;
  final TextStyle valueStyle;
  final Widget? traingWidget;
  final Widget? centerWidget;
  final ConfirmationloanController controller;
  final String title;
  final HFQConfiremationloanValueType type;

  const HFQConfiremationLoanItemView(
      {super.key,
      required this.title,
      required this.titleStyle,
      required this.valueStyle,
      this.traingWidget,
      this.centerWidget,
      required this.controller,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(kSize32, 0, kSize32, 0),
      height: 100,
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: titleStyle,
                ),
                centerWidget ?? const SizedBox(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _valueText(),
                SizedBox(width: kSize10),
                traingWidget ?? const SizedBox()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _valueText() {
    var view;
    switch (type) {
      case HFQConfiremationloanValueType.time:
        view = Obx(() => Text(
              "${controller.state.timeLength}个月",
              style: valueStyle,
            ));
        break;
      case HFQConfiremationloanValueType.amount:
        view = Obx(() => Text(
              "${controller.state.amount}",
              style: valueStyle,
            ));
        break;
      case HFQConfiremationloanValueType.scale:
        view = Text(
          "省${controller.state.scaleAmount}元",
          style: valueStyle,
        );
        break;
      case HFQConfiremationloanValueType.mothRepaymentAmount:
        view = Obx(() => Text(
              controller.state.monthRepaymentAmount.toStringAsFixed(2),
              style: valueStyle,
            ));
        break;
      case HFQConfiremationloanValueType.bank:
        view = Obx(() => Text(
              controller.state.hasBank.value
                  ? "${controller.state.bankName}(${controller.state.bankNum})"
                  : "添加银行卡",
              style: valueStyle,
            ));
        break;
    }
    return view;
  }
}
