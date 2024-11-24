import 'package:flutter/material.dart';
import 'package:youyi_wallet/common/index.dart';

PreferredSizeWidget? appBar({String title = "", Function()? onPressed}) {
  return AppBar(
    leading: IconButton(onPressed: onPressed, icon: Icon(Icons.arrow_back_ios)),
    centerTitle: true,
    backgroundColor: Color(0xffC5DEFF),
    title: Text(
      title,
      style: TextStyle(
          fontSize: kFontSize32,
          color: Color(0xff333333),
          fontWeight: FontWeight.w600,
          height: 1),
    ),
  );
}

PreferredSizeWidget? fastAppBar(
    {required Widget title, Function()? onPressed}) {
  return AppBar(
    // leading: IconButton(onPressed: onPressed, icon: const Icon(Icons.arrow_back_ios)),
    centerTitle: false,
    backgroundColor: const Color(0xffC5DEFF),
    title: title,
    titleSpacing: 0,
    leadingWidth: kSize70,
  );
}
