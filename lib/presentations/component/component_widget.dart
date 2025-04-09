import 'package:flutter/cupertino.dart';
import 'package:vespa_app/core/app/color_palette.dart';
import 'package:vespa_app/core/app/enum.dart';
import 'package:vespa_app/presentations/component/component.dart';

class ComponentWidget {
  static Widget labelStatus(Status? status) {
    switch (status) {
      case Status.Complete:
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
          decoration: BoxDecoration(color: ColorPalette.green2, borderRadius: BorderRadius.circular(2)),
          child: Component.textDefault("Selesai", fontSize: 10, fontWeight: FontWeight.w500, colors: ColorPalette.white),
        );
      case Status.Waiting:
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
          decoration: BoxDecoration(color: ColorPalette.grey, borderRadius: BorderRadius.circular(2)),
          child: Component.textDefault("Menunggu", fontSize: 10, fontWeight: FontWeight.w500, colors: ColorPalette.white),
        );
      case Status.Rejected:
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
          decoration: BoxDecoration(color: ColorPalette.red, borderRadius: BorderRadius.circular(2)),
          child: Component.textDefault("Ditolak", fontSize: 10, fontWeight: FontWeight.w500, colors: ColorPalette.white),
        );
      case Status.Approved:
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
          decoration: BoxDecoration(color: ColorPalette.blue, borderRadius: BorderRadius.circular(2)),
          child: Component.textDefault("Approved", fontSize: 10, fontWeight: FontWeight.w500, colors: ColorPalette.white),
        );
      case Status.HandOver:
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
          decoration: BoxDecoration(color: ColorPalette.yellow, borderRadius: BorderRadius.circular(2)),
          child: Component.textDefault("Serah Terima", fontSize: 10, fontWeight: FontWeight.w500, colors: ColorPalette.white),
        );
      case Status.Expired:
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
          decoration: BoxDecoration(color: ColorPalette.red, borderRadius: BorderRadius.circular(2)),
          child: Component.textDefault("Expired", fontSize: 10, fontWeight: FontWeight.w500, colors: ColorPalette.white),
        );
      default:
        return Container();
    }
  }

  static Widget labelStatusNumber(Status? status) {
    switch (status) {
      case Status.Complete:
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
          decoration: BoxDecoration(color: ColorPalette.green2, borderRadius: BorderRadius.circular(2)),
          child: Component.textDefault("Selesai", fontSize: 10, fontWeight: FontWeight.w500, colors: ColorPalette.white),
        );
      case Status.Waiting:
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
          decoration: BoxDecoration(color: ColorPalette.grey, borderRadius: BorderRadius.circular(2)),
          child: Component.textDefault("Menunggu", fontSize: 10, fontWeight: FontWeight.w500, colors: ColorPalette.white),
        );
      case Status.Rejected:
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
          decoration: BoxDecoration(color: ColorPalette.red, borderRadius: BorderRadius.circular(2)),
          child: Component.textDefault("Ditolak", fontSize: 10, fontWeight: FontWeight.w500, colors: ColorPalette.white),
        );
      case Status.Approved:
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
          decoration: BoxDecoration(color: ColorPalette.blue, borderRadius: BorderRadius.circular(2)),
          child: Component.textDefault("Approved", fontSize: 10, fontWeight: FontWeight.w500, colors: ColorPalette.white),
        );
      case Status.HandOver:
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
          decoration: BoxDecoration(color: ColorPalette.yellow, borderRadius: BorderRadius.circular(2)),
          child: Component.textDefault("Serah Terima", fontSize: 10, fontWeight: FontWeight.w500, colors: ColorPalette.white),
        );
      default:
        return Container();
    }
  }
}
