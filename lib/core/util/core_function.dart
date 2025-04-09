import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vespa_app/core/app/app_config.dart';
import 'package:vespa_app/core/app/color_palette.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:path_provider/path_provider.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:url_launcher/url_launcher.dart';

class CoreFunction {
  static void logPrint(String? key, dynamic value) {
    debugPrint("$key => ${value.toString()}");
  }

  static Uint8List getImageBinary(dynamicList) {
    List<int> intList = dynamicList.cast<int>().toList(); //This is the magical line.
    Uint8List data = Uint8List.fromList(intList);
    return data;
  }

  static String convertImageToBase64(File file) {
    List<int> imageBytes = file.readAsBytesSync();
    String base64Image = base64Encode(imageBytes);
    return base64Image;
  }

  static Future<File?> convertImageFormBase64(String? image) async {
    Directory directory = await getApplicationDocumentsDirectory();
    var dir = await Directory('${directory.path}/dir').create(recursive: true);
    List<int> imageBytes = base64Decode(image ?? "");
    File? file = File(
      "${dir.path}/${DateTime.now().microsecond}.jpg",
    );
    file.writeAsBytesSync(imageBytes);
    return file;
  }

  static String moneyFormatter(dynamic value) {
    double price = double.tryParse(value.toString()) ?? 0;
    var idr = NumberFormat.currency(locale: "id_ID", decimalDigits: 0, symbol: "Rp");
    return idr.format(price);
  }

  static String numberFormatter(dynamic value) {
    var f = NumberFormat.compact(locale: 'id_ID');
    return f.format(value);
  }

  static Future<bool> checkConnectivity() async {
    bool connect = false;
    try {
      final result = await InternetAddress.lookup('google.com').timeout(const Duration(seconds: 5));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connect = true;
      }
    } on SocketException catch (_) {
      connect = false;
    }
    debugPrint("Check Connection $connect");
    return connect;
  }

  static String replaceCharAt(String oldString, int index, String newChar) {
    return oldString.substring(0, index) + newChar + oldString.substring(index + 1);
  }

  static void snackbar(String title, String message, {Color backgroundColor = ColorPalette.red, IconData? icons}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: backgroundColor,
      icon: Icon(
        Icons.info,
        color: ColorPalette.white,
      ),
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static void toast(String title, String message, {Color backgroundColor = ColorPalette.red, IconData? icons}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: backgroundColor,
      icon: Icon(
        Icons.info,
        color: ColorPalette.white,
      ),
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static launchWhatsapp(String noWhatsapp) async {
    var whatsappAndroid = Uri.parse("whatsapp://send?phone=$noWhatsapp&text=Hallo Admin");
    if (await canLaunchUrl(whatsappAndroid)) {
      await launchUrl(whatsappAndroid);
    } else {
      snackbar("Terjadi Kesalahan", "Tidak dapat membuka url");
    }
  }

  static redirectStore() {
    StoreRedirect.redirect(androidAppId: "id.act.hade", iOSAppId: "6474485246");
  }

  static String fileSize(int bytes) {
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(1)) + ' ' + suffixes[i];
  }

  static Future<DateTime?> pickerMonthYear() {
    return showMonthPicker(
      context: Get.context!,
      locale: Locale(AppConfig.dateLocale),
      initialDate: DateTime.now(),
      lastDate: DateTime.now(),
      headerColor: ColorPalette.primary,
    ).then((date) => date);
  }
}
