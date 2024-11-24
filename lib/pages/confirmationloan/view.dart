import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';
import 'package:youyi_wallet/pages/confirmationloan/widgets/hfq_confiremationloanItem.dart';

import 'index.dart';

class ConfirmationloanPage extends GetView<ConfirmationloanController> {
  const ConfirmationloanPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: pagebg(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: kSize32),
                padding: EdgeInsets.symmetric(vertical: kSize16, horizontal: kSize8),
                decoration: BoxDecoration(color: Color(0xffD84309).withOpacity(0.1), borderRadius: BorderRadius.circular(kSize16)),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/hfq_46.png",
                      width: kSize40,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(
                      width: kSize16,
                    ),
                    Text(
                      "恭喜您！已为您匹配到低费率借款服务",
                      style: TextStyle(fontSize: kFontSize24, color: Color(0xffD84309), height: 1),
                    )
                  ],
                ),
              ),
              Container(
                width: Get.width,
                margin: EdgeInsets.only(bottom: kSize24),
                padding: EdgeInsets.all(kSize48),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(kSize20)),
                child: Column(
                  children: [
                    Text(
                      "我要借 (元)",
                      style: TextStyle(fontSize: kFontSize32, color: Color(0xff888888), height: 1),
                    ),
                    SizedBox(
                      height: kSize16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: controller.decrement,
                          child: Visibility(
                              visible: false,
                              child: Text(
                                "－",
                                style: TextStyle(fontSize: kFontSize48, fontWeight: FontWeight.bold, height: 1, color: controller.state.amount > 0 ? AppColors.primaryElement : Color(0xffCCCCCC)),
                              )),
                        ),
                        SizedBox(
                          width: kSize48,
                        ),
                        Container(
                          width: kSize210,
                          height: kSize90,
                          decoration: BoxDecoration(border: Border(bottom: BorderSide(width: kSize2, color: Color(0xffCCCCCC)))),
                          child: TextField(
                            controller: controller.numberController,
                            keyboardType: TextInputType.number, //设置键盘为数字
                            textAlign: TextAlign.center,
                            focusNode: controller.numberFocusNode,
                            maxLines: 1,
                            readOnly: true,
                            onChanged: controller.onChanged,
                            cursorColor: AppColors.primaryElement,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(bottom: 10),
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly, //设置只允许输入整数
                              CustomNumberInputFormatter(controller.state.maxAmount),
                            ],
                            style: TextStyle(fontSize: kFontSize64, fontWeight: FontWeight.w700, height: 1, color: Color(0xff333333)),
                          ),
                        ),
                        SizedBox(
                          width: kSize48,
                        ),
                        InkWell(
                          onTap: controller.increment,
                          child: Visibility(
                              visible: false,
                              child: Text(
                                "＋",
                                style: TextStyle(
                                    fontSize: kFontSize48,
                                    fontWeight: FontWeight.bold,
                                    height: 1,
                                    color: controller.state.amount < controller.state.maxAmount ? AppColors.primaryElement : Color(0xffCCCCCC)),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(kSize20), color: Colors.white),
                height: kSize200,
                child: Column(
                  children: [
                    Expanded(
                        child: HFQConfiremationLoanItemView(
                      title: "借多久",
                      titleStyle: TextStyle(fontSize: kFontSize28, color: const Color(0xFF333333), fontWeight: FontWeight.bold),
                      valueStyle: TextStyle(fontSize: kFontSize28, color: const Color(0xFF888888), fontWeight: FontWeight.w400),
                      controller: controller,
                      type: HFQConfiremationloanValueType.time,
                    )),
                    Container(
                      margin: EdgeInsets.fromLTRB(kSize32, 0, kSize32, 0),
                      height: kSize2,
                      color: const Color(0x80CCCCCC),
                    ),
                    Expanded(
                        child: HFQConfiremationLoanItemView(
                      title: "实际到账",
                      titleStyle: TextStyle(fontSize: kFontSize28, color: const Color(0xFF333333), fontWeight: FontWeight.bold),
                      valueStyle: TextStyle(fontSize: kFontSize28, color: const Color(0xFF888888), fontWeight: FontWeight.w400),
                      controller: controller,
                      type: HFQConfiremationloanValueType.amount,
                    ))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: kSize40),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(kSize20), color: Colors.white),
                height: kSize200,
                child: Column(
                  children: [
                    Expanded(
                        child: HFQConfiremationLoanItemView(
                      title: "费用节省(元)",
                      titleStyle: TextStyle(fontSize: kFontSize28, color: const Color(0xFF333333), fontWeight: FontWeight.bold),
                      valueStyle: TextStyle(fontSize: kFontSize28, color: const Color(0xFFD84309), fontWeight: FontWeight.w900),
                      controller: controller,
                      traingWidget: Image.asset(width: kSize32, height: kSize32, 'assets/images/hfq_payment_arrow_right.png'),
                      centerWidget: Image.asset(width: kSize156, height: kSize46, 'assets/images/hfq_47.png'),
                      type: HFQConfiremationloanValueType.scale,
                    )),
                    Container(
                      margin: EdgeInsets.fromLTRB(kSize32, 0, kSize32, 0),
                      height: kSize2,
                      color: const Color(0x80CCCCCC),
                    ),
                    Expanded(
                        child: InkWell(
                      onTap: controller.showMonthlyRepaymentDue,
                      child: HFQConfiremationLoanItemView(
                        title: "每月应还",
                        titleStyle: TextStyle(fontSize: kFontSize28, color: const Color(0xFF333333), fontWeight: FontWeight.bold),
                        valueStyle: TextStyle(fontSize: kFontSize28, color: const Color(0xFF888888), fontWeight: FontWeight.w400),
                        controller: controller,
                        traingWidget: Image.asset(width: kSize32, height: kSize32, 'assets/images/hfq_payment_arrow_right.png'),
                        type: HFQConfiremationloanValueType.mothRepaymentAmount,
                      ),
                    ))
                  ],
                ),
              ),
              InkWell(
                onTap: controller.settingBankCard,
                child: Obx(() => Container(
                    margin: EdgeInsets.only(top: kSize40),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(kSize20), color: Colors.white),
                    height: kSize100,
                    child: HFQConfiremationLoanItemView(
                      title: "到账卡",
                      titleStyle: TextStyle(fontSize: kFontSize28, color: const Color(0xFF333333), fontWeight: FontWeight.bold),
                      valueStyle: TextStyle(
                          fontSize: kFontSize28,
                          color: controller.state.hasBank.value ? const Color(0xFF888888) : const Color(0xFF2B66FF),
                          fontWeight: controller.state.hasBank.value ? FontWeight.w400 : FontWeight.bold),
                      controller: controller,
                      traingWidget: controller.state.hasBank.value
                          ? Image.asset(width: kSize32, height: kSize32, 'assets/images/hfq_payment_arrow_right.png')
                          : Text(
                              "＋",
                              style: TextStyle(fontSize: kFontSize48, fontWeight: FontWeight.bold, height: 1, color: const Color(0xFF2B66FF)),
                            ),
                      type: HFQConfiremationloanValueType.bank,
                    ))),
              ),
              SizedBox(height: kSize42),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() => InkWell(
                        onTap: () {
                          controller.argreenProtocolStatus.value = !controller.argreenProtocolStatus.value;
                        },
                        child: Icon(
                          controller.argreenProtocolStatus.value ? Icons.check_circle : Icons.circle_outlined,
                          size: kSize32,
                          color: const Color(0xFF00C427),
                        ),
                      )),
                  SizedBox(width: kSize16),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '已阅读同意',
                          style: TextStyle(color: const Color(0xFFCCCCCC), fontSize: kSize24),
                        ),
                        TextSpan(
                          text: '《非学生身份承诺函》',
                          recognizer: TapGestureRecognizer()..onTap = controller.noStudentProtocol,
                          style: TextStyle(color: const Color(0xFF888888), fontSize: kSize24, fontWeight: FontWeight.w800, decoration: TextDecoration.underline),
                        ),
                        TextSpan(
                          text: '和',
                          style: TextStyle(color: const Color(0xFFCCCCCC), fontSize: kSize24),
                        ),
                        TextSpan(
                          text: '《借款合同》',
                          recognizer: TapGestureRecognizer()..onTap = controller.loanProtocol,
                          style: TextStyle(color: const Color(0xFF888888), fontSize: kSize24, fontWeight: FontWeight.w800, decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          )),
        ),
        Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(kSize36, kSize42, kSize36, kSize80),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => Text(
                        "实际到账：${controller.state.amount}",
                        style: TextStyle(fontSize: kFontSize32, color: const Color(0xff333333), fontWeight: FontWeight.w500, height: 1),
                      )),
                  SizedBox(
                    height: kSize10,
                  ),
                  Text(
                    "合计节省${controller.state.scaleAmount}元",
                    style: TextStyle(fontSize: kFontSize24, color: const Color(0xffCCCCCC), fontWeight: FontWeight.w400, height: 1),
                  ),
                ],
              ),
              InkWell(
                onTap: controller.HandleLoan,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: kSize24, horizontal: kSize64),
                  decoration: BoxDecoration(color: AppColors.primaryElement, borderRadius: BorderRadius.circular(kSize100)),
                  child: Text(
                    "确认借款",
                    style: TextStyle(fontSize: kFontSize32, color: Colors.white, height: 1, fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConfirmationloanController>(
      builder: (_) {
        return GestureDetector(
          onTap: () {
            controller.numberFocusNode.unfocus();
          },
          child: Scaffold(
            appBar: appBar(
              title: "确认借款",
              onPressed: () {
                Get.back();
              },
            ),
            body: _buildView(),
          ),
        );
      },
    );
  }
}

class CustomNumberInputFormatter extends TextInputFormatter {
  final int maxNumber;

  CustomNumberInputFormatter(this.maxNumber);

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      int value = int.tryParse(newValue.text) ?? 0;
      if (value > maxNumber) {
        return oldValue;
      }
    }
    return newValue;
  }
}
