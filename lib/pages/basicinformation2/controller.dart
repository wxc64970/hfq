import 'package:city_pickers/city_pickers.dart';
import 'package:fl_amap/fl_amap.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';
import 'index.dart';
import 'widgets/widgets.dart';

class Basicinformation2Controller extends GetxController {
  Basicinformation2Controller();

  final state = Basicinformation2State();

  List loanAmountList = List.generate((200000 - 5000) ~/ 5000 + 1, (index) => 5000 + index * 5000);
  List loanPeriodList = [3, 6, 12, 24, 36];
  List monthlyIncList = ["2000以内", "2000-3000", "3000-5000", "5000-8000", "8000-12000", "12000以上"];
  List dataList = ["无", "有"];
  List ziMaList = ["无芝麻分", "600分以下", "600-650分", "650-700分", "700分以上"];
  List insuranceList = ["无保险单", "有保险单"];

  onWillPops() {
    Get.bottomSheet(backWidget());
  }

  handleLoanAmount() {
    Get.bottomSheet(OptionWidget("贷款金额", "loanAmount", loanAmountList));
  }

  handleLoanPeriod() {
    Get.bottomSheet(OptionWidget("贷款期限", "loanPeriod", loanPeriodList));
  }

  handleMonthlyInc() {
    Get.bottomSheet(OptionWidget("月收入", "monthlyInc", monthlyIncList));
  }

  handleAccumulationFund() {
    Get.bottomSheet(OptionWidget("公积金缴纳", "accumulationFund", dataList));
  }

  handleHouseProperty() {
    Get.bottomSheet(OptionWidget("房产情况", "houseProperty", dataList));
  }

  handleVehicle() {
    Get.bottomSheet(OptionWidget("车辆情况", "vehicle", dataList));
  }

  handleZiMa() {
    Get.bottomSheet(OptionWidget("芝麻信用分", "ziMa", ziMaList));
  }

  handleHas() {
    Get.bottomSheet(OptionWidget("社保", "has", dataList));
  }

  handleInsurance() {
    Get.bottomSheet(OptionWidget("个人保险", "insurance", insuranceList));
  }

  handleNext() async {
    // LogUtil.d(ProfileStore.to.profile.toJson());
    if (state.loanAmount == 0 ||
        state.loanPeriod == 0 ||
        state.monthlyInc == "" ||
        state.address.areaName == null ||
        state.accumulationFund == "" ||
        state.houseProperty == "" ||
        state.vehicle == "" ||
        state.ziMa == "" ||
        state.has == "" ||
        state.insurance == "") {
      // Snackbar.show("温馨提示", "请填写完整，才能下一步");
      SmartDialog.showToast("请填写完整，才能下一步");
      return;
    }
    if (!state.checkboxData) {
      SmartDialog.showToast("请勾选协议");
      return;
    }
    int monthlyIncData = monthlyIncList.indexWhere((item) => item == state.monthlyInc) + 1;
    int accumulationFundData = dataList.indexWhere((item) => item == state.accumulationFund) + 1;
    int housePropertyData = dataList.indexWhere((item) => item == state.houseProperty) + 1;
    int vehicleData = dataList.indexWhere((item) => item == state.vehicle) + 1;
    int ziMaData = ziMaList.indexWhere((item) => item == state.ziMa) + 1;
    int hasData = dataList.indexWhere((item) => item == state.has) + 1;
    int insuranceData = insuranceList.indexWhere((item) => item == state.insurance) + 1;
    ProfileEntity data = ProfileStore.to.profile;
    data.customerEntity!.loanAmount = state.loanAmount;
    data.customerEntity!.loanTerm = state.loanPeriod;
    data.customerEntity!.monthlyIncome = monthlyIncData;
    data.customerEntity!.homeProvince = state.address.provinceName;
    data.customerEntity!.homeCity = state.address.cityName;
    data.customerEntity!.homeDistrict = state.address.areaName;
    data.customerEntity!.fund = accumulationFundData;
    data.customerEntity!.houseProperty = housePropertyData;
    data.customerEntity!.carProperty = vehicleData;
    data.customerEntity!.zhiMa = ziMaData;
    data.customerEntity!.has = hasData;
    data.customerEntity!.bdStatus = insuranceData;
    ProfileStore.to.saveProfile(data);
    // LogUtil.d(ProfileStore.to.profile.toJson());
    Loading.show();
    var res = await BasicInformationAPI.setFrofile(params: ProfileStore.to.profile);
    print(res?.toJson());
    if (res != null) {
      Get.offNamed(RouteNames.reviewloading);
    }
    Loading.close();
  }

  onChanged(value) {
    state.checkboxData = !state.checkboxData;
    update();
  }

  handleAddress() async {
    SmartDialog.showLoading(msg: "定位中...", backDismiss: false);
    AMapLocation? res = await GetLocation.getLocationData();
    if (res != null) {
      print(res.toMap());
    }
    SmartDialog.dismiss(status: SmartStatus.loading);
    var result = await CityPickers.showCityPicker(context: Get.context!, height: kSize600, locationCode: state.address.areaId ?? "110000");
    if (result != null) {
      state.address = result;
      print(state.address.areaName);
    }
  }

  String findKeyByValue(data, String value) {
    String result = '';
    data.forEach((key, valueMap) {
      valueMap.forEach((subKey, subValueMap) {
        if (subValueMap['name'] == value) {
          // result = '$key-$subKey';
          result = '$subKey';
          return;
        }
      });
    });
    return result;
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }
}
