// ignore_for_file: invalid_use_of_protected_member

import 'package:city_pickers/city_pickers.dart';
import 'package:get/get.dart';

class LoanbasicinformationState {
  //居住城市
  final _address = Result().obs;
  set address(value) => _address.value = value;
  get address => _address.value;
  //表单数据
  final _formDatas = [
    {
      "title": "职业身份",
      "field": "professional",
      "isExpanded": true.obs,
      "isTips": 2,
      "list": ["上班族", "公务员/事业单位", "私营业主", "个体户", "其他"]
    },
    {
      "title": "芝麻分",
      "field": "zhiMa",
      "isExpanded": true.obs,
      "isTips": 4,
      "list": ["无芝麻分", "1-599分", "600-649分", "650-700分", "700分以上"]
    },
    {
      "title": "社保",
      "field": "has",
      "isExpanded": true.obs,
      "isTips": 2,
      "list": ["无社保", "6个月以下", "6个月以上"]
    },
    {
      "title": "公积金",
      "field": "fund",
      "isExpanded": true.obs,
      "isTips": 1,
      "list": ["无公积金", "有公积金"]
    },
    {
      "title": "名下房产",
      "field": "houseProperty",
      "isExpanded": true.obs,
      "isTips": 1,
      "list": ["无房产", "有房,接受抵押", "有房,不接受抵押"]
    },
    {
      "title": "名下车产",
      "field": "carProperty",
      "isExpanded": true.obs,
      "isTips": 1,
      "list": ["无车", "有车"]
    },
    {
      "title": "个人保险",
      "field": "bdStatus",
      "isExpanded": true.obs,
      "isTips": 1,
      "list": ["无保险单", "有保险单"]
    }
  ].obs;
  set formDatas(value) => _formDatas.value = value;
  get formDatas => _formDatas.value;
  //选中保单数据
  Map selectDatas = {"professional": "上班族", "zhiMa": "700分以上", "has": "6个月以上", "fund": "有公积金", "houseProperty": "有房,接受抵押", "carProperty": "有车", "bdStatus": "有保险单"}.obs;
  //是否显示更多资料
  final _isShow = false.obs;
  set isShow(value) => _isShow.value = value;
  get isShow => _isShow.value;
}
