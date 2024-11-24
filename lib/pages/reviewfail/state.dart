import 'package:get/get.dart';

class ReviewfailState {
  // title
  final _times = 5.obs;
  set times(value) => _times.value = value;
  get times => _times.value;

  final _title = "审核结果".obs;
  set title(value) => _title.value = value;
  get title => _title.value;

  final _content = "审核失败".obs;
  set content(value) => _content.value = value;
  get content => _content.value;
}
