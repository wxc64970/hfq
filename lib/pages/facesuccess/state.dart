import 'package:get/get.dart';

class FacesuccessState {
  // title
  final _title = "".obs;
  set title(value) => _title.value = value;
  get title => _title.value;

  final _checkboxData = false.obs;
  set checkboxData(value) => this._checkboxData.value = value;
  get checkboxData => this._checkboxData.value;
}
