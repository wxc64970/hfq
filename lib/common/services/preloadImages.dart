import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImagePreloaderService extends GetxService {
  Future<void> preloadImages() async {
    // 预加载多个本地图片资源
    await precacheImage(AssetImage('assets/images/startbg.png'), Get.context!);
    // 可以根据需要继续添加更多图片
  }
}
