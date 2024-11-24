import 'package:get/get.dart';

class MineState {
  // title
  final _title = "".obs;
  set title(value) => _title.value = value;
  get title => _title.value;

  List myloanList = [
    {"title": "去还款", "icon": "assets/images/hfq_24.png"},
    {"title": "待完成", "icon": "assets/images/hfq_25.png"},
    {"title": "待提现", "icon": "assets/images/hfq_26.png"},
    {"title": "已放款", "icon": "assets/images/hfq_27.png"}
  ];
  List mymenuList = [
    // {"title": "个人资料", "subtitle": "一次填写，循环使用", "icon": "assets/images/hfq_28.png"},
    // {"title": "黑名单检测", "icon": "assets/images/hfq_29.png"},
    {"title": "专属客服", "icon": "assets/images/hfq_30.png"},
    // {"title": "投诉与建议", "icon": "assets/images/hfq_31.png"}
  ];
}
