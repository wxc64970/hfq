import 'package:youyi_wallet/common/index.dart';
import 'package:youyi_wallet/pages/repayment/repaymentMode.dart';

class Repaymentapi {
  static Future<RepaymentResponseModel?> getMineRepaymentPlan() async {
    var response = await HttpUtil().post('/finance/app/hfq/repayment/queryRepayPlan', data: RepaymentRequstModel().toJson());
    return response["data"] != null ? RepaymentResponseModel.fromJson(response["data"]) : null;
  }

  static Future<dynamic> applyRepayment({required dynamic requestData}) async {
    var response = await HttpUtil().post('/finance/app/hfq/repayment/applyRepay', data: requestData);
    return response;
  }

  static Future<dynamic> applyRepaymentSendMessageCode({required String phone}) async {
    var response = await HttpUtil().post('/finance/app/hfq/repayment/sendRepaySmsCode', data: {"reserveMobile": phone});
    return response["code"];
  }
}
