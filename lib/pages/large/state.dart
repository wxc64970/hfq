import 'package:get/get.dart';
import 'package:youyi_wallet/common/values/constantsSize.dart';

class LargeState {
  // title
  final _title = "".obs;
  set title(value) => _title.value = value;
  get title => _title.value;

  final _progress = 0.obs;
  set progress(value) => _progress.value = value;
  get progress => _progress.value;

  List myloanList = [
    {"title": "全部", "icon": "assets/images/hfq_24.png"},
    {"title": "待完成", "icon": "assets/images/hfq_25.png"},
    {"title": "待提现", "icon": "assets/images/hfq_26.png"},
    {"title": "已放款", "icon": "assets/images/hfq_27.png"}
  ];
  List rankConfig = [
    {"title": "最快审核", "height": kSize50},
    {"title": "最大金额", "height": kSize10},
    {"title": "最低利息", "height": kSize80}
  ];
  List fastList = [
    {
      "productName": "优益分期",
      "productLogo": "https://img2.baidu.com/it/u=2112760689,2046669138&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
      "productTips": "额度高,利息低",
      "productMinAmount": "5",
      "productMaxAmount": "200000",
      'periods': '12',
      'monthlyInterest': "0.36",
      'loanDisbursementTime': "10分钟",
      "tags": ["最快审核", "最大金额", "最低利息"]
    },
    {
      "productName": "惠分期",
      "productLogo": "https://img2.baidu.com/it/u=2112760689,2046669138&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
      "productTips": "额度高,利息低",
      "productMinAmount": "12",
      "productMaxAmount": "200000",
      'periods': '24',
      'monthlyInterest': "0.36",
      'loanDisbursementTime': "10分钟",
      "tags": ["最快审核", "最大金额", "最低利息"]
    },
    {
      "productName": "天天分期",
      "productLogo": "https://img2.baidu.com/it/u=2112760689,2046669138&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
      "productTips": "额度高,利息低",
      "productMinAmount": "1",
      "productMaxAmount": "1000000",
      'periods': '12',
      'monthlyInterest': "0.36",
      'loanDisbursementTime': "10分钟",
      "tags": ["最快审核", "最大金额", "最低利息"]
    },
    {
      "productName": "天天分期",
      "productLogo": "https://img2.baidu.com/it/u=2112760689,2046669138&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
      "productTips": "额度高,利息低",
      "productMinAmount": "1",
      "productMaxAmount": "1000000",
      'periods': '12',
      'monthlyInterest': "0.36",
      'loanDisbursementTime': "10分钟",
      "tags": ["最快审核", "最大金额", "最低利息"]
    },
    {
      "productName": "天天分期",
      "productLogo": "https://img2.baidu.com/it/u=2112760689,2046669138&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
      "productTips": "额度高,利息低",
      "productMinAmount": "1",
      "productMaxAmount": "1000000",
      'periods': '12',
      'monthlyInterest': "0.36",
      'loanDisbursementTime': "10分钟",
      "tags": ["最快审核", "最大金额", "最低利息"]
    },
  ];
}

class LargeProductDataModel {
  String? accountNum;
  int? allMeet;
  String? applyTime;
  int? bjUser;
  String? businessCity;
  String? businessDate;
  String? businessScope;
  String? carProperty;
  String? channel;
  String? channelInfo;
  String? company;
  String? companyAdress;
  String? createtime;
  String? creditHistory;
  int? customerNum;
  String? deduction;
  EndTime? endTime;
  String? enterpriseFlow;
  String? enterpriseLicense;
  String? enterpriseType;
  String? enterpriseYear;
  String? fund;
  String? has;
  String? hasCredit;
  String? hasFund;
  String? hasJd;
  String? hasZfb;
  int? highAge;
  int? highAmount;
  String? hourse;
  String? houseProperty;
  int? id;
  int? isVip;
  int? keepAssets;
  String? lifeInsurance;
  String? link;
  int? loan;
  String? loanTerm;
  int? loanTime;
  String? loanUse;
  String? logo;
  int? lowAge;
  int? lowAmount;
  String? material;
  String? materialValue;
  int? maxMonth;
  String? microLoan;
  int? minMonth;
  int? monthRate;
  String? monthlyIncome;
  String? name;
  String? price;
  int? priceNum;
  int? productInfoStatus;
  String? professional;
  String? salaryType;
  int? sortUnitPrice;
  EndTime? startTime;
  String? statDate;
  int? status;
  String? sucessDeduction;
  String? tags;
  bool? thirdProductStatus;
  String? thirdTag;
  int? uid;
  String? upId;
  String? updatetime;
  String? wage;
  String? week;
  String? work;
  String? zhimaCredit;

