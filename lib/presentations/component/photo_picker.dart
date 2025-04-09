import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vespa_app/core/app/color_palette.dart';
import 'package:vespa_app/core/app/dimens.dart';
import 'package:vespa_app/core/service/image_service.dart';
import 'package:vespa_app/presentations/component/component.dart';
import 'package:image_picker/image_picker.dart';

class PhotoPicker extends StatefulWidget {
  final ImageSource? imageSource;
  final CameraDevice? cameraDevice;
  final String? filePath;
  final ValueChanged<File?> onChanged;
  final double? height;
  final double? width;

  const PhotoPicker({
    Key? key,
    this.imageSource,
    this.cameraDevice,
    this.filePath,
    required this.onChanged,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  State<PhotoPicker> createState() => _PhotoPickerState();
}

class _PhotoPickerState extends State<PhotoPicker> {
  File? file;

  @override
  void initState() {
    if (widget.filePath != null) {
      file = File(widget.filePath!);
    }
    super.initState();
  }

  onPickImage() async {
    File? image;
    if (widget.imageSource == null) {
      image = await ImageService.imageWithOption();
    } else {
      image = await ImageService.image(source: widget.imageSource!, cameraDevice: widget.cameraDevice);
    }
    if (image != null) {
      file = File(image.path);
      setState(() {});
      widget.onChanged(file!);
    }
  }

  onRemoveImage() {
    setState(() {
      file = null;
    });
    widget.onChanged(null);
  }

  @override
  Widget build(BuildContext context) {
    if (file != null) {
      return Container(
        height: widget.height,
        width: double.infinity,
        alignment: Alignment.center,
        padding: Dimens.padding20,
        decoration: BoxDecoration(
          color: ColorPalette.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: ColorPalette.primary,
          ),
        ),
        child: Stack(
          children: [
            Image.file(
              file!,
              fit: BoxFit.fill,
            ),
            Positioned(
              top: 5,
              right: 5,
              child: InkWell(
                onTap: onRemoveImage,
                child: Container(
                  padding: Dimens.padding6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: ColorPalette.white,
                  ),
                  child: const Icon(
                    Icons.delete,
                    size: 20,
                    color: ColorPalette.red,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return InkWell(
        onTap: onPickImage,
        child: Container(
          height: 120,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: ColorPalette.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1,
              color: ColorPalette.primary,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.camera_alt,
                color: ColorPalette.primary,
              ),
              const SizedBox(
                height: Dimens.value10,
              ),
              Component.textDefault(
                "Tambah Foto",
                colors: ColorPalette.primary,
                fontSize: 10,
              ),
            ],
          ),
        ),
      );
    }
  }
}
