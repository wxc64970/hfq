import 'package:youyi_wallet/common/index.dart';

class CreditResultAPI {
  static Future<CreditApplyResponseEntity?> getCreditResult() async {
    var response = await HttpUtil().post('finance/app/hfq/credit/creditApplyResult', data: {});
    return response['data'] != null ? CreditApplyResponseEntity.fromJson(response['data']) : null;
  }
}
