import 'package:flutter/material.dart';
import 'package:youyi_wallet/common/index.dart';
import 'package:youyi_wallet/pages/repayment/repaymentMode.dart';

class HFQRepaymentInfoItemView extends StatelessWidget {
  final RepayPlanEntityList model;
  final String btnTitle;
  final Widget? rtWidget;
  final Function()? onTap;
  final Widget? productNameWiget;
  const HFQRepaymentInfoItemView(
      {super.key,
      required this.model,
      required this.btnTitle,
      this.onTap,
      this.rtWidget,
      this.productNameWiget});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, kSize24, 0, kSize18),
      child: Container(
        width: double.infinity,
        height: kSize300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kSize20), color: Colors.white),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: kSize108,
                  padding: EdgeInsets.fromLTRB(kSize32, 0, kSize32, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      productNameWiget ?? const SizedBox(),
                      SizedBox(
                        width: productNameWiget != null ? kSize16 : 0,
                      ),
                      Text("最近还款日:${model.lateRepayDate ?? ""}",
                          style: TextStyle(
                              fontSize: kFontSize24,
                              color: const Color(0xFF888888)))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(kSize32, 0, kSize32, 0),
                  color: const Color(0x80CCCCCC),
                  height: kSize2,
                ),
                SizedBox(
                  height: kSize32,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.fromLTRB(kSize32, 0, kSize32, 0),
                  child: Text(
                    "第${model.installCnt ?? "1"}期应还",
                    style: TextStyle(
                        fontSize: kFontSize28, color: const Color(0xFF888888)),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.fromLTRB(kSize32, 0, kSize32, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        model.totalAmount ?? "",
                        style: TextStyle(
                            fontSize: kFontSize64,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF333333)),
                      ),
                      InkWell(
                        onTap: onTap,
                        child: Container(
                          width: kSize200,
                          height: kSize80,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(kSize80 / 2),
                              color: const Color(0xFF2B66FF)),
                          child: Text(
                            btnTitle,
                            style: TextStyle(
                                color: Colors.white, fontSize: kFontSize28),
                          ),
                        ),
                      )
                    ],
                  ),
                ))
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              // child: Image.asset("/assets/images/repayment_new_bill_icon.png"),
              child: rtWidget,
            ),
          ],
        ),
      ),
    );
  }
}
