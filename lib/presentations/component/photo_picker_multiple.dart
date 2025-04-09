import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vespa_app/core/app/color_palette.dart';
import 'package:vespa_app/core/app/dimens.dart';
import 'package:vespa_app/core/service/image_service.dart';
import 'package:vespa_app/presentations/component/component.dart';
import 'package:image_picker/image_picker.dart';

class PhotoPickerMultiple extends StatefulWidget {
  final ImageSource? imageSource;
  final CameraDevice? cameraDevice;
  final List<String>? filePaths;
  final ValueChanged<List<File>> onChanged;
  final double? height;
  final double? width;

  const PhotoPickerMultiple({
    Key? key,
    this.imageSource,
    this.cameraDevice,
    this.filePaths,
    required this.onChanged,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  State<PhotoPickerMultiple> createState() => _PhotoPickerState();
}

class _PhotoPickerState extends State<PhotoPickerMultiple> {
  List<File> files = [];

  @override
  void initState() {
    if (widget.filePaths != null) {
      files = widget.filePaths!.map((path) => File(path)).toList();
    }
    super.initState();
  }

  onPickImages() async {
    List<File>? images;
    if (widget.imageSource == null) {
      images = (await ImageService.imageWithOption()) as List<File>?;
    } else {
      images = (await ImageService.image(source: widget.imageSource!, cameraDevice: widget.cameraDevice)) as List<File>?;
    }
    if (images != null && images.isNotEmpty) {
      setState(() {
        files.addAll(images!);
      });
      widget.onChanged(files);
    }
  }

  onRemoveImage(File file) {
    setState(() {
      files.remove(file);
    });
    widget.onChanged(files);
  }

  @override
  Widget build(BuildContext context) {
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
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: files.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Image.file(
                      files[index],
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                      top: 5,
                      right: 5,
                      child: InkWell(
                        onTap: () => onRemoveImage(files[index]),
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
                );
              },
            ),
          ),
          InkWell(
            onTap: onPickImages,
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
          ),
        ],
      ),
    );
  }
}
