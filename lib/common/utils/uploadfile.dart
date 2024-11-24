import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

class Uploadfile {
  static void show(handleGallery, handleCamera) {
    Get.bottomSheet(
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 202.w,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(kSize30)),
            child: Column(
              children: [
                InkWell(
                  onTap: handleGallery,
                  child: SizedBox(
                    height: kSize100,
                    child: Center(
                        child: Text(
                      "相册",
                      style: TextStyle(fontSize: kFontSize30, color: Color(0xff333333)),
                    )),
                  ),
                ),
                Divider(
                  height: kSize1,
                  color: Color(0xff363A5C).withOpacity(0.5),
                ),
                InkWell(
                  onTap: handleCamera,
                  child: SizedBox(
                    height: kSize100,
                    child: Center(
                        child: Text(
                      "相机",
                      style: TextStyle(fontSize: kFontSize30, color: Color(0xff333333)),
                    )),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: kSize10,
          ),
          Container(
            height: kSize100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kSize30),
              color: Colors.white,
            ),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Center(
                child: Text(
                  '取消',
                  style: TextStyle(
                    color: const Color(0xffFF3573),
                    fontSize: kFontSize30,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
