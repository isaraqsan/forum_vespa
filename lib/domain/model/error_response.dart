class ErrorResponse {
  String? code;
  String? message;
  Data? data;
  String? errors;

  ErrorResponse({this.code, this.message, this.data, this.errors});

  ErrorResponse.fromJson(value) {
    if (value is String) {
      message = "Hubungi Admin";
    } else {
      Map<String, dynamic> json = value;
      code = json['code'];
      message = json['message'];
      data = json['data'] != null ? new Data.fromJson(json['data']) : null;
      if (json['errors'] != null) {
        Map<String, dynamic> dataError = json['errors'];
        if (dataError.isNotEmpty) {
          var firstData = dataError.values.first;
          if (firstData is List) {
            errors = firstData[0];
          } else if (firstData is String) {
            errors = firstData;
          } else {
            errors = "Terjadi kesalahan";
          }
        }
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? name;

  Data({this.name});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}
