import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class RequestPermission {
  /// 申请定位权限
  /// 授予定位权限返回true， 否则返回false
  static Future<bool> requestLocationPermission() async {
    PermissionStatus status = await Permission.location.status;
    print(status.toString());
    if (status.isGranted) {
      print(1111);
      // 权限已授予，可以进行定位操作
      return true;
    } else if (status.isDenied) {
      print(2222);
      // 权限被拒绝，可以请求权限
      PermissionStatus newStatus = await Permission.location.request();
      if (newStatus.isGranted) {
        // 权限请求成功，可以进行定位操作
        print(3333);
        return true;
      } else {
        // 权限请求失败
        print(4444);
        SmartDialog.showToast("定位权限未开启,会影响后续使用，请前往开启");
        return false;
      }
    } else if (status.isPermanentlyDenied) {
      // 权限被永久拒绝，可以引导用户到设置中手动开启权限
      openAppSettings();
      print(55555);
      return false;
    } else {
      print(6666);
      return false;
    }
  }

  static Future<bool> requestPhotoPermission() async {
    PermissionStatus cameraStatus = await Permission.camera.request();
    PermissionStatus androidPhotosStatus = await Permission.storage.request();
    PermissionStatus iosPhotosStatus = await Permission.photos.request();
    print(iosPhotosStatus.isLimited);
    if (GetPlatform.isAndroid) {
      if (cameraStatus.isGranted && androidPhotosStatus.isGranted) {
        // 权限已授予，可以进行定位操作
        return true;
      } else {
        if (cameraStatus.isDenied) {
// 权限被拒绝，可以请求权限
          // PermissionStatus newStatus = await Permission.camera.request();
          SmartDialog.showToast("需要开启相机权限才可以使用");
        }
        if (androidPhotosStatus.isDenied) {
          SmartDialog.showToast("需要开启相册权限才可以使用");
        }
        if (cameraStatus.isPermanentlyDenied || androidPhotosStatus.isPermanentlyDenied) {
          openAppSettings();
        }
        return false;
      }
    } else if (GetPlatform.isIOS) {
      if (cameraStatus.isGranted && (iosPhotosStatus.isGranted || iosPhotosStatus.isLimited)) {
        // 权限已授予，可以进行定位操作
        return true;
      } else {
        if (cameraStatus.isDenied) {
// 权限被拒绝，可以请求权限
          // PermissionStatus newStatus = await Permission.camera.request();
          SmartDialog.showToast("需要开启相机权限才可以使用");
        }
        if (iosPhotosStatus.isDenied) {
          SmartDialog.showToast("需要开启相册权限才可以使用");
        }
        if (cameraStatus.isPermanentlyDenied || iosPhotosStatus.isPermanentlyDenied) {
          openAppSettings();
        }
        return false;
      }
    } else {
      SmartDialog.showToast("需要开启相机和相册权限才可以使用");
      return false;
    }

    // if (cameraStatus.isPermanentlyDenied || photosStatus.isPermanentlyDenied) {
    //   // 权限被永久拒绝，可以引导用户到设置中手动开启权限
    //   openAppSettings();
    //   return false;
    // } else {
    //   return false;
    // }
  }
}
