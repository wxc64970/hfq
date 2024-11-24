import 'package:youyi_wallet/common/index.dart';

class ConfigAPI {
  static Future<AppMessageResponseEntity?> appMessage({required params}) async {
    var response = await HttpUtil().post('finance/app/hfq/agreement/getAppVersion', data: params);
    return response['data'] != null ? AppMessageResponseEntity.fromJson(response['data']) : null;
  }

  static Future getAgreement({required params}) async {
    var response = await HttpUtil().post('finance/app/hfq/agreement/getAppHtml', data: params);
    return response['data'] != null ? response['data'] : null;
  }
}
