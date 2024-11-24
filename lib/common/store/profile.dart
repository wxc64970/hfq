import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

class ProfileStore extends GetxController {
  static ProfileStore get to => Get.find();
  // 用户 profile
  final _profile = ProfileEntity().obs;
  ProfileEntity get profile => _profile.value;

  @override
  void onInit() {
    super.onInit();
    print("onInit");
  }

  // 保存 profile
  Future<void> saveProfile(ProfileEntity profile) async {
    _profile.value = profile;
  }
}
