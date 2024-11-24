import 'package:get/get.dart';

class ReviewsuccessState {
  // title
  final _title = "".obs;
  set title(value) => _title.value = value;
  get title => _title.value;

  final _availableCredit = 10000.obs;
  set availableCredit(value) => _availableCredit.value = value;
  get availableCredit => _availableCredit.value;

  final _totalAmount = 10000.obs;
  set totalAmount(value) => _totalAmount.value = value;
  get totalAmount => _totalAmount.value;
}
