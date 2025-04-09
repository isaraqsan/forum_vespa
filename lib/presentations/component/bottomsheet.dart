import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vespa_app/core/app/color_palette.dart';
import 'package:vespa_app/core/util/size_config.dart';
import 'package:vespa_app/presentations/component/component.dart';
import 'package:image_picker/image_picker.dart';

class ComponentBottomsheet {
  noConnection() {
    Get.bottomSheet(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/no_connection.jpg",
              width: SizeConfig.blockSizeHorizontal * 80,
              // height: SizeConfig.blockSizeHorizontal * 50,
            ),
            Component.textBold("Tidak Ada Koneksi"),
            const SizedBox(
              height: 10,
            ),
            Component.textDefault("Aplikasi tidak dapat terhubung, pastikan anda memiliki koneksi internet harap cek kembali data seluler atau wifi", maxLines: 4, textAlign: TextAlign.center, fontSize: 12),
            const SizedBox(
              height: 10,
            ),
            Component.buttonClose(),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      isScrollControlled: true,
      backgroundColor: ColorPalette.white,
    );
  }

  static gpsDisabled() {
    Get.bottomSheet(
      Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/img_location.jpg",
              width: SizeConfig.blockSizeHorizontal * 80,
              // height: SizeConfig.blockSizeHorizontal * 50,
            ),
            Component.textBold("GPS Mati"),
            const SizedBox(
              height: 10,
            ),
            Component.textDefault("Aplikasi tidak dapat menemukan lokasi anda, pastikan GPS pada handphone aktif harap cek kembali", maxLines: 4, textAlign: TextAlign.center, fontSize: 12),
            const SizedBox(
              height: 10,
            ),
            Component.buttonClose(),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.white,
    );
  }

  static upcoming() {
    Get.bottomSheet(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 30,
            ),
            Icon(
              Icons.construction,
              color: ColorPalette.primary,
              size: 70,
            ),
            Component.textBold("Fitur akan segera tersedia"),
            const SizedBox(
              height: 10,
            ),
            Component.textDefault("Saat ini fitur masih dalam tahap develop, kami akan membuat aplikasi menjadi lebih baik", maxLines: 4, textAlign: TextAlign.center, fontSize: 12),
            const SizedBox(
              height: 10,
            ),
            Component.buttonClose(),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      isScrollControlled: true,
      backgroundColor: ColorPalette.white,
    );
  }

  static Future<ImageSource?> optionImage() async {
    ImageSource? imageSource;
    await showModalBottomSheet(
        // isScrollControlled: true,
        context: Get.context!,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        builder: (BuildContext contextBottomsheet) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Component.textBold(
                  "Pilih photo",
                  textAlign: TextAlign.center,
                  colors: ColorPalette.blackText,
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => Navigator.of(contextBottomsheet).pop(ImageSource.camera),
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(width: 1, color: ColorPalette.greyBorder)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.camera_alt,
                                color: ColorPalette.blackText,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Component.textDefault(
                                "Ambil photo",
                                colors: ColorPalette.greyText,
                                fontSize: 10,
                                // fontFamily: Constant.interTightRegular
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () => Navigator.of(contextBottomsheet).pop(ImageSource.gallery),
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(width: 1, color: ColorPalette.greyBorder)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.image,
                                color: ColorPalette.blackText,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Component.textDefault("Pilih dari Gallery", colors: ColorPalette.greyText, fontSize: 10
                                  // fontFamily: Constant.interTightRegular
                                  ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () => Navigator.of(contextBottomsheet).pop(),
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Component.textDefault(
                      "Batal",
                      colors: ColorPalette.red,
                      fontSize: 12,
                      // fontFamily: Constant.interTightRegular
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          );
        }).then((value) => imageSource = value);
    return imageSource;
  }

  static ads() {
    Get.bottomSheet(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/img_api.jpg",
              width: SizeConfig.blockSizeHorizontal * 80,
              // height: SizeConfig.blockSizeHorizontal * 50,
            ),
            Component.textBold("Konfirmasi Environtment"),
            const SizedBox(
              height: 10,
            ),
            Component.textDefault("Environment telah di ubah, mungkin ada beberapa fitur yang akan tidak tersedia. Harap hubungi customer sevice untuk lebih lanjut", maxLines: 4, textAlign: TextAlign.center, fontSize: 12),
            const SizedBox(
              height: 10,
            ),
            Component.buttonClose(),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      isScrollControlled: true,
      backgroundColor: ColorPalette.white,
    );
  }
}
