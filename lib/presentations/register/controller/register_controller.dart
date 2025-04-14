import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class RegisterController extends GetxController with StateMixin {
  final formKey = GlobalKey<FormState>();

  final namaController = TextEditingController();
  final ttlController = TextEditingController();
  final kotaController = TextEditingController();
  final provinsiController = TextEditingController();
  final emailController = TextEditingController();
  final telpController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  void submitRegister() {
    if (formKey.currentState!.validate()) {
      // handle registration logic
    }
  }

  @override
  void onClose() {
    namaController.dispose();
    ttlController.dispose();
    kotaController.dispose();
    provinsiController.dispose();
    emailController.dispose();
    telpController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
