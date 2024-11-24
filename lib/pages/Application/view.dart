import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';
import 'package:youyi_wallet/pages/fast/index.dart';
import 'package:youyi_wallet/pages/home/index.dart';
import 'package:youyi_wallet/pages/home_ls/home_ls.dart';
import 'package:youyi_wallet/pages/large/view.dart';
import 'package:youyi_wallet/pages/mine/index.dart';

import 'index.dart';

class ApplicationPage extends GetView<ApplicationController> {
  const ApplicationPage({Key? key}) : super(key: key);

  Widget _buildBottomNavigationBar() {
    return Obx(() => BottomNavigationBar(
          items: controller.bottomTabs,
          currentIndex: controller.state.page,
          // fixedColor: AppColors.primaryElement,
          type: BottomNavigationBarType.fixed,
          onTap: controller.handleNavBarTap,
          unselectedLabelStyle:
              TextStyle(fontSize: kFontSize22, color: Color(0xffCCCCCC)),
          selectedLabelStyle:
              TextStyle(fontSize: kFontSize22, color: AppColors.primaryElement),
        ));
  }

  Widget _buildPageView() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: UserStore.to.userStatus == 4
          ? [
              HomeLSPage(),
              FastPage(),
              LargePage(),
              MinePage(
                type: 1,
              )
            ]
          : [
              HomePage(),
              MinePage(
                type: 0,
              )
            ],
      controller: controller.pageController,
      onPageChanged: controller.handlePageChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApplicationController>(
      builder: (_) {
        return Scaffold(
          body: _buildPageView(),
          bottomNavigationBar: _buildBottomNavigationBar(),
        );
      },
    );
  }
}
