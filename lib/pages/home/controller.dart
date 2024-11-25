import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:youyi_wallet/common/api/creditResult.dart';
import 'package:youyi_wallet/common/index.dart';

class HomeController extends GetxController {
  HomeController();
  //额度金额
  final _number = 0.obs;
  set number(value) => this._number.value = value;
  get number => this._number.value;

  bool isFaceStatus = false;

  List dataList = [
    {"title": "申请记录", "icon": "assets/images/hfq_04.png"},
    {"title": "待提现", "icon": "assets/images/hfq_05.png"},
    {"title": "借款订单", "icon": "assets/images/hfq_06.png"}
  ];

  final List loanSupermarketMenu = [
    {"title": "车主借钱", "icon": "assets/images/hfq_home_car.png"},
    {"title": "待提现", "icon": "assets/images/hfq_home_wallet.png"},
    {"title": "申请记录", "icon": "assets/images/hfq_home_edit.png"},
    {"title": "黑名单检测", "icon": "assets/images/hfq_home_black_list.png"},
    {"title": "借款订单", "icon": "assets/images/hfq_home_order.png"}
  ];

  List bottomData = [
    {"icon": "assets/images/hfq_08.png", "title": "正规机构", "subtitle": "安全可靠"},
    {},
    {"icon": "assets/images/hfq_09.png", "title": "1000万", "subtitle": "用户好评"},
    {},
    {"icon": "assets/images/hfq_10.png", "title": "放款率遥遥领先", "subtitle": "服务用户人数千万+"}
  ];
  String scrollText = "惠分期平台不会向用户收取任何费用。如遇到以惠分期名义要求您收取任何费用的电话或者短信都是骗子。陌生贷款链接不要点击。以保证金，解冻金等名义让你交钱再借款的都是骗子。防骗干万条，不给陌生人转账第一条。";
  final RefreshController refreshController = RefreshController(
    initialRefresh: false,
  );

  onRefresh() async {
    await UserStore.to.getUserStatus();
    print(UserStore.to.userStatus);
    if (UserStore.to.userStatus == 5 || UserStore.to.userStatus == 6) {
      var res = await CreditResultAPI.getCreditResult();
      if (res != null) {
        number = int.parse(res.creditLimit!);
      }
    }
    refreshController.refreshCompleted();
    if (UserStore.to.userStatus == 1) {
      var res = await RealnameAPI.getFaceRecordStatus();
      // print(res);
      if (res != null) {
        isFaceStatus = res;
      }
    }
    update(["home"]);
  }

  _initData() async {
    await UserStore.to.getUserStatus();
    if (UserStore.to.userStatus == 5 || UserStore.to.userStatus == 6) {
      var res = await CreditResultAPI.getCreditResult();
      if (res != null) {
        number = int.parse(res.creditLimit!);
      }
    } else {
      number = 200000;
    }
    if (UserStore.to.userStatus == 1) {
      var res = await RealnameAPI.getFaceRecordStatus();
      // print(res);
      if (res != null) {
        isFaceStatus = res;
      }
    }

    update(["home"]);
  }

  void handleSeeCredit() {
    // Get.toNamed(RouteNames.basicinformation2);
    // Get.toNamed(RouteNames.reviewloading);
    int userStatus = UserStore.to.userStatus;
    if (true) {
      print(11111);
      Get.toNamed(RouteNames.loanbasicinformation);
      // Get.offNamed(RouteNames.reviewloading2);
      return;
    }
    switch (userStatus) {
      case 1:
        if (isFaceStatus) {
          Get.toNamed(RouteNames.basicinformation);
        } else {
          Get.toNamed(RouteNames.realname);
        }
        break;
      case 2:
        Get.toNamed(RouteNames.reviewloading);
        break;
      case 3:
        Get.toNamed(RouteNames.reviewfail);
        break;
      case 4:
        Get.toNamed(RouteNames.reviewfail);
        break;
      case 5:
        Get.toNamed(RouteNames.confirmationloan);
        break;
      case 6:
        Get.toNamed(RouteNames.comfirmationLoad);
        break;
      case 7:
        Get.toNamed(RouteNames.repaymentMain);
        break;
      case 8:
        // Get.toNamed(RouteNames.reviewloading);
        break;
      default:
    }
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  @override
  void dispose() {
    super.dispose();
    refreshController.dispose();
  }

  void onInactive() {
    print("onInactive");
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
