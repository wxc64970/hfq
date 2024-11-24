import 'package:youyi_wallet/common/index.dart';

class BasicInformationAPI {
  static Future<ProfileEntity?> setFrofile({required ProfileEntity params}) async {
    var response = await HttpUtil().post('finance/app/hfq/register/completeInfo', data: params.toJson());
    return response['data'] != null ? ProfileEntity.fromJson(response['data']) : null;
  }

  static Future getCityList() async {
    var response = await HttpUtil().post('finance/h5/city/list', data: {});
    return response;
  }

  static Future getIdVerification({required Map params}) async {
    var response = await HttpUtil().post('finance/h5/realNameAuth', data: params);
    return response;
  }

  static Future getInformationSubmission({required Map params}) async {
    var response = await HttpUtil().post('finance/h5/saveUserInfo', data: params);
    return response;
  }
}
