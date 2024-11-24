import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youyi_wallet/common/index.dart';

/// 输入框
Widget inputTextEdit({
  TextEditingController? controller,
  TextInputType keyboardType = TextInputType.text,
  String? hintText,
  bool isPassword = false,
  double marginTop = 15,
  bool autofocus = false,
}) {
  return Container(
    height: 104.h,
    margin: EdgeInsets.only(top: marginTop.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: Radii.k54pxRadius,
    ),
    child: TextField(
      autofocus: autofocus,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 10),
        border: InputBorder.none,
      ),
      style: TextStyle(
        color: AppColors.primaryText,
        fontFamily: "Avenir",
        fontWeight: FontWeight.w400,
        fontSize: kFontSize24,
      ),
      maxLines: 1,
      autocorrect: false, // 自动纠正
      obscureText: isPassword, // 隐藏输入内容, 密码框
    ),
  );
}

Widget inputIconPhoneEdit(
    {double height = 40,
    double borderRadius = 40,
    String icon = "",
    TextEditingController? controller,
    TextInputType keyboardType = TextInputType.text,
    FocusNode? focusNode,
    Function(String)? onChanged,
    InputDecoration? decoration,
    TextStyle? style,
    bool obscureText = false}) {
  return Container(
    height: height.w,
    padding: EdgeInsets.only(left: kSize32, right: kSize32),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(borderRadius.w), color: Colors.white),
    child: Row(
      children: [
        Image.asset(
          icon,
          width: kSize40,
          height: kSize40,
        ),
        SizedBox(
          width: kSize20,
        ),
        Expanded(
            child: TextField(
                keyboardType: keyboardType,
                focusNode: focusNode,
                obscureText: obscureText,
                controller: controller,
                decoration: decoration,
                onChanged: onChanged,
                style: style,
                cursorColor: AppColors.primaryElement,
                inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              LengthLimitingTextInputFormatter(11),
            ])),
      ],
    ),
  );
}

/// email 输入框
/// 背景白色，文字黑色，带阴影
Widget inputEmailEdit({
  TextEditingController? controller,
  TextInputType keyboardType = TextInputType.text,
  String? hintText,
  bool isPassword = false,
  double marginTop = 15,
  bool autofocus = false,
}) {
  return Container(
    height: 44.h,
    margin: EdgeInsets.only(top: marginTop.h),
    decoration: BoxDecoration(
      color: AppColors.primaryBackground,
      borderRadius: Radii.k6pxRadius,
      boxShadow: [
        BoxShadow(
          color: Color.fromARGB(41, 0, 0, 0),
          offset: Offset(0, 1),
          blurRadius: 0,
        ),
      ],
    ),
    child: TextField(
      autofocus: autofocus,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: AppColors.primaryText,
        ),
      ),
      style: TextStyle(
        color: AppColors.primaryText,
        fontFamily: "Avenir",
        fontWeight: FontWeight.w400,
        fontSize: 18.sp,
      ),
      maxLines: 1,
      autocorrect: false, // 自动纠正
      obscureText: isPassword, // 隐藏输入内容, 密码框
    ),
  );
}
