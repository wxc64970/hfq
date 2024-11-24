import 'package:get/get.dart';

class ReviewloadingState {
  final _times = 5.obs;
  set times(value) => _times.value = value;
  get times => _times.value;
}
