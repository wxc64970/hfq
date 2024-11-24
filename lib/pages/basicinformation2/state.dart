import 'package:city_pickers/city_pickers.dart';
import 'package:get/get.dart';

class Basicinformation2State {
  final _checkboxData = false.obs;
  set checkboxData(value) => this._checkboxData.value = value;
  get checkboxData => this._checkboxData.value;

  final _loanAmount = 0.obs;
  set loanAmount(value) => _loanAmount.value = value;
  get loanAmount => _loanAmount.value;

  final _loanPeriod = 0.obs;
  set loanPeriod(value) => _loanPeriod.value = value;
  get loanPeriod => _loanPeriod.value;

  final _monthlyInc = "".obs;
  set monthlyInc(value) => _monthlyInc.value = value;
  get monthlyInc => _monthlyInc.value;

  final _address = Result().obs;
  set address(value) => _address.value = value;
  get address => _address.value;

  final _accumulationFund = "".obs;
  set accumulationFund(value) => _accumulationFund.value = value;
  get accumulationFund => _accumulationFund.value;

  final _houseProperty = "".obs;
  set houseProperty(value) => _houseProperty.value = value;
  get houseProperty => _houseProperty.value;

  final _vehicle = "".obs;
  set vehicle(value) => _vehicle.value = value;
  get vehicle => _vehicle.value;

  final _ziMa = "".obs;
  set ziMa(value) => _ziMa.value = value;
  get ziMa => _ziMa.value;

  final _has = "".obs;
  set has(value) => _has.value = value;
  get has => _has.value;

  final _insurance = "".obs;
  set insurance(value) => _insurance.value = value;
  get insurance => _insurance.value;
}
