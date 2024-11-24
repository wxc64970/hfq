import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:youyi_wallet/common/index.dart';
import 'package:youyi_wallet/pages/fast/widgets/fastList.dart';
import 'package:youyi_wallet/pages/fast/widgets/rankingList.dart';

import 'index.dart';

class FastPage extends StatefulWidget {
  const FastPage({super.key});

  @override
  State<FastPage> createState() => _FastPageState();
}

class _FastPageState extends State<FastPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _FastViewGetX();
  }
}

class _FastViewGetX extends GetView<FastController> {
  const _FastViewGetX({super.key});

  // 主视图
  Widget _buildView() {
    return pagebg(
        child: SmartRefresher(
      controller: controller.refreshController,
      onRefresh: controller.refreshData,
      enablePullUp: false,
      child: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: kSize24,
            ),
            Obx(() => controller.fastList.length >= 3
                ? const FastRankListWidget()
                : Container()),
            SizedBox(
              height: kSize40,
            ),
            const FastListWidget(),
            SizedBox(
              height: kSize24,
            ),
            //以上贷款产品均为外部机构提供，请您在后续使用中独立做出 判断并承担相应风险，点击查看
            Obx(() => controller.fastList.length == 0
                ? Container()
                : Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      text: '以上贷款产品均为外部机构提供，请您在后续使用中独立做出 判断并承担相应风险，点击查看',
                      children: [
                        TextSpan(
                          text: '《第三方产品风险知情书及免责声明》',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Map data = {
                                "agreement": [
                                  {"label": "hfq_dsfcp", "type": "1"}
                                ]
                              };
                              Get.toNamed(RouteNames.htmlpage,
                                  arguments: {"data": data});
                            },
                          style: const TextStyle(
                            color: Color(0xff999999),
                          ),
                        ),
                      ],
                      style: TextStyle(
                          fontSize: kFontSize24,
                          color: const Color(0xffcccccc),
                          height: 1.5),
                    ),
                  )),
            SizedBox(height: kSize20)
          ],
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FastController>(
      init: FastController(),
      id: "fast",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xffC5DEFF),
            toolbarHeight: 0,
          ),
          body: _buildView(),
        );
      },
    );
  }
}
