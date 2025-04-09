class Constant {
  //? ENV
  static const String env = ".env";
  static const String DEBUG = "DEBUG";
  static const String IS_PRODUCTION = "IS_PRODUCTION";
  static const String BASE_URL_PRODUCTION = "BASE_URL_PRODUCTION";
  static const String BASE_URL_STAGGING = "BASE_URL_STAGGING";
  static const String BASE_URL_ABSENCE = "BASE_URL_ABSENCE";
  static const String TOKEN_PHOTO = "TOKEN_PHOTO";

  static const String endpointPathId = ":id";

  //? Font
  static const poppinsRegular = "poppins_regular";
  static const poppinsBold = "poppins_bold";

  //? Request Type
  static const String REQUEST_TYPE_RIL = "RIL";
  static const String REQUEST_TYPE_ROT = "ROT";

  //? Status
  static const String failure = "failure";

  //? Attendance Type
  static const int ATTENDANCE_CHECKIN = 0;
  static const int ATTENDANCE_CHECKOUT = 1;

  //? Health Safety Environment
  static const int hseStatusCodeDefault = 0;
  static const int hseStatusCodeApprove = 1;
  static const int hseStatusCodeHandOver = 2;
  static const int hseStatusCodeReceive = 3;
  static const int hseStatusCodeHandOverBack = 4;
  static const int hseStatusCodeReturn = 5;
  static const int hseStatusCodeReject = 6;

  //? Status
  static const String statusApprove = "Approve";

  //? Date Format
  static const String dateFormat = "yyyy/MM/dd";
  static const String timeFormat = "HH:mm:ss";

  //?onesignal
  static const String KEY_APPID_ONESIGNAL = "0a74bf62-f939-4178-b9b6-d85765a942fe";
  static const String KEY_API_ONESIGNAL = "N2NkM2ZmODktMzliZS00ZGEwLThjMTEtNjE0YjA0N2YwMGJh";
  static const String KEY_URL_ONESIGNAL = "https://onesignal.com/api/v1/notifications";
}
