import 'package:flutter/material.dart';
import 'package:youyi_wallet/common/index.dart';
import 'package:youyi_wallet/pages/bindBank/bindinBanCarsSate.dart';

class HFQCanUseBankListView extends StatelessWidget {
  final List<BankList> listData;
  const HFQCanUseBankListView({super.key, required this.listData});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(kSize20),
              topRight: Radius.circular(kSize20)),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: kSize46),
          Text(
            "支持银行列表",
            style: TextStyle(
                fontSize: kSize32,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF333333)),
          ),
          SizedBox(height: kSize50),
          Expanded(
            child: ListView.builder(
              itemCount: listData.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.all(kSize16),
                  alignment: Alignment.center,
                  child: Text(
                    listData[index].bankName ?? "",
                    style: TextStyle(
                        fontSize: kSize28, color: const Color(0xFF333333)),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
