import 'package:vespa_app/core/app/app_config.dart';
import 'package:intl/intl.dart';

class DateFormatUseCase {
  static String dateWithDayName(String? value) {
    if (value != null) {
      return DateFormat.yMMMMEEEEd(AppConfig.dateLocale).format(DateTime.parse(value));
    } else {
      return "";
    }
  }

  static String dateWithMonthYearName(String? value) {
    if (value != null) {
      return DateFormat.yMMMM(AppConfig.dateLocale).format(DateTime.parse(value));
    } else {
      return "";
    }
  }

  static String datePeriode(DateTime? value) {
    if (value != null) {
      return DateFormat('MM/yyyy').format(value);
    } else {
      return "";
    }
  }

  static String dateWithTime(String? value) {
    if (value != null) {
      return DateFormat.yMd(AppConfig.dateLocale).add_jm().format(DateTime.parse(value));
    } else {
      return "";
    }
  }

  static String date(String? value) {
    if (value != null) {
      return DateFormat.yMd(AppConfig.dateLocale).format(DateTime.parse(value));
    } else {
      return "";
    }
  }

  static String time(String? value) {
    if (value != null) {
      return DateFormat.Hms().format(DateTime.parse(value));
    } else {
      return "";
    }
  }

  static String time2(String? value) {
    if (value != null) {
      var temp = value.split(':');
      return "${temp[0]}:${temp[1]}";
    } else {
      return "";
    }
  }

  static String timeWithName(String? value) {
    if (value != null) {
      return DateFormat.Hms().format(DateTime.parse(value));
    } else {
      return "";
    }
  }

  static String hour(int minute) {
    var d = Duration(minutes: minute);
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
  }
}
