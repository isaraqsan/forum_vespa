import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:vespa_app/core/app/2.dart';
import 'package:vespa_app/core/app/color_palette.dart';
import 'package:vespa_app/core/app/dimens.dart';
import 'package:vespa_app/core/util/size_config.dart';
import 'package:vespa_app/domain/usecase/textfiled_usecase.dart';
import 'package:vespa_app/presentations/component/2.dart';
import 'package:vespa_app/presentations/component/typhography.dart';
import 'package:vespa_app/presentations/dashboard/view/dashboard.dart';
import 'package:vespa_app/presentations/register/controller/register_controller.dart';

class RegisterFormView extends StatelessWidget {
  const RegisterFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Daftar",
          style: ComponentTyphography.titleLarge()!.copyWith(
            color: ColorPalette.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: ColorPalette.primary,
        elevation: 0,
      ),
      backgroundColor: ColorPalette.white,
      body: GetBuilder<RegisterController>(
        init: RegisterController(),
        builder: (_) {
          return Stack(
            children: [
              Form(
                key: _.formKey,
                child: ListView(
                  padding: Dimens.padding5,
                  children: [
                    _buildLabel("Nama Lengkap"),
                    _buildTextFormField(
                        _.namaController, "Masukkan nama lengkap",
                        icon: Icons.person),
                    _buildLabel("Tempat, Tanggal Lahir"),
                    _buildTextFormField(
                        _.ttlController, "Contoh: Jakarta, 11 April 2000",
                        icon: Icons.cake),
                    _buildLabel("Kota/Kabupaten Domisili"),
                    _buildTextFormField(
                        _.kotaController, "Masukkan kota/kabupaten",
                        icon: Icons.location_city),
                    _buildLabel("Provinsi Domisili"),
                    _buildTextFormField(
                        _.provinsiController, "Masukkan provinsi",
                        icon: Icons.map),
                    _buildLabel("Email"),
                    _buildTextFormField(
                        _.emailController, "Masukkan email aktif",
                        icon: Icons.email,
                        keyboardType: TextInputType.emailAddress),
                    _buildLabel("No. Telepon"),
                    _buildTextFormField(
                        _.telpController, "Masukkan nomor telepon",
                        icon: Icons.phone, keyboardType: TextInputType.phone),
                    _buildLabel("Kata Sandi"),
                    _buildTextFormField(_.passwordController, "Buat kata sandi",
                        icon: Icons.lock, obscureText: true),
                    _buildLabel("Konfirmasi Kata Sandi"),
                    _buildTextFormField(
                        _.confirmPasswordController, "Ulangi kata sandi",
                        icon: Icons.lock_outline, obscureText: true),
                    const SizedBox(height: Dimens.value100),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: SizeConfig.blockSizeHorizontal * 100,
                  padding: const EdgeInsets.symmetric(
                      vertical: Dimens.value8, horizontal: Dimens.value8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 7,
                        offset: Offset(0, -3),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: (){
                      Get.offAll(() => Dashboard());
                    },
                    // onPressed: _.submitRegister,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorPalette.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: Dimens.value6),
                      child: Text(
                        'Daftar',
                        style: ComponentTyphography.titleSmall()!.copyWith(
                          color: ColorPalette.white,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: Dimens.value16),
        Text(
          text,
          style: ComponentTyphography.titleSmall()!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: Dimens.value8),
      ],
    );
  }

  Widget _buildTextFormField(
    TextEditingController controller,
    String hint, {
    IconData? icon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: Component.textStyle(),
      decoration: Component.decorationNoBorderSearch(hint, iconPrefix: icon),
      validator: TextFieldUseCase.validator,
    );
  }
}
