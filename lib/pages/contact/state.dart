import 'package:get/get.dart';

class ContactState {
  final _version = "1.0.1".obs;
  set version(value) => _version.value = value;
  get version => _version.value;

  final agreementList = [].obs;
}
