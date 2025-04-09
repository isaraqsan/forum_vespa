import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vespa_app/core/app/color_palette.dart';

class ComponentTyphography {
  static final textTheme = Theme.of(Get.context!).textTheme.apply(displayColor: Theme.of(Get.context!).colorScheme.onSurface);

  static TextStyle? displaylarge() => textTheme.displayLarge;

  static TextStyle? displaymedium() => textTheme.displayMedium;

  static TextStyle? displaysmall() => textTheme.displaySmall;

  static TextStyle? headlineLarge() => textTheme.headlineLarge;

  static TextStyle? headlineMedium() => textTheme.headlineMedium;

  static TextStyle? headlineSmall() => textTheme.headlineSmall;

  static TextStyle? titleLarge() => textTheme.titleLarge;

  static TextStyle? titleMedium() => textTheme.titleMedium;

  static TextStyle? titleSmall() => textTheme.titleSmall;

  static TextStyle? bodyLarge() => textTheme.bodyLarge;

  static TextStyle? bodyMedium() => textTheme.bodyMedium;

  static TextStyle? bodySmall() => textTheme.bodySmall;

  static TextStyle bodyExtraSmall() => textTheme.bodySmall!.copyWith(fontSize: 11);

  static TextStyle bodySmallGrey() => textTheme.bodySmall!.copyWith(color: ColorPalette.textGrey);
}
