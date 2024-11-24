import 'package:youyi_wallet/common/index.dart';
import 'package:youyi_wallet/pages/bindBank/bindinBanCarsSate.dart';
import 'package:youyi_wallet/pages/confirmationloan/index.dart';

class LoanAPI {
  static Future<ComfireLoanModel?> getLoanParams() async {
    var response =
        await HttpUtil().post("/finance/app/hfq/loan/queryLoanParams");
    return response["data"] != null
        ? ComfireLoanModel.fromJson(response["data"])
        : null;
  }

  static Future<LoanTrialListModel?> getLoanTrial(
      {required LoanTrialGetModel model}) async {
    var response = await HttpUtil()
        .post('/finance/app/hfq/loan/loanTrial', data: model.toJson());
    return response["data"] != null
        ? LoanTrialListModel.fromJson(response["data"])
        : null;
  }

  static Future<HFQUserBindinListMode?> getBindinBankCardList() async {
    var response = await HttpUtil()
        .post('/finance/app/hfq/bindingbank/getBindingBankInfoList');
    return response["data"] != null
        ? HFQUserBindinListMode.fromJson({"bindinList": response["data"]})
        : null;
  }

  static Future<SimpleUserModel?> bindBankGetUserInfo() async {
    var response =
        await HttpUtil().post('/finance/app/hfq/register/getCustomerInfo');
    return response["data"] != null
        ? SimpleUserModel.fromJson(response["data"])
        : null;
  }

  static Future<HFQBankListModel?> getCanUsedBanList() async {
    var response = await HttpUtil().post(
        '/finance/app/hfq/bindingbank/querySupportBankList',
        data: HFQBindinBancardListRequetModel().toJson());
    return response["data"] != null
        ? HFQBankListModel.fromJson({"bankList": response["data"]})
        : null;
  }

  static Future<dynamic> sendMessageWithBindinBankCard(
      {required String phone}) async {
    HFQBindinBancardListRequetModel requetModel =
        HFQBindinBancardListRequetModel();
    requetModel.reserveMobile = phone;
    var response = await HttpUtil().post(
        "/finance/app/hfq/bindingbank/sendBindingBankSmsCode",
        data: requetModel.toJson());
    return response["data"];
  }

  static Future<dynamic> binDinCard({required dynamic requestJson}) async {
    var response = await HttpUtil()
        .post("/finance/app/hfq/bindingbank/bindingBank", data: requestJson);
    return response["code"];
  }

  static Future<dynamic> applyLoan({required dynamic requestData}) async {
    var response = await HttpUtil()
        .post("/finance/app/hfq/loan/applyLoan", data: requestData);
    return response["code"];
  }

  static Future<dynamic> applyLoanStatus() async {
    var requestData = {
      "loanApplyQueryRequest": {"transNo": "", "userNo": ""},
      "merchant": ""
    };
    var response = await HttpUtil()
        .post("/finance/app/hfq/loan/queryLoanResult", data: requestData);
    return response["data"];
  }
}
