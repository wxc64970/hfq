import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebviewController extends GetxController {
  WebviewController();

  final GlobalKey webViewKey = GlobalKey();
  InAppWebViewController? webViewController;
  InAppWebViewSettings settings = InAppWebViewSettings(
      isInspectable: kDebugMode,
      mediaPlaybackRequiresUserGesture: false,
      allowsInlineMediaPlayback: true,
      iframeAllow: "camera; microphone",
      useShouldOverrideUrlLoading: true,
      disableHorizontalScroll: true,
      javaScriptCanOpenWindowsAutomatically: true,
      isFraudulentWebsiteWarningEnabled: false,
      sharedCookiesEnabled: true,
      allowUniversalAccessFromFileURLs: true);
  late ContextMenu contextMenu;
  double progress = 0;
  PullToRefreshController? pullToRefreshController;
  String webUrl = "";
  bool pageLoadFinished = false;

  _initData() {
    if (Get.arguments.isNotEmpty) {
      // 如果为空字符串，跳到公司官网
      print(Get.arguments['url']);
      print(1111111);
      webUrl = Get.arguments['url'];
      // webUrl += ("&statusbar_height=${ScreenConstants.STATUS_BAR_H}");
      // webUrl = webUrl.replaceAll('https://', 'http://');
    }
    contextMenu = ContextMenu(
        menuItems: [
          ContextMenuItem(
              id: 1,
              title: "Special",
              action: () async {
                print("Menu item Special clicked!");
                print(await webViewController?.getSelectedText());
                await webViewController?.clearFocus();
              })
        ],
        settings: ContextMenuSettings(hideDefaultSystemContextMenuItems: false),
        onCreateContextMenu: (hitTestResult) async {
          print("onCreateContextMenu");
          print(hitTestResult.extra);
          print(await webViewController?.getSelectedText());
        },
        onHideContextMenu: () {
          print("onHideContextMenu");
        },
        onContextMenuActionItemClicked: (contextMenuItemClicked) async {
          var id = contextMenuItemClicked.id;
          print("onContextMenuActionItemClicked: " + id.toString() + " " + contextMenuItemClicked.title);
        });
    pullToRefreshController = kIsWeb || ![TargetPlatform.iOS, TargetPlatform.android].contains(defaultTargetPlatform)
        ? null
        : PullToRefreshController(
            settings: PullToRefreshSettings(
              color: Colors.blue,
            ),
            onRefresh: () async {
              if (defaultTargetPlatform == TargetPlatform.android) {
                webViewController?.reload();
              } else if (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.macOS) {
                webViewController?.loadUrl(urlRequest: URLRequest(url: await webViewController?.getUrl()));
              }
            },
          );
    update(["webview"]);
  }

  onWebViewCreated(controller) {
    webViewController = controller;
    update(["webview"]);
  }

  onReceivedError(controller, request, error) {
    pullToRefreshController?.endRefreshing();
    update(["webview"]);
  }

  onProgressChanged(controller, progress) {
    if (progress == 100) {
      pullToRefreshController?.endRefreshing();
    }
    progress = progress / 100;
    update(["webview"]);
  }

  onLoadStop(controller, url) {
    pageLoadFinished = true;
    pullToRefreshController?.endRefreshing();
    print(8888888);
    controller.addJavaScriptHandler(
        handlerName: "set_device_orientation",
        callback: (args) async {
          if (args[0]["data"] != null) {
            int allowLandscape = args[0]["data"];
            // print(123123);
            // print(allowLandscape);
            if (allowLandscape == 0) {
              makeAppInPortraitMode();
            } else {
              makeAppInCommonMode();
            }
          }
        });
    controller.addJavaScriptHandler(
        handlerName: "close",
        callback: (args) async {
          // quitPage(context);
        });
  }

  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void makeAppInPortraitMode() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  void makeAppInCommonMode() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
