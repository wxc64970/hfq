import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RepaymentModel {
  String repaymentNum = "1234"; //还款金额
  String repaymentTime = "2023-08-30"; //还款日期
  int repaymentStatus = 0; //还款状态
  String interest = "xxxx"; //利息金额
  String principal = "xxxx"; //本金金额
  int id = 0;

  RepaymentModel({this.repaymentStatus = 0});

  RxBool showStatus = false.obs; //页面展示状态
  String get statusShowString {
    switch (repaymentStatus) {
      case 5:
        return "已还款";
      case 0:
        return "待还款";
      case 1:
        return "还款中";
      case 3: //隐藏
        return "";
      case 9: //待还款《未到时间不可还款》
        return "待还款";
    }
    return "待还款";
  }

  Color get statusShowTextColor {
    switch (repaymentStatus) {
      case 5:
        return const Color(0xFF00C427);
      case 0:
        return const Color(0xFFD84309);
      case 1:
        return const Color(0xFFCCCCCC);
      case 3: //隐藏
        return Colors.white;
      case 9: //待还款《未到时间不可还款》
        return const Color(0xFFCCCCCC);
    }
    return const Color(0xFF00C427);
  }

  Color get borderColor {
    switch (repaymentStatus) {
      case 5:
        return Colors.white;
      case 0:
        return const Color(0xFFD84309);
      case 1:
        return Colors.white;
      case 3: //隐藏
        return Colors.white;
      case 9: //待还款《未到时间不可还款》
        return const Color(0xFFCCCCCC);
    }
    return Colors.white;
  }
}
