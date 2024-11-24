import 'package:flutter/material.dart';
import 'package:youyi_wallet/common/index.dart';

class HFQRepaymentbanklistview extends StatelessWidget {
  final String bankName;
  const HFQRepaymentbanklistview({super.key, required this.bankName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kSize110,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kSize20), color: Colors.white),
      padding: EdgeInsets.fromLTRB(kSize32, 0, kSize32, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image.asset(
          //     width: kSize26,
          //     height: kSize26,
          //     'assets/images/hfq_repayment_bank_placeholder.png'),
          // SizedBox(width: kSize24),
          Expanded(
              child: Text(
            bankName,
            style: TextStyle(
                fontSize: kFontSize28,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF333333)),
          )),
          // SizedBox(
          //   child: Row(
          //     children: [
          //       Text(
          //         "换卡",
          //         style: TextStyle(
          //             fontSize: kFontSize28, color: const Color(0xFF888888)),
          //       ),
          //       SizedBox(width: kSize16),
          //       Image.asset(
          //           width: kSize48,
          //           height: kSize48,
          //           'assets/images/hfq_payment_arrow_right.png')
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
