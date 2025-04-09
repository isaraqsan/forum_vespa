import 'package:vespa_app/core/app/enum.dart';

import 'meta.dart';

class ResponseApi2 {
  Meta? meta;
  dynamic status;
  String? message;
  dynamic data;
  ApiResult apiResult = ApiResult.Success;

  ResponseApi2({this.status, this.message, this.data, this.apiResult = ApiResult.Success});

  ResponseApi2.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    data['status'] = status;
    data['message'] = message;
    data['data'] = this.data;
    return data;
  }
}
