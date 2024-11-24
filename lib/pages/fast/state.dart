import 'package:get/get.dart';
import 'package:youyi_wallet/common/values/constantsSize.dart';

class FastState {
  // title
  final _title = "".obs;
  set title(value) => _title.value = value;
  get title => _title.value;

  // List myloanList = [
  //   {"title": "全部", "icon": "assets/images/hfq_24.png"},
  //   {"title": "待完成", "icon": "assets/images/hfq_25.png"},
  //   {"title": "待提现", "icon": "assets/images/hfq_26.png"},
  //   {"title": "已放款", "icon": "assets/images/hfq_27.png"}
  // ];
  List rankConfig = [
    {"title": "最快审核", "height": kSize50},
    {"title": "最大金额", "height": kSize10},
    {"title": "最低利息", "height": kSize110}
  ];
  List fastList = [
    {
      "productName": "优益分期",
      "productLogo":
          "https://img2.baidu.com/it/u=2112760689,2046669138&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
      "productTips": "额度高,利息低",
      "productMinAmount": "5",
      "productMaxAmount": "20",
      'periods': '12',
      'monthlyInterest': "0.36",
      'loanDisbursementTime': "10分钟",
    },
    {
      "productName": "惠分期",
      "productLogo":
          "https://img2.baidu.com/it/u=2112760689,2046669138&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
      "productTips": "额度高,利息低",
      "productMinAmount": "12",
      "productMaxAmount": "20",
      'periods': '24',
      'monthlyInterest': "0.36",
      'loanDisbursementTime': "10分钟",
    },
    {
      "productName": "天天分期",
      "productLogo":
          "https://img2.baidu.com/it/u=2112760689,2046669138&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
      "productTips": "额度高,利息低",
      "productMinAmount": "1",
      "productMaxAmount": "10",
      'periods': '12',
      'monthlyInterest': "0.36",
      'loanDisbursementTime': "10分钟",
    },
  ];
}

class FastProductDataModel {
  int? allMeet;
  String? amount;
  String? applyData;
  int? applyNum;
  String? applyProcess;
  String? applyRequire;
  int? applyStatus;
  int? bdStatus;
  int? bigProduct;
  int? caId;
  int? carProperty;
  String? channelInfo;
  List<ChannelProductVisitDTOS>? channelProductVisitDTOS;
  int? citiesId;
  String? citiesName;
  String? cp;
  String? crtTime;
  int? deleteFlag;
  String? description;
  String? exclude;
  int? fund;
  int? has;
  int? hasJd;
  String? highAmount;
  String? hotTag;
  int? houseProperty;
  int? id;
  int? isAd;
  int? isLd;
  int? isVip;
  String? jumpUrl;
  int? loanDay;
  int? loanTime;
  String? logo;
  String? lowAmount;
  int? maxAge;
  int? maxMonth;
  int? minAge;
  int? minMonth;
  String? mixUpName;
  double? monthRate;
  String? name;
  String? offTime;
  String? onTime;
  int? openStatus;
  int? ownerId;
  String? ownerName;
  String? phone;
  String? price;
  String? productTag;
  int? progress;
  String? province;
  int? rate;
  int? recommend;
  String? richDesc;
  int? score;
  String? serverAdmit;
  int? sort;
  int? status;
  int? study;
  String? successRate;
  String? tags;
  int? total;
  String? upTime;
  String? uvCpa;
  int? uvLimit;
  int? vipScore;
  String? week;
  int? xyStatus;
  int? zmScore;

  FastProductDataModel(
      {this.allMeet,
      this.amount,
      this.applyData,
      this.applyNum,
      this.applyProcess,
      this.applyRequire,
      this.applyStatus,
      this.bdStatus,
      this.bigProduct,
      this.caId,
      this.carProperty,
      this.channelInfo,
      this.channelProductVisitDTOS,
      this.citiesId,
      this.citiesName,
      this.cp,
      this.crtTime,
      this.deleteFlag,
      this.description,
      this.exclude,
      this.fund,
      this.has,
      this.hasJd,
      this.highAmount,
      this.hotTag,
      this.houseProperty,
      this.id,
      this.isAd,
      this.isLd,
      this.isVip,
      this.jumpUrl,
      this.loanDay,
      this.loanTime,
      this.logo,
      this.lowAmount,
      this.maxAge,
      this.maxMonth,
      this.minAge,
      this.minMonth,
      this.mixUpName,
      this.monthRate,
      this.name,
      this.offTime,
      this.onTime,
      this.openStatus,
      this.ownerId,
      this.ownerName,
      this.phone,
      this.price,
      this.productTag,
      this.progress,
      this.province,
      this.rate,
      this.recommend,
      this.richDesc,
      this.score,
      this.serverAdmit,
      this.sort,
      this.status,
      this.study,
      this.successRate,
      this.tags,
      this.total,
      this.upTime,
      this.uvCpa,
      this.uvLimit,
      this.vipScore,
      this.week,
      this.xyStatus,
      this.zmScore});

