class RepaymentResponseModel {
  String? orderLoanAmount;
  String? orderResidueTotalAmount;
  String? orderShouldTotalAmount;
  List<RepayPlanEntityList>? repayPlanEntityList;
  String? totalInstallCnt;
  String? transDate;

  RepaymentResponseModel(
      {this.orderLoanAmount,
      this.orderResidueTotalAmount,
      this.orderShouldTotalAmount,
      this.repayPlanEntityList,
      this.totalInstallCnt,
      this.transDate});

  RepaymentResponseModel.fromJson(Map<String, dynamic> json) {
    orderLoanAmount = json['orderLoanAmount'];
    orderResidueTotalAmount = json['orderResidueTotalAmount'];
    orderShouldTotalAmount = json['orderShouldTotalAmount'];
    if (json['repayPlanEntityList'] != null) {
      repayPlanEntityList = <RepayPlanEntityList>[];
      json['repayPlanEntityList'].forEach((v) {
        repayPlanEntityList!.add(new RepayPlanEntityList.fromJson(v));
      });
    }
    totalInstallCnt = json['totalInstallCnt'];
    transDate = json['transDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderLoanAmount'] = this.orderLoanAmount;
    data['orderResidueTotalAmount'] = this.orderResidueTotalAmount;
    data['orderShouldTotalAmount'] = this.orderShouldTotalAmount;
    if (this.repayPlanEntityList != null) {
      data['repayPlanEntityList'] =
          this.repayPlanEntityList!.map((v) => v.toJson()).toList();
    }
    data['totalInstallCnt'] = this.totalInstallCnt;
    data['transDate'] = this.transDate;
    return data;
  }
}

class RepayPlanEntityList {
  String? createTime;
  int? id;
  String? installCnt;
  String? interest;
  String? lateRepayDate;
  String? merchant;
  String? orderNo;
  String? overdueFee;
  String? principal;
  String? reductionAmt;
  String? repayApplyId;
  String? repaymentDate;
  String? repaymentInterest;
  String? repaymentOverdueFee;
  String? repaymentPrincipal;
  String? repaymentServiceFee;
  String? repaymentTotalAmount;
  String? serviceFee;
  int? status;
  String? totalAmount;
  int? uid;

  RepayPlanEntityList(
      {this.createTime,
      this.id,
      this.installCnt,
      this.interest,
      this.lateRepayDate,
      this.merchant,
      this.orderNo,
      this.overdueFee,
      this.principal,
      this.reductionAmt,
      this.repayApplyId,
      this.repaymentDate,
      this.repaymentInterest,
      this.repaymentOverdueFee,
      this.repaymentPrincipal,
      this.repaymentServiceFee,
      this.repaymentTotalAmount,
      this.serviceFee,
      this.status,
      this.totalAmount,
      this.uid});

  RepayPlanEntityList.fromJson(Map<String, dynamic> json) {
    createTime = json['createTime'];
    id = json['id'];
    installCnt = json['installCnt'];
    interest = json['interest'];
    lateRepayDate = json['lateRepayDate'];
    merchant = json['merchant'];
    orderNo = json['orderNo'];
    overdueFee = json['overdueFee'];
    principal = json['principal'];
    reductionAmt = json['reductionAmt'];
    repayApplyId = json['repayApplyId'];
    repaymentDate = json['repaymentDate'];
    repaymentInterest = json['repaymentInterest'];
    repaymentOverdueFee = json['repaymentOverdueFee'];
    repaymentPrincipal = json['repaymentPrincipal'];
    repaymentServiceFee = json['repaymentServiceFee'];
    repaymentTotalAmount = json['repaymentTotalAmount'];
    serviceFee = json['serviceFee'];
    status = json['status'];
    totalAmount = json['totalAmount'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createTime'] = this.createTime;
    data['id'] = this.id;
    data['installCnt'] = this.installCnt;
    data['interest'] = this.interest;
    data['lateRepayDate'] = this.lateRepayDate;
    data['merchant'] = this.merchant;
    data['orderNo'] = this.orderNo;
    data['overdueFee'] = this.overdueFee;
    data['principal'] = this.principal;
    data['reductionAmt'] = this.reductionAmt;
    data['repayApplyId'] = this.repayApplyId;
    data['repaymentDate'] = this.repaymentDate;
    data['repaymentInterest'] = this.repaymentInterest;
    data['repaymentOverdueFee'] = this.repaymentOverdueFee;
    data['repaymentPrincipal'] = this.repaymentPrincipal;
    data['repaymentServiceFee'] = this.repaymentServiceFee;
    data['repaymentTotalAmount'] = this.repaymentTotalAmount;
    data['serviceFee'] = this.serviceFee;
    data['status'] = this.status;
    data['totalAmount'] = this.totalAmount;
    data['uid'] = this.uid;
    return data;
  }
}

class RepaymentRequstModel {
  String? merchant;
  RepayPlanQueryRequest? repayPlanQueryRequest;

  RepaymentRequstModel({this.merchant, this.repayPlanQueryRequest});

  RepaymentRequstModel.fromJson(Map<String, dynamic> json) {
    merchant = json['merchant'];
    repayPlanQueryRequest = json['repayPlanQueryRequest'] != null
        ? new RepayPlanQueryRequest.fromJson(json['repayPlanQueryRequest'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['merchant'] = this.merchant;
    if (this.repayPlanQueryRequest != null) {
      data['repayPlanQueryRequest'] = this.repayPlanQueryRequest!.toJson();
    }
    return data;
  }
}

class RepayPlanQueryRequest {
  String? orderNo;
  String? userNo;

  RepayPlanQueryRequest({this.orderNo, this.userNo});

  RepayPlanQueryRequest.fromJson(Map<String, dynamic> json) {
    orderNo = json['orderNo'];
    userNo = json['userNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderNo'] = this.orderNo;
    data['userNo'] = this.userNo;
    return data;
  }
}
