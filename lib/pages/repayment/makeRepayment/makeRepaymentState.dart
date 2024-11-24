import 'package:get/get.dart';

class HFQMakeRepaymentState {
  bool _isCountingDown = false;
  get isCountingDown => _isCountingDown;
  set isCountingDown(value) => _isCountingDown = value;

  RxInt _countDownTime = 60.obs;
  get countDownTime => _countDownTime.value;
  set countDownTime(value) => _countDownTime.value = value;
  String _authCode = "";
  get authCode => _authCode;
  set authCode(value) => _authCode = value;
  RxBool _isOnce = false.obs;
  get isOnce => _isOnce.value;
  set isOnce(value) => _isOnce.value = value;
}
