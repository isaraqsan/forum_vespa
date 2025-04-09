class Auth {
  String? id;
  int? userId;
  int? partnerId;
  int? companyId;
  String? userLogin;
  String? userName;
  String? userLang;
  String? userTz;
  bool? isSystem;
  String? dbName;
  String? serverVersion;

  Auth({
    this.id,
    this.userId,
    this.partnerId,
    this.companyId,
    this.userLogin,
    this.userName,
    this.userLang,
    this.userTz,
    this.isSystem,
    this.dbName,
    this.serverVersion
  });

  Auth.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    partnerId = json['partnerId'];
    companyId = json['companyId'];
    userLogin = json['userLogin'];
    userName = json['userName'];
    userLang = json['userLang'];
    userTz = json['userTz'];
    isSystem = json['isSystem'];
    dbName = json['dbName'];
    serverVersion = json['serverVersion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['partnerId'] = this.partnerId;
    data['companyId'] = this.companyId;
    data['userLogin'] = this.userLogin;
    data['userName'] = this.userName;
    data['userLang'] = this.userLang;
    data['userTz'] = this.userTz;
    data['isSystem'] = this.isSystem;
    data['dbName'] = this.dbName;
    data['serverVersion'] = this.serverVersion;
    return data;
  }
}
