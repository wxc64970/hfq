import 'package:youyi_wallet/common/index.dart';

class LoanSMFastAPI {
  static Future<dynamic> getRankList() async {
    var response = await HttpUtil().post('path');
    return response["data"];
  }
}
