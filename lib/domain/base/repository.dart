import 'package:get/get.dart';
import 'package:vespa_app/core/service/database_service.dart';
import 'package:vespa_app/core/service/dio_service.dart';
export 'dart:convert';
export 'package:vespa_app/core/app/endpoint.dart';
export 'package:vespa_app/domain/model/base_request.dart';

class Repository {
  final dioService = Get.find<DioService>();
  final databaseService = Get.find<DatabaseService>();

  bool validateCodeResponse(int? code) {
    if (code != null) {
      if (code >= 200 && code <= 299) {
        return true;
      }
    }
    return false;
  }
  bool validateMessageResponse(String? code) {
    if (code != null) {
      if (code == "success" || code == "Success") {
        return true;
      }
    }
    return false;
  }
}
