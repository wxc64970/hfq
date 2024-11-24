import 'package:dio/dio.dart';

class FileRequestEntity {
  late MultipartFile file;

  FileRequestEntity({required this.file});

  FileRequestEntity.fromJson(Map<String, dynamic> json) {
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file'] = this.file;
    return data;
  }
}

class FileResponseEntity {
  String? address;
  String? authority;
  String? birth;
  String? idNum;
  String? imageUrl;
  String? name;
  String? nation;
  String? sex;
  String? sourcePhotoStr;
  String? validDate;

  FileResponseEntity({this.address, this.authority, this.birth, this.idNum, this.imageUrl, this.name, this.nation, this.sex, this.sourcePhotoStr, this.validDate});

  FileResponseEntity.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    authority = json['authority'];
    birth = json['birth'];
    idNum = json['idNum'];
    imageUrl = json['imageUrl'];
    name = json['name'];
    nation = json['nation'];
    sex = json['sex'];
    sourcePhotoStr = json['sourcePhotoStr'];
    validDate = json['validDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['authority'] = this.authority;
    data['birth'] = this.birth;
    data['idNum'] = this.idNum;
    data['imageUrl'] = this.imageUrl;
    data['name'] = this.name;
    data['nation'] = this.nation;
    data['sex'] = this.sex;
    data['sourcePhotoStr'] = this.sourcePhotoStr;
    data['validDate'] = this.validDate;
    return data;
  }
}

class FaceidRequestEntity {
  String? idNo;
  String? name;
  String? sourcePhotoStr;
  String? sourcePhotoType;

  FaceidRequestEntity({this.idNo, this.name, this.sourcePhotoStr, this.sourcePhotoType});

  FaceidRequestEntity.fromJson(Map<String, dynamic> json) {
    idNo = json['idNo'];
    name = json['name'];
    sourcePhotoStr = json['sourcePhotoStr'];
    sourcePhotoType = json['sourcePhotoType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idNo'] = this.idNo;
    data['name'] = this.name;
    data['sourcePhotoStr'] = this.sourcePhotoStr;
    data['sourcePhotoType'] = this.sourcePhotoType;
    return data;
  }
}

class FaceidResponseEntity {
  String? bizSeqNo;
  String? code;
  String? msg;
  Results? result;

  FaceidResponseEntity({this.bizSeqNo, this.code, this.msg, this.result});

  FaceidResponseEntity.fromJson(Map<String, dynamic> json) {
    bizSeqNo = json['bizSeqNo'];
    code = json['code'];
    msg = json['msg'];
    result = json['result'] != null ? new Results.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bizSeqNo'] = this.bizSeqNo;
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Results {
  String? bizSeqNo;
  String? faceId;
  String? optimalDomain;
  String? orderNo;
  String? oriCode;
  String? success;
  String? transactionTime;
  String? userId;
  String? nonce;
  String? sign;
  String? appId;

  Results({this.bizSeqNo, this.faceId, this.optimalDomain, this.orderNo, this.oriCode, this.success, this.transactionTime, this.userId, this.nonce, this.sign, this.appId});

  Results.fromJson(Map<String, dynamic> json) {
    bizSeqNo = json['bizSeqNo'];
    faceId = json['faceId'];
    optimalDomain = json['optimalDomain'];
    orderNo = json['orderNo'];
    oriCode = json['oriCode'];
    success = json['success'];
    transactionTime = json['transactionTime'];
    userId = json['userId'];
    nonce = json['nonce'];
    sign = json['sign'];
    appId = json['appId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bizSeqNo'] = this.bizSeqNo;
    data['faceId'] = this.faceId;
    data['optimalDomain'] = this.optimalDomain;
    data['orderNo'] = this.orderNo;
    data['oriCode'] = this.oriCode;
    data['success'] = this.success;
    data['transactionTime'] = this.transactionTime;
    data['userId'] = this.userId;
    data['nonce'] = this.nonce;
    data['sign'] = this.sign;
    data['appId'] = this.appId;
    return data;
  }
}

class IsFaceResponseEntity {
  String? flag;

  IsFaceResponseEntity({this.flag});

  IsFaceResponseEntity.fromJson(Map<String, dynamic> json) {
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flag'] = this.flag;
    return data;
  }
}
