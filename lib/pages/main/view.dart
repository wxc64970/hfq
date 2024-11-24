import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return Image.asset(
      "assets/images/startbg.png",
      width: Get.width,
      height: Get.height,
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (_) {
        return Scaffold(
          body: _buildView(),
        );
      },
    );
  }
}
