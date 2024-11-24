class ProfileEntity {
  CustomerEntity? customerEntity;
  DkEnvironmentInfo? dkEnvironmentInfo;
  DkTerminalInfo? dkTerminalInfo;

  ProfileEntity({this.customerEntity, this.dkEnvironmentInfo, this.dkTerminalInfo});

  ProfileEntity.fromJson(Map<String, dynamic> json) {
    customerEntity = json['customerEntity'] != null ? new CustomerEntity.fromJson(json['customerEntity']) : null;
    dkEnvironmentInfo = json['dkEnvironmentInfo'] != null ? new DkEnvironmentInfo.fromJson(json['dkEnvironmentInfo']) : null;
    dkTerminalInfo = json['dkTerminalInfo'] != null ? new DkTerminalInfo.fromJson(json['dkTerminalInfo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customerEntity != null) {
      data['customerEntity'] = this.customerEntity!.toJson();
    }
    if (this.dkEnvironmentInfo != null) {
      data['dkEnvironmentInfo'] = this.dkEnvironmentInfo!.toJson();
    }
    if (this.dkTerminalInfo != null) {
      data['dkTerminalInfo'] = this.dkTerminalInfo!.toJson();
    }
    return data;
  }
}

class CustomerEntity {
  String? address;
  int? age;
  String? backFile;
  int? bdStatus;
  int? carProperty;
  String? channel;
  String? city;
  String? cityId;
  String? client;
  String? companyAddress;
  String? companyAddressCity;
  String? companyAddressProvince;
  String? companyAddressSection;
  String? companyMobile;
  String? companyName;
  String? contactName1;
  String? contactName2;
  String? contactRole1;
  String? contactRole2;
  String? contactTel1;
  String? contactTel2;
  String? createTime;
  String? degree;
  int? education;
  String? email;
  int? finish;
  String? frontFile;
  int? fund;
  int? has;
  String? homeAddress;
  String? homeCity;
  String? homeDistrict;
  String? homeProvince;
  int? houseProperty;
  int? id;
  String? idAddress;
  String? idNum;
  String? idPeriod;
  String? invite;
  String? issuedBy;
  int? loan;
  int? loanAmount;
  int? loanReviewStatus;
  int? loanStatus;
  int? loanTerm;
  int? maritalStatus;
  int? monthlyIncome;
  String? name;
  String? nation;
  String? natureFile;
  String? overdueDate;
  String? phone;
  int? professional;
  int? relationStatus;
  int? repayStatus;
  int? sex;
  int? uid;
  String? updateTime;
  String? userNo;
  String? validDate;
  int? workTime;
  int? zhiMa;

  CustomerEntity(
      {this.address,
      this.age,
      this.backFile,
      this.bdStatus,
      this.carProperty,
      this.channel,
      this.city,
      this.cityId,
      this.client,
      this.companyAddress,
      this.companyAddressCity,
      this.companyAddressProvince,
      this.companyAddressSection,
      this.companyMobile,
      this.companyName,
      this.contactName1,
      this.contactName2,
      this.contactRole1,
      this.contactRole2,
      this.contactTel1,
      this.contactTel2,
      this.createTime,
      this.degree,
      this.education,
      this.email,
      this.finish,
      this.frontFile,
      this.fund,
      this.has,
      this.homeAddress,
      this.homeCity,
      this.homeDistrict,
      this.homeProvince,
      this.houseProperty,
      this.id,
      this.idAddress,
      this.idNum,
      this.idPeriod,
      this.invite,
      this.issuedBy,
      this.loan,
      this.loanAmount,
      this.loanReviewStatus,
      this.loanStatus,
      this.loanTerm,
      this.maritalStatus,
      this.monthlyIncome,
      this.name,
      this.nation,
      this.natureFile,
      this.overdueDate,
      this.phone,
      this.professional,
      this.relationStatus,
      this.repayStatus,
      this.sex,
      this.uid,
      this.updateTime,
      this.userNo,
      this.validDate,
      this.workTime,
      this.zhiMa});

  CustomerEntity.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    age = json['age'];
    backFile = json['backFile'];
    bdStatus = json['bdStatus'];
    carProperty = json['carProperty'];
    channel = json['channel'];
    city = json['city'];
    cityId = json['cityId'];
    client = json['client'];
    companyAddress = json['companyAddress'];
    companyAddressCity = json['companyAddressCity'];
    companyAddressProvince = json['companyAddressProvince'];
    companyAddressSection = json['companyAddressSection'];
    companyMobile = json['companyMobile'];
    companyName = json['companyName'];
    contactName1 = json['contactName1'];
    contactName2 = json['contactName2'];
    contactRole1 = json['contactRole1'];
    contactRole2 = json['contactRole2'];
    contactTel1 = json['contactTel1'];
    contactTel2 = json['contactTel2'];
    createTime = json['createTime'];
    degree = json['degree'];
    education = json['education'];
    email = json['email'];
    finish = json['finish'];
    frontFile = json['frontFile'];
    fund = json['fund'];
    has = json['has'];
    homeAddress = json['homeAddress'];
    homeCity = json['homeCity'];
    homeDistrict = json['homeDistrict'];
    homeProvince = json['homeProvince'];
    houseProperty = json['houseProperty'];
    id = json['id'];
    idAddress = json['idAddress'];
    idNum = json['idNum'];
    idPeriod = json['idPeriod'];
    invite = json['invite'];
    issuedBy = json['issuedBy'];
    loan = json['loan'];
    loanAmount = json['loanAmount'];
    loanReviewStatus = json['loanReviewStatus'];
    loanStatus = json['loanStatus'];
    loanTerm = json['loanTerm'];
    maritalStatus = json['maritalStatus'];
    monthlyIncome = json['monthlyIncome'];
    name = json['name'];
    nation = json['nation'];
    natureFile = json['natureFile'];
    overdueDate = json['overdueDate'];
    phone = json['phone'];
    professional = json['professional'];
    relationStatus = json['relationStatus'];
    repayStatus = json['repayStatus'];
    sex = json['sex'];
    uid = json['uid'];
    updateTime = json['updateTime'];
    userNo = json['userNo'];
    validDate = json['validDate'];
    workTime = json['workTime'];
    zhiMa = json['zhiMa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['age'] = this.age;
    data['backFile'] = this.backFile;
    data['bdStatus'] = this.bdStatus;
    data['carProperty'] = this.carProperty;
    data['channel'] = this.channel;
    data['city'] = this.city;
    data['cityId'] = this.cityId;
    data['client'] = this.client;
    data['companyAddress'] = this.companyAddress;
    data['companyAddressCity'] = this.companyAddressCity;
    data['companyAddressProvince'] = this.companyAddressProvince;
    data['companyAddressSection'] = this.companyAddressSection;
    data['companyMobile'] = this.companyMobile;
    data['companyName'] = this.companyName;
    data['contactName1'] = this.contactName1;
    data['contactName2'] = this.contactName2;
    data['contactRole1'] = this.contactRole1;
    data['contactRole2'] = this.contactRole2;
    data['contactTel1'] = this.contactTel1;
    data['contactTel2'] = this.contactTel2;
    data['createTime'] = this.createTime;
    data['degree'] = this.degree;
    data['education'] = this.education;
    data['email'] = this.email;
    data['finish'] = this.finish;
    data['frontFile'] = this.frontFile;
    data['fund'] = this.fund;
    data['has'] = this.has;
    data['homeAddress'] = this.homeAddress;
    data['homeCity'] = this.homeCity;
    data['homeDistrict'] = this.homeDistrict;
    data['homeProvince'] = this.homeProvince;
    data['houseProperty'] = this.houseProperty;
    data['id'] = this.id;
    data['idAddress'] = this.idAddress;
    data['idNum'] = this.idNum;
    data['idPeriod'] = this.idPeriod;
    data['invite'] = this.invite;
    data['issuedBy'] = this.issuedBy;
    data['loan'] = this.loan;
    data['loanAmount'] = this.loanAmount;
    data['loanReviewStatus'] = this.loanReviewStatus;
    data['loanStatus'] = this.loanStatus;
    data['loanTerm'] = this.loanTerm;
    data['maritalStatus'] = this.maritalStatus;
    data['monthlyIncome'] = this.monthlyIncome;
    data['name'] = this.name;
    data['nation'] = this.nation;
    data['natureFile'] = this.natureFile;
    data['overdueDate'] = this.overdueDate;
    data['phone'] = this.phone;
    data['professional'] = this.professional;
    data['relationStatus'] = this.relationStatus;
    data['repayStatus'] = this.repayStatus;
    data['sex'] = this.sex;
    data['uid'] = this.uid;
    data['updateTime'] = this.updateTime;
    data['userNo'] = this.userNo;
    data['validDate'] = this.validDate;
    data['workTime'] = this.workTime;
    data['zhiMa'] = this.zhiMa;
    return data;
  }
}

class DkEnvironmentInfo {
  String? createTime;
  int? id;
  String? intranetIp;
  String? ip;
  String? latitude;
  int? locationServices;
  String? longitude;
  String? networkType;
  String? phoneOperator;
  String? proxyIp;
  int? uid;

  DkEnvironmentInfo({this.createTime, this.id, this.intranetIp, this.ip, this.latitude, this.locationServices, this.longitude, this.networkType, this.phoneOperator, this.proxyIp, this.uid});

  DkEnvironmentInfo.fromJson(Map<String, dynamic> json) {
    createTime = json['createTime'];
    id = json['id'];
    intranetIp = json['intranetIp'];
    ip = json['ip'];
    latitude = json['latitude'];
    locationServices = json['locationServices'];
    longitude = json['longitude'];
    networkType = json['networkType'];
    phoneOperator = json['phoneOperator'];
    proxyIp = json['proxyIp'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createTime'] = this.createTime;
    data['id'] = this.id;
    data['intranetIp'] = this.intranetIp;
    data['ip'] = this.ip;
    data['latitude'] = this.latitude;
    data['locationServices'] = this.locationServices;
    data['longitude'] = this.longitude;
    data['networkType'] = this.networkType;
    data['phoneOperator'] = this.phoneOperator;
    data['proxyIp'] = this.proxyIp;
    data['uid'] = this.uid;
    return data;
  }
}

class DkTerminalInfo {
  String? androidId;
  String? appChannel;
  String? appVersion;
  String? batteryLevel;
  String? brand;
  int? cameraPresent;
  String? cpuAbi;
  String? cpuHardware;
  String? cpuSpeed;
  String? cpuType;
  String? createTime;
  String? deviceType;
  String? freeDiskStorage;
  String? hostName;
  String? iccid;
  int? id;
  String? idfa;
  String? imei;
  String? imsi;
  int? isEmulator;
  String? mac;
  String? mobileNo1;
  String? mobileNo2;
  String? phoneMarker;
  String? phoneModel;
  String? productModel;
  String? resolution;
  String? roDevice;
  String? roModel;
  String? roName;
  int? rootAccess;
  String? serialNo;
  String? systemLang;
  String? systemVersion;
  String? terminalType;
  String? totalMemory;
  String? totalStorage;
  String? ua;
  int? uid;

  DkTerminalInfo(
      {this.androidId,
      this.appChannel,
      this.appVersion,
      this.batteryLevel,
      this.brand,
      this.cameraPresent,
      this.cpuAbi,
      this.cpuHardware,
      this.cpuSpeed,
      this.cpuType,
      this.createTime,
      this.deviceType,
      this.freeDiskStorage,
      this.hostName,
      this.iccid,
      this.id,
      this.idfa,
      this.imei,
      this.imsi,
      this.isEmulator,
      this.mac,
      this.mobileNo1,
      this.mobileNo2,
      this.phoneMarker,
      this.phoneModel,
      this.productModel,
      this.resolution,
      this.roDevice,
      this.roModel,
      this.roName,
      this.rootAccess,
      this.serialNo,
      this.systemLang,
      this.systemVersion,
      this.terminalType,
      this.totalMemory,
      this.totalStorage,
      this.ua,
      this.uid});

  DkTerminalInfo.fromJson(Map<String, dynamic> json) {
    androidId = json['androidId'];
    appChannel = json['appChannel'];
    appVersion = json['appVersion'];
    batteryLevel = json['batteryLevel'];
    brand = json['brand'];
    cameraPresent = json['cameraPresent'];
    cpuAbi = json['cpuAbi'];
    cpuHardware = json['cpuHardware'];
    cpuSpeed = json['cpuSpeed'];
    cpuType = json['cpuType'];
    createTime = json['createTime'];
    deviceType = json['deviceType'];
    freeDiskStorage = json['freeDiskStorage'];
    hostName = json['hostName'];
    iccid = json['iccid'];
    id = json['id'];
    idfa = json['idfa'];
    imei = json['imei'];
    imsi = json['imsi'];
    isEmulator = json['isEmulator'];
    mac = json['mac'];
    mobileNo1 = json['mobileNo1'];
    mobileNo2 = json['mobileNo2'];
    phoneMarker = json['phoneMarker'];
    phoneModel = json['phoneModel'];
    productModel = json['productModel'];
    resolution = json['resolution'];
    roDevice = json['roDevice'];
    roModel = json['roModel'];
    roName = json['roName'];
    rootAccess = json['rootAccess'];
    serialNo = json['serialNo'];
    systemLang = json['systemLang'];
    systemVersion = json['systemVersion'];
    terminalType = json['terminalType'];
    totalMemory = json['totalMemory'];
    totalStorage = json['totalStorage'];
    ua = json['ua'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['androidId'] = this.androidId;
    data['appChannel'] = this.appChannel;
    data['appVersion'] = this.appVersion;
    data['batteryLevel'] = this.batteryLevel;
    data['brand'] = this.brand;
    data['cameraPresent'] = this.cameraPresent;
    data['cpuAbi'] = this.cpuAbi;
    data['cpuHardware'] = this.cpuHardware;
    data['cpuSpeed'] = this.cpuSpeed;
    data['cpuType'] = this.cpuType;
    data['createTime'] = this.createTime;
    data['deviceType'] = this.deviceType;
    data['freeDiskStorage'] = this.freeDiskStorage;
    data['hostName'] = this.hostName;
    data['iccid'] = this.iccid;
    data['id'] = this.id;
    data['idfa'] = this.idfa;
    data['imei'] = this.imei;
    data['imsi'] = this.imsi;
    data['isEmulator'] = this.isEmulator;
    data['mac'] = this.mac;
    data['mobileNo1'] = this.mobileNo1;
    data['mobileNo2'] = this.mobileNo2;
    data['phoneMarker'] = this.phoneMarker;
    data['phoneModel'] = this.phoneModel;
    data['productModel'] = this.productModel;
    data['resolution'] = this.resolution;
    data['roDevice'] = this.roDevice;
    data['roModel'] = this.roModel;
    data['roName'] = this.roName;
    data['rootAccess'] = this.rootAccess;
    data['serialNo'] = this.serialNo;
    data['systemLang'] = this.systemLang;
    data['systemVersion'] = this.systemVersion;
    data['terminalType'] = this.terminalType;
    data['totalMemory'] = this.totalMemory;
    data['totalStorage'] = this.totalStorage;
    data['ua'] = this.ua;
    data['uid'] = this.uid;
    return data;
  }
}

class UserStatusResponseEntity {
  int? status;

  UserStatusResponseEntity({this.status});

  UserStatusResponseEntity.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    return data;
  }
}

class CreditApplyResponseEntity {
  String? createTime;
  String? creditLimit;
  String? creditLimitEffectDate;
  String? creditLimitExpireDate;
  String? creditStatus;
  String? creditTime;
  int? id;
  String? merchant;
  int? uid;

  CreditApplyResponseEntity({this.createTime, this.creditLimit, this.creditLimitEffectDate, this.creditLimitExpireDate, this.creditStatus, this.creditTime, this.id, this.merchant, this.uid});

  CreditApplyResponseEntity.fromJson(Map<String, dynamic> json) {
    createTime = json['createTime'];
    creditLimit = json['creditLimit'];
    creditLimitEffectDate = json['creditLimitEffectDate'];
    creditLimitExpireDate = json['creditLimitExpireDate'];
    creditStatus = json['creditStatus'];
    creditTime = json['creditTime'];
    id = json['id'];
    merchant = json['merchant'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createTime'] = this.createTime;
    data['creditLimit'] = this.creditLimit;
    data['creditLimitEffectDate'] = this.creditLimitEffectDate;
    data['creditLimitExpireDate'] = this.creditLimitExpireDate;
    data['creditStatus'] = this.creditStatus;
    data['creditTime'] = this.creditTime;
    data['id'] = this.id;
    data['merchant'] = this.merchant;
    data['uid'] = this.uid;
    return data;
  }
}

class AuditAccountResponseEntity {
  String? address;
  String? backFile;
  String? frontFile;
  String? idNum;
  String? issuedBy;
  String? name;
  String? validDate;

  AuditAccountResponseEntity({this.address, this.backFile, this.frontFile, this.idNum, this.issuedBy, this.name, this.validDate});

  AuditAccountResponseEntity.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    backFile = json['backFile'];
    frontFile = json['frontFile'];
    idNum = json['idNum'];
    issuedBy = json['issuedBy'];
    name = json['name'];
    validDate = json['validDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['backFile'] = this.backFile;
    data['frontFile'] = this.frontFile;
    data['idNum'] = this.idNum;
    data['issuedBy'] = this.issuedBy;
    data['name'] = this.name;
    data['validDate'] = this.validDate;
    return data;
  }
}
