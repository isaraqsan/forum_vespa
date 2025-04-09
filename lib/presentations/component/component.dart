import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vespa_app/core/app/color_palette.dart';
import 'package:vespa_app/core/app/constant.dart';
import 'package:vespa_app/core/app/dimens.dart';
import 'package:vespa_app/core/app/enum.dart';
import 'package:vespa_app/presentations/component/jumping_dots.dart';
import 'package:vespa_app/presentations/component/typhography.dart';

class Component {
  static ThemeData theme() {
    return ThemeData(
      useMaterial3: false,
      secondaryHeaderColor: Colors.white,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
      ),
      appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: Colors.white)),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      dividerColor: Colors.transparent,
      fontFamily: Constant.poppinsRegular,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.white,
          modalBackgroundColor: Colors.white,
          modalBarrierColor: Colors.white),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(
              primary: ColorPalette.primary,
              secondary: ColorPalette.background.withAlpha(100))
          .copyWith(surface: Color(0xffF7F7F7)),
    );
  }

  static AppBar appbar(String title) => AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text(title,
            style: ComponentTyphography.titleMedium()!
                .copyWith(color: ColorPalette.white)),
        flexibleSpace: const ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          // child: Image(
          //   image: AssetImage("assets/images/img_appbar.png"),
          //   fit: BoxFit.cover,
          // ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(10), child: Container()),
        backgroundColor: ColorPalette.blue1,
      );

  static AppBar appBarBackground(String title, {List<Widget>? actions}) =>
      AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text(title,
            style: ComponentTyphography.titleMedium()!
                .copyWith(color: ColorPalette.white)),
        flexibleSpace: const ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          child: Image(
            image: AssetImage("assets/images/img_appbar.png"),
            fit: BoxFit.cover,
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(10), child: Container()),
        backgroundColor: Colors.transparent,
        actions: actions,
      );

  static AppBar appNoBack(String title) => AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(title,
            style: ComponentTyphography.titleMedium()!
                .copyWith(color: ColorPalette.white)),
        flexibleSpace: const ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          child: Image(
            image: AssetImage("assets/images/img_appbar.png"),
            fit: BoxFit.cover,
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(10), child: Container()),
        backgroundColor: Colors.transparent,
      );

  static Text textBold(String content,
      {Color colors = Colors.black87,
      double fontSize = 15,
      double? letterSpacing,
      int maxLines = 2,
      FontStyle? fontStyle,
      TextAlign textAlign = TextAlign.start,
      String fontFamily = Constant.poppinsBold}) {
    return Text(
      content,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: colors,
        letterSpacing: letterSpacing,
        fontStyle: fontStyle,
        fontFamily: fontFamily,
        fontSize: fontSize.toDouble(),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  static Text textDefault(String content,
      {Color colors = Colors.black54,
      double fontSize = 15,
      FontWeight fontWeight = FontWeight.normal,
      int maxLines = 2,
      TextAlign textAlign = TextAlign.start,
      String fontFamily = Constant.poppinsRegular}) {
    return Text(
      content,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        fontWeight: fontWeight,
        color: colors,
        fontFamily: fontFamily,
        fontSize: fontSize.toDouble(),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  static Widget buttonClose({String? label, Object? result}) => InkWell(
        onTap: () => Get.back(result: result),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10),
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: ColorPalette.primary
              // border: Border.all(
              //   width: 1,
              //   color: ColorPalette.primary
              // )
              ),
          child: Component.textDefault(label ?? "Mengerti",
              colors: ColorPalette.white,
              textAlign: TextAlign.center,
              fontSize: 12),
        ),
      );

  static shadow({Color? color = ColorPalette.white}) => BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      );

  static InputDecoration decorationNoBorderSearch(
    String hint, {
    IconData? iconPrefix,
    IconData? suffixIcon,
    Function()? onTapSuffix,
  }) =>
      InputDecoration(
          fillColor: ColorPalette.white,
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: ColorPalette.grey.withAlpha(100)),
              borderRadius: BorderRadius.circular(5)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorPalette.grey.withAlpha(100)),
              borderRadius: BorderRadius.circular(5)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: ColorPalette.primary.withAlpha(100)),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: ColorPalette.red.withAlpha(100)),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: ColorPalette.grey.withAlpha(100)),
          ),
          prefixIcon: iconPrefix != null
              ? Icon(
                  iconPrefix,
                  color: ColorPalette.primary,
                  size: 20,
                )
              : null,
          suffixIcon: suffixIcon != null
              ? InkWell(
                  onTap: onTapSuffix,
                  child: Icon(
                    suffixIcon,
                    color: ColorPalette.black,
                    size: 20,
                  ),
                )
              : null,
          counterText: "",
          hintText: hint,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          hintStyle: const TextStyle(
              fontSize: 12.0,
              color: ColorPalette.textGrey,
              fontWeight: FontWeight.w500));

  static TextStyle textStyle() =>
      TextStyle(fontSize: 13.0, color: ColorPalette.blackText);

  static divider(
          {double height = 5.0,
          Color color = ColorPalette.greyBorder,
          double thickness = 1}) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: Dimens.value10),
        child: Divider(
          height: height,
          thickness: thickness,
          // indent: 20,
          // endIndent: 0,
          color: color,
        ),
      );

  static Widget circularProgressbar(double value, {double size = 50.0}) {
    return SizedBox(
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Center(
            child: Container(
              width: size,
              height: size,
              child: new CircularProgressIndicator(
                strokeWidth: 3.5,
                value: value,
                backgroundColor: ColorPalette.grey,
              ),
            ),
          ),
          Text(
            (value * 100.0).toStringAsFixed(0) + "%",
            textAlign: TextAlign.center,
            style: ComponentTyphography.bodySmall(),
          ),
        ],
      ),
    );
  }

  static toast(String? message, {SnackType snackType = SnackType.Success}) {
    var backGroudColor = ColorPalette.green;
    var icon = const Icon(Icons.check);
    switch (snackType) {
      case SnackType.Success:
        backGroudColor = ColorPalette.green;
        icon = const Icon(
          Icons.check,
          color: ColorPalette.white,
        );
        break;
      case SnackType.Info:
        backGroudColor = ColorPalette.blueLight;
        icon = const Icon(
          Icons.info,
          color: ColorPalette.white,
        );
      case SnackType.Warning:
        backGroudColor = ColorPalette.yellow;
        icon = const Icon(
          Icons.warning,
          color: ColorPalette.white,
        );
      case SnackType.Error:
        backGroudColor = ColorPalette.red;
        icon = const Icon(
          Icons.close,
          color: ColorPalette.white,
        );
    }
    Get.rawSnackbar(
      message: message,
      backgroundColor: backGroudColor,
      icon: icon,
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.FLOATING,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      borderRadius: 12,
    );
  }

  // static loading() => ShimmerWidget.loadingLogo();

  static Widget loading() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const JumpingDots(),
          const SizedBox(height: Dimens.value10),
          Text(
            "Loading...",
            style: ComponentTyphography.bodySmall(),
          )
        ],
      ),
    );
  }

  static Widget emptyData() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/icons/ic_empty.png",
            width: 100,
          ),
          SizedBox(
            height: 10,
          ),
          Component.textDefault("Belum ada data", fontSize: 12),
        ],
      ),
    );
  }

  static Widget underDevelopment() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.construction,
            color: ColorPalette.primary,
            size: 100,
          ),
          SizedBox(
            height: 10,
          ),
          Component.textDefault("Fitur sedang dalam tahap pengembangan",
              fontSize: 12),
        ],
      ),
    );
  }

  static InputDecoration decorationRoundedSearchX(
    String hint, {
    IconData? iconPrefix,
    IconData? suffixIcon,
    Function()? onTapSuffix,
  }) =>
      InputDecoration(
        filled: true,
        fillColor: ColorPalette.white,
        hintText: hint,
        hintStyle: const TextStyle(
          fontSize: 14,
          color: Colors.grey,
          fontWeight: FontWeight.w400,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        prefixIcon: iconPrefix != null
            ? Icon(
                iconPrefix,
                color: Colors.grey.shade600,
                size: 20,
              )
            : null,
        suffixIcon: suffixIcon != null
            ? InkWell(
                onTap: onTapSuffix,
                child: Icon(
                  suffixIcon,
                  color: Colors.grey.shade600,
                  size: 20,
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: ColorPalette.primary.withAlpha(100)),
        ),
      );
}
