import 'package:fl_amap/fl_amap.dart';
import 'package:get/get.dart';

import 'requestPermission.dart';

class GetLocation {
  // static final androidOption = AMapLocationOptionForAndroid(beiDouFirst: true, gpsFirst: true, onceLocationLatest: true, sensorEnable: true, locationMode: AMapLocationMode.heightAccuracy);
  static final androidOption = AMapLocationOptionForAndroid(locationMode: AMapLocationMode.heightAccuracy);

  static final iosOption = AMapLocationOptionForIOS(locationTimeout: 2, desiredAccuracy: CLLocationAccuracy.kCLLocationAccuracyBestForNavigation);
  static final location = FlAMapLocation();
  static initialize() async {
    final bool data = await location.initialize();
    if (data) {
      print("初始化成功");
    }
  }

  static getLocationData() async {
    bool permissions = await RequestPermission.requestLocationPermission();
    if (!permissions) {
      print("权限没通过");
      return null;
    }
    AMapLocation? locationData = await location.getLocation(optionForIOS: iosOption, optionForAndroid: androidOption);
    if (locationData != null) {
      if (GetPlatform.isAndroid) {
        AMapLocation is AMapLocationForAndroid;
        print(locationData.toMap());
      } else if (GetPlatform.isIOS) {
        AMapLocation is AMapLocationForIOS;
      }
      print(locationData.toMap());
      return locationData;
    } else {
      return null;
    }
  }
}
