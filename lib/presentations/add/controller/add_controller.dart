import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddController extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final selectedImages = <XFile>[].obs;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImages() async {
    final images = await _picker.pickMultiImage(imageQuality: 70);
    if (images != null) {
      selectedImages.addAll(images);
    }
  }

  void removeImage(int index) {
    selectedImages.removeAt(index);
  }

  void submitForum() {
    final title = titleController.text.trim();
    final description = descriptionController.text.trim();
    final images = selectedImages;

    if (title.isEmpty || description.isEmpty) {
      Get.snackbar("Gagal", "Judul dan deskripsi wajib diisi");
      return;
    }

    // Simulasi upload
    Get.snackbar("Berhasil", "Forum berhasil di-upload!");
    debugPrint("Judul: $title");
    debugPrint("Deskripsi: $description");

    if (images.isNotEmpty) {
      for (var img in images) {
        debugPrint("Path Gambar: ${img.path}");
      }
    } else {
      debugPrint("Tidak ada gambar diupload.");
    }

    // Reset
    titleController.clear();
    descriptionController.clear();
    selectedImages.clear(); // pakai .clear() karena dia RxList
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}
