import 'dart:convert';
import 'dart:typed_data';

import 'package:vespa_app/core/util/core_function.dart';

class User {
  int? id;
  List<dynamic>? companyId;
  String? name;
  List<dynamic>? jobId;
  String? email;
  dynamic mobilePhone;
  String? jobTitle;
  Uint8List? image256;

  User({this.id, this.companyId, this.name, this.jobId, this.jobTitle, this.image256, this.email, this.mobilePhone, required albumId, required title, required url});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'].cast<dynamic>();
    name = json['name'];
    if (json['job_id'] is bool) {
      jobId = [];
    } else {
      jobId = json['job_id'].cast<dynamic>();
    }
    if (json['job_title'] is String) jobTitle = json['job_title'];
    if (json['image_256'] is String) {
      image256 = base64.decode(json['image_256']);
    } else if (json['image_256'] is List<dynamic>) {
      image256 = CoreFunction.getImageBinary(json['image_256']);
    }
    email = json['email'];
    mobilePhone = json['mobile_phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company_id'] = this.companyId;
    data['name'] = this.name;
    data['job_id'] = this.jobId;
    data['job_title'] = this.jobTitle;
    data['image_256'] = this.image256;
    data['email'] = this.email;
    data['mobile_phone'] = this.mobilePhone;
    return data;
  }
}
