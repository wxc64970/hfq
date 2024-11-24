import 'package:youyi_wallet/common/index.dart';

class UserStatusAPI {
  static Future<UserStatusResponseEntity?> getUserStatus() async {
    var response = await HttpUtil()
        .post('finance/app/hfq/register/getCustomerLoanStatus', data: {});
    return response['data'] != null
        ? UserStatusResponseEntity.fromJson(response['data'])
        : null;
  }

  static Future<AuditAccountResponseEntity?> getAuditAccount() async {
    var response = await HttpUtil()
        .post('finance/app/hfq/register/getAuditAccount', data: {});
    return response['data'] != null
        ? AuditAccountResponseEntity.fromJson(response['data'])
        : null;
  }
}
