import 'dart:convert';

import 'package:get/get.dart';
import 'package:vespa_app/core/app/database_key.dart';
import 'package:vespa_app/core/service/database_service.dart';
import 'package:vespa_app/presentations/profile/model/profile_entity.dart';

class AuthService {
  static final AuthService _singleton = AuthService._internal();

  factory AuthService() {
    return _singleton;
  }

  AuthService._internal();

  final DatabaseService _databaseService = Get.find<DatabaseService>();

  static bool _isLogin = false;
  static late String _token;
  static late String _name;
  static late double _latitude;
  static late double _longitude;

  static bool get isLogin => _isLogin;
  static String get token => _token;
  static String get name => _name;
  static double get latitude => _latitude;
  static double get longitude => _longitude;

  static setLogin(bool value) => _isLogin = value;

  setToken(String value) async {
    _token = value;
    _isLogin = true;
    await _databaseService.write(Databasekey.token, value);
  }

  setName(value) => _name = value;

  static setLatitudeLongitude(double valueLatitude, double valueLongitude) {
    _latitude = valueLatitude;
    _longitude = valueLongitude;
  }

  getToken() {
    if (_databaseService.hasData(Databasekey.token) && _databaseService.hasData(Databasekey.profile)) {
      var token = _databaseService.read(Databasekey.token);
      var profile = ProfileEntity.fromJson(jsonDecode(jsonEncode(_databaseService.read(Databasekey.profile)!)));
      if (token != null && profile.empName != null) {
        _token = token;
        _name = profile.empName ?? "";
        _isLogin = true;
      }
    } else {
      _token = "";
      _isLogin = false;
    }
  }

  deleteToken() async {
    _databaseService.remove(Databasekey.token);
    _token = "";
    _isLogin = false;
  }

  static deleteName() => _name = "";

  static clear() {
    _isLogin = false;
    _token = "";
    _name = "";
    _latitude = 0.0;
    _longitude = 0.0;
  }
}
