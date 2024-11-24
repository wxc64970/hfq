import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youyi_wallet/common/index.dart';

import 'index.dart';

class HtmlPage extends GetView<HtmlController> {
  // final String htmlData;
  // final String title;
  const HtmlPage({super.key});

  // 主视图
  Widget _buildView() {
    return controller.agreement.isEmpty
        ? Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryElement,
            ),
          )
        : SingleChildScrollView(
            child: Html(
              data: controller.agreement[0]['detail'],
              onLinkTap: (url, context, attributes, element) {
                launchUrl(Uri.parse(url!));
              },
              style: {
                "span": Style(
                    // padding: EdgeInsets.all(6),
                    color: Colors.black,
                    fontSize: FontSize(kFontSize26)),
              },
              // customRenders: {
              //   tagMatcher("flutter"): CustomRender.widget(
              //       widget: (context, buildChildren) => FlutterLogo(
              //             style: (context.tree.element!
              //                         .attributes['horizontal'] !=
              //                     null)
              //                 ? FlutterLogoStyle.horizontal
              //                 : FlutterLogoStyle.markOnly,
              //             textColor: context.style.color!,
              //             size: context.style.fontSize!.value * 5,
              //           )),
              // },
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HtmlController>(
      init: HtmlController(),
      id: "html",
      builder: (_) {
        return Scaffold(
          appBar: appBar(
              title: controller.agreement.isEmpty ? "" : controller.agreement[0]['title'],
              onPressed: () {
                Get.back();
              }),
          body: pagebg(child: _buildView()),
        );
      },
    );
  }
}
