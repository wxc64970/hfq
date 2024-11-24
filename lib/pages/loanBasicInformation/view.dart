import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class LoanbasicinformationPage extends GetView<LoanbasicinformationController> {
  const LoanbasicinformationPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const BodyWidget();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoanbasicinformationController>(
      builder: (_) {
        return WillPopScope(
            onWillPop: () {
              controller.onWillPops();
              return Future.value(false);
            },
            child: GestureDetector(
              onTap: controller.handleUnfocus,
              child: Scaffold(
                appBar: appBar(
                  title: "基本信息",
                  onPressed: () {
                    controller.onWillPops();
                  },
                ),
                body: _buildView(),
              ),
            ));
      },
    );
  }
}
