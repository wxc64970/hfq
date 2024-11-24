import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:youyi_wallet/common/values/constantsSize.dart';

class HFQLoanSupermarketMenuView extends StatelessWidget {
  final List<dynamic> dataList;
  const HFQLoanSupermarketMenuView({super.key, required this.dataList});

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
                // controller.number += 9;
                SmartDialog.showToast("暂未开通，敬请期待", alignment: Alignment.center);
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
