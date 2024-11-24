import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';
import 'package:youyi_wallet/global.dart';

import 'index.dart';

class ApplicationController extends GetxController {
  ApplicationController();

  final state = ApplicationState();
  // tab 页标题
  late final List<String> tabTitles;

  // 页控制器
  late final PageController pageController;

  // 底部导航项目
  late final List<BottomNavigationBarItem> bottomTabs;

  /// 事件

  // tab栏动画
  void handleNavBarTap(int index) {
    // pageController.animateToPage(index, duration: const Duration(milliseconds: 200), curve: Curves.ease);
    pageController.jumpToPage(index);
  }

  // tab栏页码切换
  void handlePageChanged(int page) {
    state.page = page;
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    Global.setKey(); //初始化高的定位
    bottomTabs = UserStore.to.userStatus == 4
        ? <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/tabbar/home_s.png",
                width: kSize48,
                fit: BoxFit.contain,
              ),
              activeIcon: Image.asset(
                "assets/tabbar/home_d.png",
                width: kSize48,
                fit: BoxFit.contain,
              ),
              label: '首页',
              backgroundColor: AppColors.primaryBackground,
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/tabbar/fast_u.png",
                width: kSize48,
                fit: BoxFit.contain,
              ),
              activeIcon: Image.asset(
                "assets/tabbar/fast_s.png",
                width: kSize48,
                fit: BoxFit.contain,
              ),
              label: '极速贷',
              backgroundColor: AppColors.primaryBackground,
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/tabbar/large_u.png",
                width: kSize48,
                fit: BoxFit.contain,
              ),
              activeIcon: Image.asset(
                "assets/tabbar/large_s.png",
                width: kSize48,
                fit: BoxFit.contain,
              ),
              label: '借钱',
              backgroundColor: AppColors.primaryBackground,
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/tabbar/me_s.png",
                width: kSize48,
                fit: BoxFit.contain,
              ),
              activeIcon: Image.asset(
                "assets/tabbar/me_d.png",
                width: kSize48,
                fit: BoxFit.contain,
              ),
              label: '我的',
              backgroundColor: AppColors.primaryBackground,
            ),
          ]
        : <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/tabbar/home_s.png",
                width: kSize48,
                fit: BoxFit.contain,
              ),
              activeIcon: Image.asset(
                "assets/tabbar/home_d.png",
                width: kSize48,
                fit: BoxFit.contain,
              ),
              label: '首页',
              backgroundColor: AppColors.primaryBackground,
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/tabbar/me_s.png",
                width: kSize48,
                fit: BoxFit.contain,
              ),
              activeIcon: Image.asset(
                "assets/tabbar/me_d.png",
                width: kSize48,
                fit: BoxFit.contain,
              ),
              label: '我的',
              backgroundColor: AppColors.primaryBackground,
            ),
          ];
    pageController = PageController(initialPage: state.page);
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}
