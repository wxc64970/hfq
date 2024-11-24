import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class Loading {
  static void show() {
    SmartDialog.showLoading(msg: "加载中...");
  }

  static void close() {
    SmartDialog.dismiss(status: SmartStatus.loading);
  }
}
