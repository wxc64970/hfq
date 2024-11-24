import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  // 是否登录
  final _isLogin = false.obs;
  // 令牌 token
  String token = '';
  // 用户 profile
  final _profile = "".obs;

  bool get isLogin => _isLogin.value;
  String get profile => _profile.value;
  bool get hasToken => token.isNotEmpty;

  final _userStatus = 1
      .obs; //1未申请额度 2正在申请额度  3额度审核被拒 4额度审核被拒（渠道用户）5未发起借款 6借款审核中 7借款成功 8借款被拒 9未知状态
  int get userStatus => _userStatus.value;

  @override
  void onInit() {
    super.onInit();
    token = StorageService.to.getString(STORAGE_USER_TOKEN_KEY);
    if (StorageService.to.getString(STORAGE_USER_TOKEN_KEY).isNotEmpty) {
      _isLogin.value = true;
    }
    var profileOffline = StorageService.to.getString(STORAGE_USER_PROFILE_KEY);
    if (profileOffline.isNotEmpty) {
      _profile.value = profileOffline;
    }
  }

  // 保存 token
  Future<void> setToken(String value) async {
    await StorageService.to.setString(STORAGE_USER_TOKEN_KEY, value);
    token = value;
    _isLogin.value = true;
  }

  Future<void> saveProfile(String profile) async {
    _profile.value = profile;
    StorageService.to.setString(STORAGE_USER_PROFILE_KEY, profile);
  }

  // 获取用户状态
  Future<void> getUserStatus() async {
    var res = await UserStatusAPI.getUserStatus();
    if (res != null) {
      _userStatus.value = res.status!;
      StorageService.to.setInt(STORAGE_USER_STATUS_KEY, res.status!);
      // _userStatus.value = 4;
      // StorageService.to.setInt(STORAGE_USER_STATUS_KEY, 4);
    }
  }

  // 退出登录
  Future<void> onLogout() async {
    if (_isLogin.value) await LoginAPI.logOut();
    await StorageService.to.remove(STORAGE_USER_TOKEN_KEY);
    await StorageService.to.remove(STORAGE_USER_PROFILE_KEY);
    _isLogin.value = false;
    token = '';
    Get.offAllNamed(RouteNames.frameSignIn);
  }

  //注销
  Future<void> onCancelAccount() async {
    if (_isLogin.value) await LoginAPI.cancelAccount();
    await StorageService.to.removeAll();
    _isLogin.value = false;
    token = '';
    Get.offAllNamed(RouteNames.frameSignIn);
  }
}
