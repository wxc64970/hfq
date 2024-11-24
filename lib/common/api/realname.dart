import 'package:youyi_wallet/common/index.dart';

class RealnameAPI {
  static Future<FileResponseEntity?> getUploadImage({required FileRequestEntity params}) async {
    var response = await HttpUtil().postForm('finance/app/hfq/faceNucleus/getIdCardOcrByFile', data: params.toJson());
    return response['data'] != null ? FileResponseEntity.fromJson(response['data']) : null;
  }

  static Future<FaceidResponseEntity?> getFaceId({required FaceidRequestEntity params}) async {
    var response = await HttpUtil().post('/finance/app/hfq/faceNucleus/getFaceId', data: params.toJson());
    return response['data'] != null ? FaceidResponseEntity.fromJson(response['data']) : null;
  }

  static Future<IsFaceResponseEntity?> getIsFace() async {
    var response = await HttpUtil().post('finance/app/hfq/register/getNextFace', data: {});
    return response['data'] != null ? IsFaceResponseEntity.fromJson(response['data']) : null;
  }

  static Future getIsFaceSuccess() async {
    var response = await HttpUtil().post('finance/app/hfq/faceNucleus/faceRecordCallback', data: {});
    return response['data'] != null ? response['data'] : null;
  }

  static Future getFaceRecordStatus() async {
    var response = await HttpUtil().post('finance/app/hfq/faceNucleus/getFaceRecordStatus', data: {});
    return response['data'] != null ? response['data'] : null;
  }
}
