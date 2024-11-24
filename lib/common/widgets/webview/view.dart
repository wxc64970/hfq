import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';
import 'package:url_launcher/url_launcher.dart';

import 'index.dart';

class WebviewPage extends GetView<WebviewController> {
  const WebviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WebviewController>(
      init: WebviewController(),
      id: "webview",
      builder: (_) {
        return PopScope(
          canPop: true,
          child: Scaffold(
            appBar: AppBar(
                // iconTheme: IconThemeData(color: Colors.white),
                // backgroundColor: AppColors.primaryElement,
                // title: const Text("data"),
                ),
            backgroundColor: Colors.white,
            body: OrientationBuilder(
              builder: ((context, orientation) {
                return Stack(
                  children: [
                    InAppWebView(
                      key: controller.webViewKey,
                      initialUrlRequest: URLRequest(
                        url: WebUri(controller.webUrl),
                      ),
                      shouldOverrideUrlLoading:
                          (controller, navigationAction) async {
                        var uri = navigationAction.request.url!;
                        if (![
                          "http",
                          "https",
                          "file",
                          "chrome",
                          "data",
                          "javascript",
                          "about"
                        ].contains(uri.scheme)) {
                          if (await canLaunchUrl(uri)) {
                            // Launch the App
                            await launchUrl(
                              uri,
                            );
                            // and cancel the request
                            return NavigationActionPolicy.CANCEL;
                          }
                        }

                        return NavigationActionPolicy.ALLOW;
                      },
                      contextMenu: controller.contextMenu,
                      pullToRefreshController:
                          controller.pullToRefreshController,
                      onWebViewCreated: controller.onWebViewCreated,
                      onReceivedError: controller.onReceivedError,
                      onProgressChanged: controller.onProgressChanged,
                      onLoadStop: controller.onLoadStop,
                      onConsoleMessage: (webviewcontroller, messages) {},
                    ),
                    controller.progress < 1.0
                        ? Column(
                            children: [
                              SizedBox(
                                height: 2,
                                child: LinearProgressIndicator(
                                  value: controller.progress,
                                  color: AppColors.primaryElement,
                                  backgroundColor: Colors.grey[200],
                                ),
                              ),
                              // Expanded(
                              //   child: Center(
                              //   child: CircularProgressIndicator(
                              //     valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(255, 77, 64, 1)),
                              //   ),
                              // )
                              // )
                            ],
                          )
                        : SizedBox(),
                  ],
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
