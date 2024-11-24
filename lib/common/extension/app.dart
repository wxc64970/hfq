class AppMessageResponseEntity {
  String? appName;
  String? appSize;
  String? appType;
  String? content;
  String? createTime;
  int? deviceType;
  int? id;
  int? isDelete;
  int? isForce;
  String? remarks;
  String? updateTime;
  String? url;
  String? version;

  AppMessageResponseEntity(
      {this.appName, this.appSize, this.appType, this.content, this.createTime, this.deviceType, this.id, this.isDelete, this.isForce, this.remarks, this.updateTime, this.url, this.version});

  AppMessageResponseEntity.fromJson(Map<String, dynamic> json) {
    appName = json['appName'];
    appSize = json['appSize'];
    appType = json['appType'];
    content = json['content'];
    createTime = json['createTime'];
    deviceType = json['deviceType'];
    id = json['id'];
    isDelete = json['isDelete'];
    isForce = json['isForce'];
    remarks = json['remarks'];
    updateTime = json['updateTime'];
    url = json['url'];
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appName'] = this.appName;
    data['appSize'] = this.appSize;
    data['appType'] = this.appType;
    data['content'] = this.content;
    data['createTime'] = this.createTime;
    data['deviceType'] = this.deviceType;
    data['id'] = this.id;
    data['isDelete'] = this.isDelete;
    data['isForce'] = this.isForce;
    data['remarks'] = this.remarks;
    data['updateTime'] = this.updateTime;
    data['url'] = this.url;
    data['version'] = this.version;
    return data;
  }
}
