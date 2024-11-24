import 'package:fl_amap/fl_amap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:umeng_common_sdk/umeng_common_sdk.dart';
import 'package:youyi_wallet/common/index.dart';
import 'package:youyi_wallet/common/utils/location.dart';

class Global {
  /// 初始化
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    setSystemUi();
    // setKey();
    // //友盟统计初始化
    // UmengCommonSdk.initCommon(Constants.androidAppkey, Constants.iosAppkey, 'Umeng');
    // // 自动采集页面信息
    // UmengCommonSdk.setPageCollectionModeAuto();
    // await Get.putAsync(() => ImagePreloaderService().preloadImages());
    await Get.putAsync<StorageService>(() => StorageService().init());

    // Get.put<ConfigStore>(ConfigStore());
    Get.put<UserStore>(UserStore());
    Get.put<ProfileStore>(ProfileStore());
  }

  static void setKey() async {
    await setAMapKey(
        iosKey: Constants.iosAMapKey,
        // iosKey: 'e0e98395277890e48caa0c4bed423ead',
        androidKey: Constants.androidAMapKey,
        isAgree: true,
        isContains: true,
        isShow: true);
    GetLocation.initialize();
  }

  static void setSystemUi() {
    if (GetPlatform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      );
      // SystemUiOverlayStyle systemUiOverlayStyle =
      //     SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarBrightness: Brightness.dark, statusBarIconBrightness: Brightness.dark, systemNavigationBarColor: Color(0xff2B66FF));
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }
}
