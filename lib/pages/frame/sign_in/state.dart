import 'package:get/get.dart';

class SignInState {
  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;

  final _checkboxData = false.obs;
  set checkboxData(value) => this._checkboxData.value = value;
  get checkboxData => this._checkboxData.value;

  final _isOnce = false.obs;
  set isOnce(value) => this._isOnce.value = value;
  get isOnce => this._isOnce.value;

  final _times = 60.obs;
  set times(value) => this._times.value = value;
  get times => this._times.value;

  final _isCountingDown = false.obs;
  set isCountingDown(value) => this._isCountingDown.value = value;
  get isCountingDown => this._isCountingDown.value;

  final _authCode = "".obs;
  set authCode(value) => this._authCode.value = value;
  get authCode => this._authCode.value;

  final agreement = [].obs;
  // SignInState() {}
}
