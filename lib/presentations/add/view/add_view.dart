import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:vespa_app/core/app/color_palette.dart';
import 'package:vespa_app/presentations/add/controller/add_controller.dart';

class AddView extends StatelessWidget {
  const AddView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddController>(
        init: AddController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Buat Forum',
                  style: TextStyle(color: Colors.black)),
              backgroundColor: ColorPalette.primary,
              elevation: 1,
              iconTheme: const IconThemeData(color: Colors.black),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
                    decoration: BoxDecoration(
                      color: ColorPalette.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: controller.titleController,
                          style: const TextStyle(fontSize: 14),
                          decoration: InputDecoration(
                            hintText: 'Judul Forum...',
                            filled: true,
                            fillColor: ColorPalette.grey.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 14, horizontal: 16),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: controller.descriptionController,
                          maxLines: 5,
                          style: const TextStyle(fontSize: 14),
                          decoration: InputDecoration(
                            hintText: 'Apa yang ingin kamu bagikan?',
                            filled: true,
                            fillColor: ColorPalette.grey.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.all(16),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Obx(() {
                          final images = controller.selectedImages;

                          return Column(
                            children: [
                              GestureDetector(
                                onTap: controller.pickImages,
                                child: DottedBorderContainer(
                                  child: images.isEmpty
                                      ? Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: const [
                                            Icon(Icons.cloud_upload_outlined,
                                                size: 40, color: Colors.grey),
                                            SizedBox(height: 8),
                                            Text(
                                              'Klik untuk upload gambar',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        )
                                      : const Text('Tambah Gambar',
                                          style: TextStyle(color: Colors.grey)),
                                ),
                              ),
                              const SizedBox(height: 12),
                              if (images.isNotEmpty)
                                SizedBox(
                                  height: 90,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: images.length,
                                    separatorBuilder: (_, __) =>
                                        const SizedBox(width: 8),
                                    itemBuilder: (context, index) {
                                      final image = images[index];
                                      return Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: Image.file(
                                              File(image.path),
                                              width: 90,
                                              height: 90,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Positioned(
                                            top: 4,
                                            right: 4,
                                            child: GestureDetector(
                                              onTap: () =>
                                                  controller.removeImage(index),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                  shape: BoxShape.circle,
                                                ),
                                                child: const Icon(Icons.close,
                                                    color: Colors.white,
                                                    size: 18),
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                ),
                            ],
                          );
                        }),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: controller.submitForum,
                            icon: const Icon(Icons.send),
                            label: const Text("Upload Forum"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorPalette.primary,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              textStyle:
                                  const TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class DottedBorderContainer extends StatelessWidget {
  final Widget child;

  const DottedBorderContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border:
            Border.all(color: Colors.grey.shade300, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[100],
      ),
      child: Center(child: child),
    );
  }
}
