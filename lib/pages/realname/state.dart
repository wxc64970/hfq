import 'package:get/get.dart';

class RealnameState {
  final _checkboxData = false.obs;
  set checkboxData(value) => this._checkboxData.value = value;
  get checkboxData => this._checkboxData.value;

  final _idCard1 = "".obs;
  set idCard1(value) => this._idCard1.value = value;
  get idCard1 => this._idCard1.value;

  final _idCard2 = "".obs;
  set idCard2(value) => this._idCard2.value = value;
  get idCard2 => this._idCard2.value;

  //问卷调查数据
  List<Item> surveyItems = [
    Item(title: "身份证不在身边", isSelected: false.obs),
    Item(title: "担心信息泄露", isSelected: false.obs),
    Item(title: "不想提供身份证", isSelected: false.obs),
    Item(title: "其他原因", isSelected: false.obs),
  ];
}

class Item {
  final String title;
  final RxBool isSelected;

  Item({required this.title, required this.isSelected});
}

class ItemJsonConverter {
  static String itemToJson(Item item) {
    return item.title;
  }
}
