import 'package:city_pickers/city_pickers.dart';
import 'package:fl_amap/fl_amap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

import 'index.dart';

class LoanbasicinformationController extends GetxController {
  LoanbasicinformationController();

  final state = LoanbasicinformationState();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idCardController = TextEditingController();
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode idCardFocusNode = FocusNode();

  handleUnfocus() {
    nameFocusNode.unfocus();
    idCardFocusNode.unfocus();
  }

  onWillPops() {
    //
  }

  handleAddress() async {
    handleUnfocus();
    var result = await CityPickers.showCityPicker(context: Get.context!, height: kSize600, locationCode: state.address.cityId ?? "110000", showType: ShowType.pc);
    if (result != null) {
      state.address = result;
      print(state.address.cityId);
    }
  }

  //立即申请
  handleApply() async {
    Map verificationParams = {"idNum": idCardController.text.trim(), "name": nameController.text.trim()};
    print(verificationParams);
    Loading.show();
    var res = await BasicInformationAPI.getIdVerification(params: verificationParams);
    if (res['code'] == 0) {
      int professionalData = state.formDatas[0]['list'].indexWhere((item) => item == state.selectDatas['professional']) + 1;
      int zhiMaData = state.formDatas[1]['list'].indexWhere((item) => item == state.selectDatas['zhiMa']) + 1;
      int hasData = state.formDatas[2]['list'].indexWhere((item) => item == state.selectDatas['has']) + 1;
      int fundData = state.formDatas[3]['list'].indexWhere((item) => item == state.selectDatas['fund']) + 1;
      int housePropertyData = state.formDatas[4]['list'].indexWhere((item) => item == state.selectDatas['houseProperty']) + 1;
      int carPropertyData = state.formDatas[5]['list'].indexWhere((item) => item == state.selectDatas['carProperty']) + 1;
      int bdStatusData = state.formDatas[6]['list'].indexWhere((item) => item == state.selectDatas['bdStatus']) + 1;
      Map params = {
        "professional": professionalData,
        "zhiMa": zhiMaData,
        "has": hasData,
        "fund": fundData,
        "houseProperty": housePropertyData,
        "carProperty": carPropertyData,
        "bdStatus": bdStatusData,
        "name": nameController.text.trim(),
        "idNum": idCardController.text.trim(),
        "cityId": state.address.cityId,
        "loan": "25000"
      };

      print(params);
      // print(DESEncrypt.decryptByDES(params['idNum'], "idCard"));
      Get.offNamed(RouteNames.reviewloading2);
      var res2 = await BasicInformationAPI.getInformationSubmission(params: params);
      if (res2['code'] == 0) {
        //
      }
    }
    Loading.close();
    //
  }

  _initData() async {
    SmartDialog.showLoading(msg: "定位中...");
    AMapLocation? res = await GetLocation.getLocationData();
    if (res != null) {
      print(res.toMap());
      // ignore: unused_local_variable
      // Result? result = CityPickers.;
      String cityCode = "";
      CityPickers.metaCities.forEach((outerKey, outerValue) {
        if (outerValue is Map<String, dynamic>) {
          outerValue.forEach((innerKey, innerValue) {
            if (innerValue is Map<String, dynamic> && innerValue['name'] == res.city) {
              print(innerKey);
              cityCode = innerKey;
            }
          });
        }
      });
      state.address = Result(cityId: cityCode, provinceName: res.province, cityName: res.city);
    }
    SmartDialog.dismiss(status: SmartStatus.loading);
    update();
  }

  onChanged1(value) {
    if (nameController.text.trim().isNotEmpty && idCardController.text.trim().isNotEmpty) {
      state.isShow = true;
    } else {
      state.isShow = false;
    }
    update();
  }

  onChanged2(value) {
    if (nameController.text.trim().isNotEmpty && idCardController.text.trim().isNotEmpty) {
      state.isShow = true;
    } else {
      state.isShow = false;
    }
    update();
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    _initData();
    // nameFocusNode.addListener(() {
    //   print(11111);
    //   if (!nameFocusNode.hasFocus) {}
    // });
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
    nameController.dispose();
    idCardController.dispose();
    nameFocusNode.dispose();
    idCardFocusNode.dispose();
  }
}
