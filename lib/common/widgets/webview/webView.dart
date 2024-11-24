import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youyi_wallet/common/index.dart';

class CusWevView extends GetView<CusWebViewController> {
  const CusWevView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.webViewController.loadRequest(Uri.parse(Get.arguments["url"]));

    return Scaffold(
      appBar: appBar(
        title: Get.arguments["title"] ?? "",
        onPressed: () {
          Get.back();
        },
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xffC5DEFF), Color(0xffF7F7F7), Color(0xffF7F7F7)],
        )),
        child: WebViewWidget(controller: controller.webViewController),
      ),
    );
  }
}

class CusWebViewController extends GetxController {
  CusWebViewController();

  WebViewController webViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted);
  @override
  void onInit() {
    super.onInit();
    webViewController.setNavigationDelegate(NavigationDelegate(
      onWebResourceError: (WebResourceError error) {
        // 在这里处理加载失败的情况
        print('加载失败：${error.errorCode} - ${error.description}');
      },
    ));
    // webViewController.setJavaScriptMode(JavaScriptMode.unrestricted);
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class CusWeBviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CusWebViewController());
  }
}
