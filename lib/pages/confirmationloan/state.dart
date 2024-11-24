import 'package:get/get.dart';

class ConfirmationloanState {
  // title
  final _title = "".obs;
  set title(value) => _title.value = value;
  get title => _title.value;

  final _maxAmount = 10000.obs;
  set maxAmount(value) => _maxAmount.value = value;
  get maxAmount => _maxAmount.value;

  final _amount = 0.obs;
  set amount(value) => _amount.value = value;
  get amount => _amount.value;

  final _actualAmount = 10000.obs;
  set actualAmount(value) => _actualAmount.value = value;
  get actualAmount => _actualAmount.value;

  final _amountSaved = 300.obs;
  set amountSaved(value) => _amountSaved.value = value;
  get amountSaved => _amountSaved.value;

  final RxDouble _monthRepaymentAmount = 0.0.obs;
  double get monthRepaymentAmount => _monthRepaymentAmount.value;
  set monthRepaymentAmount(value) => _monthRepaymentAmount.value = value;

  RxInt timeLength = 12.obs; //借款期数
  double scaleAmount = 379.0; //优惠金额

  RxBool hasBank = false.obs;
  RxString bankName = "中国银行".obs;
  RxString bankNum = "34234".obs;
  String bankNumAll = "";
}

///贷款参数返回Model
class ComfireLoanModel {
  List<InstallCntInfoResqs>? installCntInfoResqs;
  String? maxLoanAmount;
  String? minLoanAmount;
  List<UserBankInfoEntities>? userBankInfoEntities;

  ComfireLoanModel(
      {this.installCntInfoResqs,
      this.maxLoanAmount,
      this.minLoanAmount,
      this.userBankInfoEntities});

  ComfireLoanModel.fromJson(Map<String, dynamic> json) {
    if (json['installCntInfoResqs'] != null) {
      installCntInfoResqs = <InstallCntInfoResqs>[];
      json['installCntInfoResqs'].forEach((v) {
        installCntInfoResqs!.add(new InstallCntInfoResqs.fromJson(v));
      });
    }
    maxLoanAmount = json['maxLoanAmount'];
    minLoanAmount = json['minLoanAmount'];
    if (json['userBankInfoEntities'] != null) {
      userBankInfoEntities = <UserBankInfoEntities>[];
      json['userBankInfoEntities'].forEach((v) {
        userBankInfoEntities!.add(new UserBankInfoEntities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.installCntInfoResqs != null) {
      data['installCntInfoResqs'] =
          this.installCntInfoResqs!.map((v) => v.toJson()).toList();
    }
    data['maxLoanAmount'] = this.maxLoanAmount;
    data['minLoanAmount'] = this.minLoanAmount;
    if (this.userBankInfoEntities != null) {
      data['userBankInfoEntities'] =
          this.userBankInfoEntities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InstallCntInfoResqs {
  String? installCnt;
  String? interestDateRate;

  InstallCntInfoResqs({this.installCnt, this.interestDateRate});

  InstallCntInfoResqs.fromJson(Map<String, dynamic> json) {
    installCnt = json['installCnt'];
    interestDateRate = json['interestDateRate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['installCnt'] = this.installCnt;
    data['interestDateRate'] = this.interestDateRate;
    return data;
  }
}

class UserBankInfoEntities {
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

  UserBankInfoEntities(
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

  UserBankInfoEntities.fromJson(Map<String, dynamic> json) {
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

///贷款试算请求Model
class LoanTrialGetModel {
  String? loanAmount;
  String? merchant;
  int? termNum;

  LoanTrialGetModel({this.loanAmount, this.merchant, this.termNum});

  LoanTrialGetModel.fromJson(Map<String, dynamic> json) {
    loanAmount = json['loanAmount'];
    merchant = json['merchant'];
    termNum = json['termNum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loanAmount'] = this.loanAmount;
    data['merchant'] = this.merchant;
    data['termNum'] = this.termNum;
    return data;
  }
}

///贷款试算Model
class LoanTrialListModel {
  String? orderInterest;
  String? orderPrincipal;
  String? orderServiceFee;
  String? orderTotalAmount;
  String? orderYearRate;
  List<PlanItemResqs>? planItemResqs;

  LoanTrialListModel(
      {this.orderInterest,
      this.orderPrincipal,
      this.orderServiceFee,
      this.orderTotalAmount,
      this.orderYearRate,
      this.planItemResqs});

  LoanTrialListModel.fromJson(Map<String, dynamic> json) {
    orderInterest = json['orderInterest'];
    orderPrincipal = json['orderPrincipal'];
    orderServiceFee = json['orderServiceFee'];
    orderTotalAmount = json['orderTotalAmount'];
    orderYearRate = json['orderYearRate'];
    if (json['planItemResqs'] != null) {
      planItemResqs = <PlanItemResqs>[];
      json['planItemResqs'].forEach((v) {
        planItemResqs!.add(new PlanItemResqs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderInterest'] = this.orderInterest;
    data['orderPrincipal'] = this.orderPrincipal;
    data['orderServiceFee'] = this.orderServiceFee;
    data['orderTotalAmount'] = this.orderTotalAmount;
    data['orderYearRate'] = this.orderYearRate;
    if (this.planItemResqs != null) {
      data['planItemResqs'] =
          this.planItemResqs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PlanItemResqs {
  int? installCnt;
  String? interest;
  String? lateRepayDate;
  String? principal;
  String? serviceFee;
  String? totalAmount;

  PlanItemResqs(
      {this.installCnt,
      this.interest,
      this.lateRepayDate,
      this.principal,
      this.serviceFee,
      this.totalAmount});

  PlanItemResqs.fromJson(Map<String, dynamic> json) {
    installCnt = json['installCnt'];
    interest = json['interest'];
    lateRepayDate = json['lateRepayDate'];
    principal = json['principal'];
    serviceFee = json['serviceFee'];
    totalAmount = json['totalAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['installCnt'] = this.installCnt;
    data['interest'] = this.interest;
    data['lateRepayDate'] = this.lateRepayDate;
    data['principal'] = this.principal;
    data['serviceFee'] = this.serviceFee;
    data['totalAmount'] = this.totalAmount;
    return data;
  }
}
