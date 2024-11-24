import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';
import 'package:youyi_wallet/common/utils/logUtil.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class BasicinformationController extends GetxController {
  BasicinformationController();

  final state = BasicinformationState();

  List educationList = ["初中毕业及以下", "高中毕业", "中专毕业", "大专毕业", "本科毕业", "研究硕士生以上"];

  List maritalStatusList = ["未婚", "已婚未育", "已婚已育", "离异"];

  List relationList = ["配偶", "子女", "父母", "兄弟/姐妹", "朋友"];

  List professionList = ["自由职业", "政府机关", "学校", "医院", "企业公司", "私营商铺", "个体工商户", "企业法人", "网店卖家"];

  handleEducation() {
    state.name1FocusNode.unfocus();
    state.name2FocusNode.unfocus();
    state.phone1FocusNode.unfocus();
    state.phone2FocusNode.unfocus();
    Get.bottomSheet(OptionWidget("学历", "education", educationList));
  }

  handleMaritalStatus() {
    state.name1FocusNode.unfocus();
    state.name2FocusNode.unfocus();
    state.phone1FocusNode.unfocus();
    state.phone2FocusNode.unfocus();
    Get.bottomSheet(OptionWidget("婚姻状况", "maritalStatus", maritalStatusList));
  }

  handdeProfessional() {
    state.name1FocusNode.unfocus();
    state.name2FocusNode.unfocus();
    state.phone1FocusNode.unfocus();
    state.phone2FocusNode.unfocus();
    Get.bottomSheet(OptionWidget("职业", "professional", professionList));
  }

  onWillPops() {
    state.name1FocusNode.unfocus();
    state.name2FocusNode.unfocus();
    state.phone1FocusNode.unfocus();
    state.phone2FocusNode.unfocus();
    Get.bottomSheet(backWidget());
  }

  handleRelation(int) {
    state.name1FocusNode.unfocus();
    state.name2FocusNode.unfocus();
    state.phone1FocusNode.unfocus();
    state.phone2FocusNode.unfocus();
    if (int == 1) {
      Get.bottomSheet(OptionWidget("关系", "relation1", relationList));
    } else {
      Get.bottomSheet(OptionWidget("关系", "relation2", relationList));
    }
  }

  handleUnfocus() {
    state.name1FocusNode.unfocus();
    state.name2FocusNode.unfocus();
    state.phone1FocusNode.unfocus();
    state.phone2FocusNode.unfocus();
  }

  onChanged(value) {
    state.checkboxData = !state.checkboxData;
    update();
  }

  handleNext() {
    if (state.education == "" ||
        state.maritalStatus == "" ||
        state.name1Controller.text == "" ||
        state.phone1Controller.text == "" ||
        state.name2Controller.text == "" ||
        state.phone2Controller.text == "" ||
        state.professional == "") {
      SmartDialog.showToast("请填写完整，才能下一步");
      return;
    }
    if (!validatePhoneNumber(state.phone1Controller.text) || !validatePhoneNumber(state.phone2Controller.text)) {
      SmartDialog.showToast("请输入正确的手机号码");
      return;
    }
    if (!state.checkboxData) {
      SmartDialog.showToast("请勾选协议");
      return;
    }
    int educationData = educationList.indexWhere((item) => item == state.education) + 1;
    int maritalStatusData = maritalStatusList.indexWhere((item) => item == state.maritalStatus) + 1;
    int professionalData = professionList.indexWhere((item) => item == state.professional) + 1;
    ProfileEntity data = ProfileEntity(
        customerEntity: CustomerEntity(
            education: educationData,
            maritalStatus: maritalStatusData,
            contactName1: state.name1Controller.text,
            contactRole1: state.emergencyContact1['relation'],
            contactTel1: state.phone1Controller.text,
            contactName2: state.name2Controller.text,
            contactRole2: state.emergencyContact2['relation'],
            contactTel2: state.phone2Controller.text,
            professional: professionalData));
    ProfileStore.to.saveProfile(data);
    LogUtil.d(ProfileStore.to.profile.toJson());
    Get.offNamedUntil(RouteNames.basicinformation2, (route) {
      final routename = route.settings.name == RouteNames.application;
      return routename;
    });
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
    state.name1Controller.dispose();
    state.phone1Controller.dispose();
    state.name2Controller.dispose();
    state.phone2Controller.dispose();
    state.name1FocusNode.dispose();
    state.name2FocusNode.dispose();
    state.phone1FocusNode.dispose();
    state.phone2FocusNode.dispose();
  }
}
