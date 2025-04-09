import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:vespa_app/core/app/constant.dart';

class EnvService extends GetxService {
  Future<EnvService> init() async {
    await dotenv.load(fileName: Constant.env);
    return this;
  }

  static bool isProduction = dotenv.env[Constant.IS_PRODUCTION] == "true";
  static bool debug = dotenv.env[Constant.DEBUG] == "true";
  static String baseUrlProduction = dotenv.env[Constant.BASE_URL_PRODUCTION] ?? "";
  static String baseUrlStagging = dotenv.env[Constant.BASE_URL_STAGGING] ?? "";
  static String baseUrlAbsence = dotenv.env[Constant.BASE_URL_ABSENCE] ?? "";
  static String tokenPhoto = dotenv.env[Constant.TOKEN_PHOTO] ?? "";

  static String oneSignalAppId = dotenv.env[Constant.KEY_APPID_ONESIGNAL] ?? "";
  static String oneSignalApiKey = dotenv.env[Constant.KEY_API_ONESIGNAL] ?? "";
  static String oneSignalUrl = dotenv.env[Constant.KEY_URL_ONESIGNAL] ?? "";

  // Add a method to get environment variables
  static String getEnv(String key) {
    return dotenv.env[key] ?? "";
  }

  static String baseURL() {
    if (EnvService.isProduction) {
      return EnvService.baseUrlProduction;
    } else {
      return EnvService.baseUrlStagging;
    }
  }
}
