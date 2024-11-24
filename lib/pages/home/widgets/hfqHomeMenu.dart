import 'package:flutter/material.dart';
import 'package:youyi_wallet/common/values/constantsSize.dart';

class HFQHomeMenuView extends StatelessWidget {
  final List<dynamic> dataList;
  final Function(int num)? ontap;
  const HFQHomeMenuView({super.key, required this.dataList, this.ontap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: listDataWidget(),
    );
  }

  List<Widget> listDataWidget() {
    return List.generate(
        dataList.length,
        (index) => InkWell(
              onTap: () {
                if (ontap != null) {
                  ontap!(9);
                }
                // controller.number += 9;
              },
              child: Column(
                children: [
                  Image.asset(
                    dataList[index]['icon'],
                    width: kSize64,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    height: kSize20,
                  ),
                  Text(
                    dataList[index]['title'],
                    style: TextStyle(
                        fontSize: kFontSize22,
                        color: const Color(0xff333333),
                        height: 1),
                  )
                ],
              ),
            ));
  }
}
