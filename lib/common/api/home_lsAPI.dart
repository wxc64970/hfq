import 'package:youyi_wallet/common/api/loanApi.dart';
import 'package:youyi_wallet/common/index.dart';
import 'package:youyi_wallet/pages/fast/index.dart';
import 'package:youyi_wallet/pages/large/index.dart';

class HOMELSAPI {
  //
  static Future<dynamic> fastLoanCrashLib() async {
    //极速贷撞库接口，需要先行调用
    var response =
        await HttpUtil().post('/finance/app/hfq/jsd-product/crash-lib');
    return response["data"];
  }

  //获取极速贷弹框产品
  static Future<dynamic> getAlertDataWithFastLoan() async {
    var response = await HttpUtil().post('/finance/app/hfq/jsd-product/get-tc');
    return response["data"];
  }

//获取大额贷谈框产品
  static Future<dynamic> getAlertDataWithLargeLoan() async {
    var response = await HttpUtil().post('/finance/app/hfq/ded-product/get-tc');
    return response["data"];
  }

//获取首页产品,
/*获取逻辑，有限获取大额贷产品，大额贷产品未获取到，则获取极速贷产品，两个产品都没有，则不在展示产品，
返回参数{"data": largeData,//获取到的产品数据
       "type": 1//返回的产品类型 1 大额贷 2 极速贷 -1 未获取到两个类的产品
       }
*/
  static Future<Map> getHomePageAlertData() async {
    var response1 = await getAlertDataWithLargeLoan();
    if (response1 != null) {
      return {"data": LargeProductDataModel.fromJson(response1), "type": 1};
    } else {
      var response2 = await getAlertDataWithFastLoan();
      if (response2 != null) {
        return {"data": FastProductDataModel.fromJson(response2), "type": 2};
      } else {
        return {"type": -1};
      }
    }
  }

  //获取极速贷产品列表
  //size 获取的产品个数
  //needAuth 是否需要留资
  static Future<List<FastProductDataModel>> getListDataWithFastLoan(
      {int size = 3, bool needAuth = false}) async {
    final url = needAuth
        ? '/finance/app/hfq/jsd-product/list-verified'
        : '/finance/app/hfq/jsd-product/list-not_auth';
    var response = await HttpUtil().post(url, data: {"size": size});
    if (response["data"] != null && (response["data"] is List)) {
      List<FastProductDataModel> list = [];
      for (var item in response["data"]) {
        list.add(FastProductDataModel.fromJson(item));
      }
      return list;
    } else {
      return [];
    }
  }

//获取大额贷差品列表
//size 获取的产品个数
  static Future<List<LargeProductDataModel>> getListDataWithLargeLoan(
      {int size = 3}) async {
    var response = await HttpUtil()
        .post('/finance/app/hfq/ded-product/list', data: {"size": size});
    if (response["data"] != null && response["data"] is List) {
      List<LargeProductDataModel> list = [];
      for (var item in response["data"]) {
        list.add(LargeProductDataModel.fromJson(item));
      }
      return list;
    } else {
      return [];
    }
  }

//判断是否能申请极速贷产品
//pid:极速贷产品ID
  static Future<dynamic> canApplyProductWithFast({required int pid}) async {
    var response =
        await HttpUtil().post('/finance/app/hfq/jsd-product/can-apply/$pid');
    return response["data"];
  }

//申请大额贷产品
//tag:大额贷产品唯一标识
  static Future<dynamic> applyProductWithLarge({required String tag}) async {
    var response =
        await HttpUtil().post('/finance/app/hfq/ded-product/addAudit/$tag');
    return response["data"];
  }

  ///埋点
  static Future<dynamic> applyProductWithFastpoint(
      {required int pid, required String eventType}) async {
    var userInfo = await LoanAPI.bindBankGetUserInfo();
    if (userInfo == null) {
      var response = await HttpUtil().post(
          '/finance/biz/tEventRecordNew/addRecord',
          data: {"eventType": eventType, "pid": pid, "invite": ""});
      return response;
    } else {
      var response = await HttpUtil()
          .post('/finance/biz/tEventRecordNew/addRecord', data: {
        "eventType": eventType,
        "pid": pid,
        "invite": userInfo.invited ?? ""
      });
      return response;
    }
  }

  //联登
  static Future<dynamic> applyProductWithFastJoinLogin(
      {required int pid}) async {
    var response = await HttpUtil()
        .post('/finance/app/hfq/jsd-product/joint-login', data: {"pid": pid});
    return response;
  }
}
