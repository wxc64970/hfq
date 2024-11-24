import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

import '../index.dart';

/// hello
class DialogWidget extends GetView<SettingController> {
  final String title;
  final String subtitle;
  final Function() onPressed;

  const DialogWidget(this.title, this.subtitle, this.onPressed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: kSize500,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(kSize20)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: kSize48,
            ),
            Text(
              title,
              style: TextStyle(fontSize: kFontSize32, color: Color(0xff333333), fontWeight: FontWeight.w500, height: 1),
            ),
            SizedBox(
              height: kSize16,
            ),
            SizedBox(
              width: kSize300,
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: kFontSize28, color: Color(0xff333333)),
              ),
            ),
            SizedBox(
              height: kSize28,
            ),
            Divider(
              height: kSize2,
              color: Color(0xffCCCCCC).withOpacity(0.5),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    SmartDialog.dismiss();
                  },
                  child: Container(
                    width: kSize250,
                    height: kSize100,
                    decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(
                      width: kSize2,
                      color: Color(0xffCCCCCC).withOpacity(0.5),
                    ))),
                    child: Center(
                      child: Text(
                        "取消",
                        style: TextStyle(color: AppColors.primaryElement, fontSize: kFontSize28, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: onPressed,
                  child: SizedBox(
                    width: 249.w,
                    height: kSize100,
                    child: Center(
                      child: Text(
                        "确定",
                        style: TextStyle(color: Color(0xffD84309), fontSize: kFontSize28, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
