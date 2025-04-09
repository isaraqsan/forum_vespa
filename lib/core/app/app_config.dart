class AppConfig {
  //? Config API
  static const String appsVersionAndroid = "v1.0.3";
  static const String appsversionIos = "v1.0.1";
  static const String cacheControl = "no-cache";
  static const String contentType = "application/json";
  static const String contentTypeUrlEncoded = "application/x-www-form-urlencoded";

  //? Config Time
  static const int durationShimmer = 1200;
  static const Duration timeRequestApi = Duration(minutes: 3);

  //? Config Date Locale
  static const String dateLocale = "id";

  //? TIme internet
  static const String getTimeInternet = "https://timeapi.io/api/Time/current/zone?timeZone=Asia/Jakarta";
}
