import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:youyi_wallet/common/api/home_lsAPI.dart';

import 'index.dart';

class FastController extends GetxController {
  FastController();

  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  Rx<FastState> state = FastState().obs;

  RxList _fastList = [].obs;
  get fastList => _fastList.value;
  set fastList(value) => _fastList.value = value;

  // tap
  void handleTap(int index) {
    Get.snackbar(
      "标题",
      "消息",
    );
  }

//网络请求
  void refreshData() {
    print("-----------刷新极速贷列表数据-------------");
    HOMELSAPI.fastLoanCrashLib().then((_) {
      HOMELSAPI.getListDataWithFastLoan(needAuth: true, size: 10).then((value) {
        fastList = value;
        refreshController.refreshCompleted();
      });
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
    refreshData();
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
