class BindState {}

class HFQUserBindinListMode {
  List<BindinList>? bindinList;

  HFQUserBindinListMode({this.bindinList});

  HFQUserBindinListMode.fromJson(Map<String, dynamic> json) {
    if (json['bindinList'] != null) {
      bindinList = <BindinList>[];
      json['bindinList'].forEach((v) {
        bindinList!.add(new BindinList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bindinList != null) {
      data['bindinList'] = this.bindinList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BindinList {
  int? autoRepayment;
  String? bankCardNum;
  String? bankCardType;
  String? bankCode;
  String? createTime;
  int? deleteFlag;
  int? id;
  String? merchant;
  String? openBank;
  String? reserveMobile;
  int? uid;
  String? updateTime;
  String? userNo;

  BindinList(
      {this.autoRepayment,
      this.bankCardNum,
      this.bankCardType,
      this.bankCode,
      this.createTime,
      this.deleteFlag,
      this.id,
      this.merchant,
      this.openBank,
      this.reserveMobile,
      this.uid,
      this.updateTime,
      this.userNo});

  BindinList.fromJson(Map<String, dynamic> json) {
    autoRepayment = json['autoRepayment'];
    bankCardNum = json['bankCardNum'];
    bankCardType = json['bankCardType'];
    bankCode = json['bankCode'];
    createTime = json['createTime'];
    deleteFlag = json['deleteFlag'];
    id = json['id'];
    merchant = json['merchant'];
    openBank = json['openBank'];
    reserveMobile = json['reserveMobile'];
    uid = json['uid'];
    updateTime = json['updateTime'];
    userNo = json['userNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['autoRepayment'] = this.autoRepayment;
    data['bankCardNum'] = this.bankCardNum;
    data['bankCardType'] = this.bankCardType;
    data['bankCode'] = this.bankCode;
    data['createTime'] = this.createTime;
    data['deleteFlag'] = this.deleteFlag;
    data['id'] = this.id;
    data['merchant'] = this.merchant;
    data['openBank'] = this.openBank;
    data['reserveMobile'] = this.reserveMobile;
    data['uid'] = this.uid;
    data['updateTime'] = this.updateTime;
    data['userNo'] = this.userNo;
    return data;
  }
}

class HFQBindinBancardListRequetModel {
  int? autoRepayment;
  String? bankCardNum;
  String? bankCardType;
  String? bankCode;
  String? createTime;
  int? deleteFlag;
  int? id;
  String? merchant;
  String? openBank;
  String? reserveMobile;
  int? uid;
  String? updateTime;
  String? userNo;

  HFQBindinBancardListRequetModel(
      {this.autoRepayment,
      this.bankCardNum,
      this.bankCardType,
      this.bankCode,
      this.createTime,
      this.deleteFlag,
      this.id,
      this.merchant,
      this.openBank,
      this.reserveMobile,
      this.uid,
      this.updateTime,
      this.userNo});

  HFQBindinBancardListRequetModel.fromJson(Map<String, dynamic> json) {
    autoRepayment = json['autoRepayment'];
    bankCardNum = json['bankCardNum'];
    bankCardType = json['bankCardType'];
    bankCode = json['bankCode'];
    createTime = json['createTime'];
    deleteFlag = json['deleteFlag'];
    id = json['id'];
    merchant = json['merchant'];
    openBank = json['openBank'];
    reserveMobile = json['reserveMobile'];
    uid = json['uid'];
    updateTime = json['updateTime'];
    userNo = json['userNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['autoRepayment'] = this.autoRepayment;
    data['bankCardNum'] = this.bankCardNum;
    data['bankCardType'] = this.bankCardType;
    data['bankCode'] = this.bankCode;
    data['createTime'] = this.createTime;
    data['deleteFlag'] = this.deleteFlag;
    data['id'] = this.id;
    data['merchant'] = this.merchant;
    data['openBank'] = this.openBank;
    data['reserveMobile'] = this.reserveMobile;
    data['uid'] = this.uid;
    data['updateTime'] = this.updateTime;
    data['userNo'] = this.userNo;
    return data;
  }
}

class HFQBankListModel {
  List<BankList>? bankList;

  HFQBankListModel({this.bankList});

  HFQBankListModel.fromJson(Map<String, dynamic> json) {
    if (json['bankList'] != null) {
      bankList = <BankList>[];
      json['bankList'].forEach((v) {
        bankList!.add(new BankList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bankList != null) {
      data['bankList'] = this.bankList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BankList {
  String? bankCode;
  String? bankName;

  BankList({this.bankCode, this.bankName});

  BankList.fromJson(Map<String, dynamic> json) {
    bankCode = json['bankCode'];
    bankName = json['bankName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bankCode'] = this.bankCode;
    data['bankName'] = this.bankName;
    return data;
  }
}

class SimpleUserModel {
  String? name;
  String? idNum;
  String? invited;

  SimpleUserModel({this.name, this.idNum, this.invited});

  SimpleUserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    idNum = json['idNum'];
    invited = json['invited'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['idNum'] = idNum;
    data['invited'] = invited;
    return data;
  }
}

// extension A String {

// }
