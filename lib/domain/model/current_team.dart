import 'dart:convert';
import 'dart:typed_data';

import 'package:vespa_app/core/util/core_function.dart';

class CurrentTeam {
  int? id;
  int? employeeId;
  String? employeeName;
  dynamic jobTitle;
  Uint8List? image;

  CurrentTeam({this.id, this.employeeId, this.employeeName, this.jobTitle, this.image});

  CurrentTeam.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employeeId = json['employee_id'];
    employeeName = json['employee_name'];
    jobTitle = json['job_title'];
    if (json['image'] is String) {
      image = base64.decode(json['image']);
    } else if (json['image'] is List<dynamic>) {
      image = CoreFunction.getImageBinary(json['image']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['employee_id'] = this.employeeId;
    data['employee_name'] = this.employeeName;
    data['job_title'] = this.jobTitle;
    data['image'] = this.image;
    return data;
  }
}
