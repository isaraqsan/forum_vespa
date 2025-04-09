import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:vespa_app/core/util/core_function.dart';
import 'package:vespa_app/presentations/component/bottomsheet.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ImageService {
  static Future<File?> image({ImageSource source = ImageSource.camera, CameraDevice? cameraDevice}) async {
    File? file;
    await ImagePicker().pickImage(source: source, imageQuality: 70, maxHeight: 1280, maxWidth: 768).then((value) async {
      if (value != null) {
        file = await compressFile(value);
      }
    });
    return file;
  }

  static Future<File?> imageWithOption({bool crop = false}) async {
    File? xFile;
    await ComponentBottomsheet.optionImage().then((source) async {
      if (source != null) {
        await ImagePicker().pickImage(source: source, imageQuality: 70).then((value) async {
          if (value != null) {
            xFile = await compressFile(value);
          }
        });
      }
    });
    return xFile;
  }

  static Future<File> compressFile(XFile file) async {
    Directory directory = await getApplicationDocumentsDirectory();
    var dir = await Directory('${directory.path}/dir').create(recursive: true);
    var result = await FlutterImageCompress.compressAndGetFile(file.path, dir.path + "/${DateTime.now().microsecond}.jpg", quality: 50);
    CoreFunction.logPrint("Size Before", CoreFunction.fileSize(await file.length()));
    CoreFunction.logPrint("Size After", CoreFunction.fileSize(await result!.length()));
    return File(result.path);
  }
}