  FastProductDataModel.fromJson(Map<String, dynamic> json) {
    allMeet = json['allMeet'];
    amount = json['amount'];
    applyData = json['applyData'];
    applyNum = json['applyNum'];
    applyProcess = json['applyProcess'];
    applyRequire = json['applyRequire'];
    applyStatus = json['applyStatus'];
    bdStatus = json['bdStatus'];
    bigProduct = json['bigProduct'];
    caId = json['caId'];
    carProperty = json['carProperty'];
    channelInfo = json['channelInfo'];
    if (json['channelProductVisitDTOS'] != null) {
      channelProductVisitDTOS = <ChannelProductVisitDTOS>[];
      json['channelProductVisitDTOS'].forEach((v) {
        channelProductVisitDTOS!.add(new ChannelProductVisitDTOS.fromJson(v));
      });
    }
    citiesId = json['cities_id'];
    citiesName = json['cities_name'];
    cp = json['cp'];
    crtTime = json['crtTime'];
    deleteFlag = json['deleteFlag'];
    description = json['description'];
    exclude = json['exclude'];
    fund = json['fund'];
    has = json['has'];
    hasJd = json['hasJd'];
    highAmount = json['highAmount'];
    hotTag = json['hotTag'];
    houseProperty = json['houseProperty'];
    id = json['id'];
    isAd = json['isAd'];
    isLd = json['isLd'];
    isVip = json['isVip'];
    jumpUrl = json['jumpUrl'];
    loanDay = json['loanDay'];
    loanTime = json['loanTime'];
    logo = json['logo'];
    lowAmount = json['lowAmount'];
    maxAge = json['maxAge'];
    maxMonth = json['maxMonth'];
    minAge = json['minAge'];
    minMonth = json['minMonth'];
    mixUpName = json['mixUpName'];
    monthRate = json['monthRate'];
    name = json['name'];
    offTime = json['offTime'];
    onTime = json['onTime'];
    openStatus = json['openStatus'];
    ownerId = json['ownerId'];
    ownerName = json['ownerName'];
    phone = json['phone'];
    price = json['price'];
    productTag = json['productTag'];
    progress = json['progress'];
    province = json['province'];
    rate = json['rate'];
    recommend = json['recommend'];
    richDesc = json['richDesc'];
    score = json['score'];
    serverAdmit = json['serverAdmit'];
    sort = json['sort'];
    status = json['status'];
    study = json['study'];
    successRate = json['successRate'];
    tags = json['tags'];
    total = json['total'];
    upTime = json['upTime'];
    uvCpa = json['uvCpa'];
    uvLimit = json['uvLimit'];
    vipScore = json['vipScore'];
    week = json['week'];
    xyStatus = json['xyStatus'];
    zmScore = json['zmScore'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['allMeet'] = this.allMeet;
    data['amount'] = this.amount;
    data['applyData'] = this.applyData;
    data['applyNum'] = this.applyNum;
    data['applyProcess'] = this.applyProcess;
    data['applyRequire'] = this.applyRequire;
    data['applyStatus'] = this.applyStatus;
    data['bdStatus'] = this.bdStatus;
    data['bigProduct'] = this.bigProduct;
    data['caId'] = this.caId;
    data['carProperty'] = this.carProperty;
    data['channelInfo'] = this.channelInfo;
    if (this.channelProductVisitDTOS != null) {
      data['channelProductVisitDTOS'] =
          this.channelProductVisitDTOS!.map((v) => v.toJson()).toList();
    }
    data['cities_id'] = this.citiesId;
    data['cities_name'] = this.citiesName;
    data['cp'] = this.cp;
    data['crtTime'] = this.crtTime;
    data['deleteFlag'] = this.deleteFlag;
    data['description'] = this.description;
    data['exclude'] = this.exclude;
    data['fund'] = this.fund;
    data['has'] = this.has;
    data['hasJd'] = this.hasJd;
    data['highAmount'] = this.highAmount;
    data['hotTag'] = this.hotTag;
    data['houseProperty'] = this.houseProperty;
    data['id'] = this.id;
    data['isAd'] = this.isAd;
    data['isLd'] = this.isLd;
    data['isVip'] = this.isVip;
    data['jumpUrl'] = this.jumpUrl;
    data['loanDay'] = this.loanDay;
    data['loanTime'] = this.loanTime;
    data['logo'] = this.logo;
    data['lowAmount'] = this.lowAmount;
    data['maxAge'] = this.maxAge;
    data['maxMonth'] = this.maxMonth;
    data['minAge'] = this.minAge;
    data['minMonth'] = this.minMonth;
    data['mixUpName'] = this.mixUpName;
    data['monthRate'] = this.monthRate;
    data['name'] = this.name;
    data['offTime'] = this.offTime;
    data['onTime'] = this.onTime;
    data['openStatus'] = this.openStatus;
    data['ownerId'] = this.ownerId;
    data['ownerName'] = this.ownerName;
    data['phone'] = this.phone;
    data['price'] = this.price;
    data['productTag'] = this.productTag;
    data['progress'] = this.progress;
    data['province'] = this.province;
    data['rate'] = this.rate;
    data['recommend'] = this.recommend;
    data['richDesc'] = this.richDesc;
    data['score'] = this.score;
    data['serverAdmit'] = this.serverAdmit;
    data['sort'] = this.sort;
    data['status'] = this.status;
    data['study'] = this.study;
    data['successRate'] = this.successRate;
    data['tags'] = this.tags;
    data['total'] = this.total;
    data['upTime'] = this.upTime;
    data['uvCpa'] = this.uvCpa;
    data['uvLimit'] = this.uvLimit;
    data['vipScore'] = this.vipScore;
    data['week'] = this.week;
    data['xyStatus'] = this.xyStatus;
    data['zmScore'] = this.zmScore;
    return data;
  }
}

class ChannelProductVisitDTOS {
  int? channelId;
  String? channelName;
  int? productId;

  ChannelProductVisitDTOS({this.channelId, this.channelName, this.productId});

  ChannelProductVisitDTOS.fromJson(Map<String, dynamic> json) {
    channelId = json['channelId'];
    channelName = json['channelName'];
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['channelId'] = this.channelId;
    data['channelName'] = this.channelName;
    data['productId'] = this.productId;
    return data;
  }
}