  LargeProductDataModel(
      {this.accountNum,
      this.allMeet,
      this.applyTime,
      this.bjUser,
      this.businessCity,
      this.businessDate,
      this.businessScope,
      this.carProperty,
      this.channel,
      this.channelInfo,
      this.company,
      this.companyAdress,
      this.createtime,
      this.creditHistory,
      this.customerNum,
      this.deduction,
      this.endTime,
      this.enterpriseFlow,
      this.enterpriseLicense,
      this.enterpriseType,
      this.enterpriseYear,
      this.fund,
      this.has,
      this.hasCredit,
      this.hasFund,
      this.hasJd,
      this.hasZfb,
      this.highAge,
      this.highAmount,
      this.hourse,
      this.houseProperty,
      this.id,
      this.isVip,
      this.keepAssets,
      this.lifeInsurance,
      this.link,
      this.loan,
      this.loanTerm,
      this.loanTime,
      this.loanUse,
      this.logo,
      this.lowAge,
      this.lowAmount,
      this.material,
      this.materialValue,
      this.maxMonth,
      this.microLoan,
      this.minMonth,
      this.monthRate,
      this.monthlyIncome,
      this.name,
      this.price,
      this.priceNum,
      this.productInfoStatus,
      this.professional,
      this.salaryType,
      this.sortUnitPrice,
      this.startTime,
      this.statDate,
      this.status,
      this.sucessDeduction,
      this.tags,
      this.thirdProductStatus,
      this.thirdTag,
      this.uid,
      this.upId,
      this.updatetime,
      this.wage,
      this.week,
      this.work,
      this.zhimaCredit});

