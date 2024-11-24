import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasicinformationState {
  final TextEditingController name1Controller = TextEditingController();
  final FocusNode name1FocusNode = FocusNode();
  final TextEditingController phone1Controller = TextEditingController();
  final FocusNode phone1FocusNode = FocusNode();

  final TextEditingController name2Controller = TextEditingController();
  final FocusNode name2FocusNode = FocusNode();
  final TextEditingController phone2Controller = TextEditingController();
  final FocusNode phone2FocusNode = FocusNode();

  final _checkboxData = false.obs;
  set checkboxData(value) => this._checkboxData.value = value;
  get checkboxData => this._checkboxData.value;

  final _education = "".obs;
  set education(value) => _education.value = value;
  get education => _education.value;

  final _maritalStatus = "".obs;
  set maritalStatus(value) => _maritalStatus.value = value;
  get maritalStatus => _maritalStatus.value;

  final _relation = "".obs;
  set relation(value) => _relation.value = value;
  get relation => _relation.value;

  final _professional = "".obs;
  set professional(value) => _professional.value = value;
  get professional => _professional.value;

  final emergencyContact1 = {}.obs;
  // set emergencyContact1(value) => _emergencyContact1.value = value;
  // get emergencyContact1 => _emergencyContact1.value;

  final emergencyContact2 = {}.obs;
}
