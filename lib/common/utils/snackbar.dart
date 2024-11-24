import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

class Snackbar {
  static void show(title, message) {
    Get.snackbar(
      title,
      message,
      messageText: Text(
        message,
        style: TextStyle(color: Color(0xff333333)),
      ),
      colorText: AppColors.primaryElement,
      duration: Duration(seconds: 2),
      backgroundColor: Colors.white38,
      icon: Row(
        children: [
          SizedBox(
            width: kSize24,
          ),
          Image.asset(
            "assets/images/hfq_35.png",
            width: kSize80,
            fit: BoxFit.contain,
          )
        ],
      ),
      padding: EdgeInsets.all(kSize32),
    );
  }
}

class Toast {
  static void show(BuildContext context, String message) {
    final overlayState = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height / 2 - 50,
        left: MediaQuery.of(context).size.width / 2 - 100,
        child: Material(
          color: Colors.black54.withOpacity(0.8),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
    overlayState.insert(overlayEntry);
    Future.delayed(const Duration(seconds: 3)).then((_) {
      overlayEntry.remove();
    });
  }
}
