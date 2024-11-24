import 'package:flutter/material.dart';
import 'package:youyi_wallet/common/values/constantsSize.dart';

class HFQHomeBottomView extends StatelessWidget {
  final List<dynamic> bottomData;
  const HFQHomeBottomView({super.key, required this.bottomData});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: bottomDataList(),
    );
  }

  List<Widget> bottomDataList() {
    return List.generate(
        bottomData.length,
        (index) => index % 2 != 0
            ? Container(
                width: kSize2,
                height: kSize160,
                color: const Color(0xffCCCCCC),
              )
            : SizedBox(
                width: kSize200,
                child: Column(
                  children: [
                    Image.asset(
                      bottomData[index]['icon'],
                      width: kSize64,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(
                      height: kSize16,
                    ),
                    Text(
                      bottomData[index]['title'],
                      style: TextStyle(
                          fontSize: kFontSize28,
                          color: const Color(0xff333333),
                          fontWeight: FontWeight.w500,
                          height: 1),
                    ),
                    SizedBox(
                      height: kSize8,
                    ),
                    Text(
                      bottomData[index]['subtitle'],
                      style: TextStyle(
                          fontSize: kFontSize22,
                          color: const Color(0xff888888),
                          height: 1),
                    ),
                  ],
                ),
              ));
  }
}
