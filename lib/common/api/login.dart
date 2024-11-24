import 'package:youyi_wallet/common/index.dart';

class LoginAPI {
  static Future getTelCode({required TelCodeRequestEntity params}) async {
    var response = await HttpUtil().post('finance/app/hfq/register/telCode', data: params.toJson());
    return response != null ? response : null;
  }

  static Future<RegisterResponseEntity?> register({required RegisterRequestEntity params}) async {
    var response = await HttpUtil().post('finance/app/hfq/register/customer', data: params.toJson());
    return response['data'] != null ? RegisterResponseEntity.fromJson(response['data']) : null;
  }

  static Future logOut() async {
    var response = await HttpUtil().post('finance/app/hfq/register/loginOut', data: {});
    return response != null ? response : null;
  }

  static Future cancelAccount() async {
    var response = await HttpUtil().post('finance/app/hfq/register/cancelAccount', data: {});
    return response != null ? response : null;
  }
}
