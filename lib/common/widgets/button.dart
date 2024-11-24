import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youyi_wallet/common/index.dart';

/// 扁平圆角按钮
Widget btnFlatButtonWidget(
    {required VoidCallback onPressed,
    double width = 100,
    double height = 44,
    Color gbColor = AppColors.primaryElement,
    String title = "button",
    String fontName = "Montserrat",
    TextStyle? style,
    double radius = 50}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      width: width,
      height: height.w,
      decoration: BoxDecoration(color: gbColor, borderRadius: BorderRadius.circular(radius)),
      child: Center(
        child: Text(
          title,
          style: style,
        ),
      ),
    ),
  );
}

/// 第三方按钮
Widget btnFlatButtonBorderOnlyWidget({
  required VoidCallback onPressed,
  double width = 88,
  double height = 44,
  required String iconFileName,
}) {
  return Container(
    width: width.w,
    height: height.h,
    child: TextButton(
      style: ButtonStyle(
        // textStyle: MaterialStateProperty.all(TextStyle(
        //   fontSize: 16.sp,
        // )),
        // foregroundColor: MaterialStateProperty.resolveWith(
        //   (states) {
        //     if (states.contains(MaterialState.focused) &&
        //         !states.contains(MaterialState.pressed)) {
        //       return Colors.blue;
        //     } else if (states.contains(MaterialState.pressed)) {
        //       return Colors.deepPurple;
        //     }
        //     return AppColors.primaryElementText;
        //   },
        // ),
        // backgroundColor: MaterialStateProperty.resolveWith((states) {
        //   if (states.contains(MaterialState.pressed)) {
        //     return Colors.blue[200];
        //   }
        //   return AppColors.primaryElement;
        // }),
        shape: WidgetStateProperty.all(RoundedRectangleBorder(
          borderRadius: Radii.k6pxRadius,
        )),
      ),
      child: Image.asset(
        "assets/images/icons-$iconFileName.png",
      ),
      onPressed: onPressed,
    ),
  );
}
