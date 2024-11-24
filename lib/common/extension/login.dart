class TelCodeRequestEntity {
  String? mobile;

  TelCodeRequestEntity({this.mobile});

  TelCodeRequestEntity.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile'] = this.mobile;
    return data;
  }
}

class RegisterRequestEntity {
  String? invite;
  String? mobile;
  String? msgCode;

  RegisterRequestEntity({this.invite, this.mobile, this.msgCode});

  RegisterRequestEntity.fromJson(Map<String, dynamic> json) {
    invite = json['invite'];
    mobile = json['mobile'];
    msgCode = json['msgCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['invite'] = this.invite;
    data['mobile'] = this.mobile;
    data['msgCode'] = this.msgCode;
    return data;
  }
}

class RegisterResponseEntity {
  String? token;

  RegisterResponseEntity({this.token});

  RegisterResponseEntity.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    return data;
  }
}