  LargeProductDataModel.fromJson(Map<String, dynamic> json) {
    accountNum = json['accountNum'];
    allMeet = json['allMeet'];
    applyTime = json['applyTime'];
    bjUser = json['bjUser'];
    businessCity = json['businessCity'];
    businessDate = json['businessDate'];
    businessScope = json['businessScope'];
    carProperty = json['carProperty'];
    channel = json['channel'];
    channelInfo = json['channelInfo'];
    company = json['company'];
    companyAdress = json['companyAdress'];
    createtime = json['createtime'];
    creditHistory = json['creditHistory'];
    customerNum = json['customerNum'];
    deduction = json['deduction'];
    endTime = json['endTime'] != null ? new EndTime.fromJson(json['endTime']) : null;
    enterpriseFlow = json['enterpriseFlow'];
    enterpriseLicense = json['enterpriseLicense'];
    enterpriseType = json['enterpriseType'];
    enterpriseYear = json['enterpriseYear'];
    fund = json['fund'];
    has = json['has'];
    hasCredit = json['hasCredit'];
    hasFund = json['hasFund'];
    hasJd = json['hasJd'];
    hasZfb = json['hasZfb'];
    highAge = json['highAge'];
    highAmount = json['highAmount'];
    hourse = json['hourse'];
    houseProperty = json['houseProperty'];
    id = json['id'];
    isVip = json['isVip'];
    keepAssets = json['keepAssets'];
    lifeInsurance = json['lifeInsurance'];
    link = json['link'];
    loan = json['loan'];
    loanTerm = json['loanTerm'];
    loanTime = json['loanTime'];
    loanUse = json['loanUse'];
    logo = json['logo'];
    lowAge = json['lowAge'];
    lowAmount = json['lowAmount'];
    material = json['material'];
    materialValue = json['materialValue'];
    maxMonth = json['maxMonth'];
    microLoan = json['microLoan'];
    minMonth = json['minMonth'];
    monthRate = json['monthRate'];
    monthlyIncome = json['monthlyIncome'];
    name = json['name'];
    price = json['price'];
    priceNum = json['priceNum'];
    productInfoStatus = json['productInfoStatus'];
    professional = json['professional'];
    salaryType = json['salaryType'];
    sortUnitPrice = json['sortUnitPrice'];
    startTime = json['startTime'] != null ? new EndTime.fromJson(json['startTime']) : null;
    statDate = json['statDate'];
    status = json['status'];
    sucessDeduction = json['sucessDeduction'];
    tags = json['tags'];
    thirdProductStatus = json['thirdProductStatus'];
    thirdTag = json['thirdTag'];
    uid = json['uid'];
    upId = json['upId'];
    updatetime = json['updatetime'];
    wage = json['wage'];
    week = json['week'];
    work = json['work'];
    zhimaCredit = json['zhimaCredit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accountNum'] = this.accountNum;
    data['allMeet'] = this.allMeet;
    data['applyTime'] = this.applyTime;
    data['bjUser'] = this.bjUser;
    data['businessCity'] = this.businessCity;
    data['businessDate'] = this.businessDate;
    data['businessScope'] = this.businessScope;
    data['carProperty'] = this.carProperty;
    data['channel'] = this.channel;
    data['channelInfo'] = this.channelInfo;
    data['company'] = this.company;
    data['companyAdress'] = this.companyAdress;
    data['createtime'] = this.createtime;
    data['creditHistory'] = this.creditHistory;
    data['customerNum'] = this.customerNum;
    data['deduction'] = this.deduction;
    if (this.endTime != null) {
      data['endTime'] = this.endTime!.toJson();
    }
    data['enterpriseFlow'] = this.enterpriseFlow;
    data['enterpriseLicense'] = this.enterpriseLicense;
    data['enterpriseType'] = this.enterpriseType;
    data['enterpriseYear'] = this.enterpriseYear;
    data['fund'] = this.fund;
    data['has'] = this.has;
    data['hasCredit'] = this.hasCredit;
    data['hasFund'] = this.hasFund;
    data['hasJd'] = this.hasJd;
    data['hasZfb'] = this.hasZfb;
    data['highAge'] = this.highAge;
    data['highAmount'] = this.highAmount;
    data['hourse'] = this.hourse;
    data['houseProperty'] = this.houseProperty;
    data['id'] = this.id;
    data['isVip'] = this.isVip;
    data['keepAssets'] = this.keepAssets;
    data['lifeInsurance'] = this.lifeInsurance;
    data['link'] = this.link;
    data['loan'] = this.loan;
    data['loanTerm'] = this.loanTerm;
    data['loanTime'] = this.loanTime;
    data['loanUse'] = this.loanUse;
    data['logo'] = this.logo;
    data['lowAge'] = this.lowAge;
    data['lowAmount'] = this.lowAmount;
    data['material'] = this.material;
    data['materialValue'] = this.materialValue;
    data['maxMonth'] = this.maxMonth;
    data['microLoan'] = this.microLoan;
    data['minMonth'] = this.minMonth;
    data['monthRate'] = this.monthRate;
    data['monthlyIncome'] = this.monthlyIncome;
    data['name'] = this.name;
    data['price'] = this.price;
    data['priceNum'] = this.priceNum;
    data['productInfoStatus'] = this.productInfoStatus;
    data['professional'] = this.professional;
    data['salaryType'] = this.salaryType;
    data['sortUnitPrice'] = this.sortUnitPrice;
    if (this.startTime != null) {
      data['startTime'] = this.startTime!.toJson();
    }
    data['statDate'] = this.statDate;
    data['status'] = this.status;
    data['sucessDeduction'] = this.sucessDeduction;
    data['tags'] = this.tags;
    data['thirdProductStatus'] = this.thirdProductStatus;
    data['thirdTag'] = this.thirdTag;
    data['uid'] = this.uid;
    data['upId'] = this.upId;
    data['updatetime'] = this.updatetime;
    data['wage'] = this.wage;
    data['week'] = this.week;
    data['work'] = this.work;
    data['zhimaCredit'] = this.zhimaCredit;
    return data;
  }
}

class EndTime {
  int? hour;
  int? minute;
  int? nano;
  int? second;

  EndTime({this.hour, this.minute, this.nano, this.second});

  EndTime.fromJson(Map<String, dynamic> json) {
    hour = json['hour'];
    minute = json['minute'];
    nano = json['nano'];
    second = json['second'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hour'] = this.hour;
    data['minute'] = this.minute;
    data['nano'] = this.nano;
    data['second'] = this.second;
    return data;
  }
}
