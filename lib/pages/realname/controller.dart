import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wb_flutter_kyc/wb_flutter_kyc.dart';
import 'package:youyi_wallet/common/index.dart';
import 'package:image_picker/image_picker.dart';

import 'index.dart';
import 'widgets/widgets.dart';
import 'package:dio/src/multipart_file.dart' as MultipartFile;

class RealnameController extends GetxController {
  RealnameController();

  final state = RealnameState();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idNumberController = TextEditingController();
  final TextEditingController validController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode idNumberFocusNode = FocusNode();
  final FocusNode validFocusNode = FocusNode();
  final FocusNode addressFocusNode = FocusNode();
  String sourcePhotoStr = "";

  handleUpload(type) async {
    var res = await RequestPermission.requestPhotoPermission();
    if (!res) return;
    final ImagePicker picker = ImagePicker();
    Uploadfile.show(() async {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
      if (image != null) {
        int fileLength = await image.length();
        if (fileLength > 20 * 1024 * 1024) {
          SmartDialog.showToast("图片大小不能超过20M");
          return;
        }
        await uploadfile(image.path, type);
      }
    }, () async {
      final status = await Permission.camera.status;
      print(status.isDenied);
      if (status.isDenied) {
        await Permission.camera.request();
        SmartDialog.showToast("相机权限被拒绝，请手动开启权限");
        return;
      }
      final XFile? image = await picker.pickImage(source: ImageSource.camera, imageQuality: 80);
      if (image != null) {
        int fileLength = await image.length();
        if (fileLength > 20 * 1024 * 1024) {
          SmartDialog.showToast("图片大小不能超过20M");
          return;
        }
        await uploadfile(image.path, type);
      }
    });
  }

  uploadfile(path, type) async {
    Get.back();
    Loading.show();
    var data = await MultipartFile.MultipartFile.fromFile(path);
    FileRequestEntity params = FileRequestEntity(file: data);
    var res = await RealnameAPI.getUploadImage(params: params);
    if (res != null) {
      if (type == 1) {
        state.idCard1 = res.imageUrl;
      } else {
        state.idCard2 = res.imageUrl;
      }
      if (res.name!.isNotEmpty) {
        sourcePhotoStr = res.sourcePhotoStr!;
        nameController.text = res.name!;
      }
      if (res.idNum!.isNotEmpty) {
        idNumberController.text = res.idNum!;
      }
      if (res.address!.isNotEmpty) {
        addressController.text = res.address!;
      }
      if (res.validDate!.isNotEmpty) {
        validController.text = res.validDate!;
      }
    }
    Loading.close();
  }

  getFaceId() async {
    Loading.show();
    FaceidRequestEntity params = FaceidRequestEntity(idNo: idNumberController.text, name: nameController.text, sourcePhotoStr: sourcePhotoStr, sourcePhotoType: "2");
    var res = await RealnameAPI.getFaceId(params: params);
    // LogUtil.d(res!.toJson());
    if (res != null) {
      final Map<dynamic, dynamic> result = await WbFlutterKyc.auth(res.result!.faceId!, res.result!.orderNo!, res.result!.nonce!, res.result!.sign!, res.result!.userId!, res.result!.appId!,
          Platform.isAndroid ? Constants.androidLicense : Constants.iosLicense);
      Loading.close();
      print(res);
      return result['success'];
    } else {
      Loading.close();
      return null;
    }
  }

  //同意协议变化
  onChanged(value) {
    state.checkboxData = value;
    update();
  }

  //跳转 注册服务协议
  handleUserAgreement() {
    Get.toNamed(RouteNames.webviewPage, arguments: {"url": "https://image.sxhywincredit.com/html/agreement/APP/PersonalInformationAuthorization.html"});
  }

  onWillPops() {
    Get.bottomSheet(backoneWidget(), backgroundColor: Colors.white);
  }

  //下一步
  handleNext() async {
    if (nameController.text == "" || idNumberController.text == "" || validController.text == "" || addressController.text == "") {
      SmartDialog.showToast("请正确上传身份证照片");
      return;
    }
    if (!state.checkboxData) {
      // SmartDialog.showToast("请勾选个人信息处理授权书")
      SmartDialog.showToast("请勾选协议");
      return;
    }

    //判断用户是否需要活体识别
    IsFaceResponseEntity? isFace = await RealnameAPI.getIsFace();
    if (isFace!.flag == "false") {
      Get.offNamed(RouteNames.facesuccess);
      return;
    }
    //进行活体识别
    var res = await getFaceId();
    if (res == "1") {
      SmartDialog.showToast("人脸识别成功！");
      RealnameAPI.getIsFaceSuccess();
      Get.offNamed(RouteNames.facesuccess);
    } else {
      SmartDialog.showToast("人脸识别失败，请重试！");
    }

    // Get.toNamed(RouteNames.facesuccess);
  }

  // getfaceid() async {
  //   // final Map<dynamic, dynamic> result = await WbFlutterKyc.auth(faceId, order, nonce, sign, userId, appId, license);
  // }

  //调查问卷选择
  toggleSelection(String title) {
    final item = state.surveyItems.firstWhere((element) => element.title == title);
    // item.isSelected = !item.isSelected;
    item.isSelected.value = !item.isSelected.value;
    // print(item.isSelected.value);
    update(["realname"]);
  }

  tobacktwo() {
    Get.back();
    Get.bottomSheet(backtwoWidget(), backgroundColor: Colors.white);
  }

  List<Item> getSelectedItems() {
    return state.surveyItems.where((item) => item.isSelected.value).toList();
  }

  gobacktwo() {
    final selectedItems = getSelectedItems();
    List data = [];
    for (var item in selectedItems) {
      print(item);
      data.add(ItemJsonConverter.itemToJson(item));
    }
    print(data);
    Get.back();
    Get.back();
  }

  initData() async {
    var res = await UserStatusAPI.getAuditAccount();
    if (res != null) {
      nameController.text = res.name!;
      idNumberController.text = res.idNum!;
      validController.text = res.validDate!;
      addressController.text = res.address!;
      state.idCard1 = res.frontFile;
      state.idCard2 = res.backFile;
      update();
    }
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    initData();
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
    idNumberController.dispose();
    validController.dispose();
    addressController.dispose();
    nameFocusNode.dispose();
    idNumberFocusNode.dispose();
    validFocusNode.dispose();
    addressFocusNode.dispose();
  }
}
