import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vespa_app/core/app/color_palette.dart';
import 'package:vespa_app/core/app/dimens.dart';
import 'package:vespa_app/core/util/size_config.dart';
import 'package:vespa_app/domain/usecase/textfiled_usecase.dart';
import 'package:vespa_app/presentations/component/component.dart';
import 'package:vespa_app/presentations/component/typhography.dart';
import 'package:vespa_app/presentations/dashboard/view/dashboard.dart';
import 'package:vespa_app/presentations/login/controller/login_cotroller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: GetBuilder<LoginController>(
        init: LoginController(),
        builder: (_) {
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              // Image.asset(
              //   "assets/images/img_header.png",
              //   height: SizeConfig.blockSizeVertical * 20,
              //   width: SizeConfig.screenWidth,
              //   fit: BoxFit.cover,
              // ),
              Padding(
                padding: EdgeInsets.only(left: 28.0, right: 28.0),
                child: Form(
                  key: controller.formKey,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: SizeConfig.blockSizeVertical * 20),
                      Image.asset(
                        "assets/images/ic_vespa_black.png",
                        height: SizeConfig.blockSizeVertical * 10,
                      ),
                      SizedBox(
                        height: Dimens.value32,
                      ),
                      Text(
                        "Selamat Datang",
                        style: ComponentTyphography.titleLarge(),
                      ),
                      SizedBox(
                        height: Dimens.value20,
                      ),
                      Text(
                        "Username",
                        style: ComponentTyphography.bodyMedium()!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: Dimens.value12,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.done,
                        controller: controller.usernameController,
                        validator: TextFieldUseCase.validator,
                        style: ComponentTyphography.bodyMedium()!
                            .copyWith(color: ColorPalette.blackText),
                        decoration: Component.decorationNoBorderSearch(
                            "Masukan username",
                            iconPrefix: Icons.person),
                      ),
                      SizedBox(
                        height: Dimens.value12,
                      ),
                      Text(
                        "Password",
                        style: ComponentTyphography.bodyMedium()!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: Dimens.value12,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.done,
                        controller: controller.passwordController,
                        style: ComponentTyphography.bodyMedium()!
                            .copyWith(color: ColorPalette.blackText),
                        obscureText: !controller.showPassword,
                        validator: TextFieldUseCase.passwordValidator,
                        decoration: Component.decorationNoBorderSearch(
                                "Masukan password",
                                iconPrefix: Icons.person)
                            .copyWith(
                          suffixIcon: InkWell(
                            onTap: controller.onChangeShowPassword,
                            child: Icon(
                              controller.showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: ColorPalette.primary,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimens.value32,
                      ),
                      Container(
                        width: SizeConfig.screenWidth,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorPalette.primary,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                          ),
                          // onPressed: controller.onLogin,
                          onPressed: () {
                            Get.offAll(() => Dashboard());
                          },
                          child: Text(
                            'Masuk',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.screenHeight / 60),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.goToRegister();
                            },
                            child: Text(
                              "Register",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.blueAccent,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget formCard() {
    return Card(
      elevation: 5.0,
      child: Padding(
        padding:
            EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Component.textBold("Login", fontSize: 20),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                child: TextFormField(
                  controller: controller.usernameController,
                  decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorPalette.primary),
                      ),
                      icon: Icon(
                        Icons.person,
                        color: ColorPalette.primary,
                      ),
                      hintText: "Employee ID",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15.0)),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Username can\'t be empty'
                      : null,
                ),
              ),
              Container(
                height: 60,
                child: TextFormField(
                  obscureText: true,
                  controller: controller.passwordController,
                  decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorPalette.primary),
                      ),
                      icon: Icon(
                        Icons.lock,
                        color: ColorPalette.primary,
                        // color: dashBoardColor,
                      ),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15.0)),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Password can\'t be empty'
                      : null,
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Component.textDefault(
                  "Forgot Password?",
                  colors: ColorPalette.primary,
                  fontSize: 12,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
