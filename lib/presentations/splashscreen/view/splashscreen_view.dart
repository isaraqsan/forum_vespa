import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vespa_app/core/app/color_palette.dart';
import 'package:vespa_app/core/util/size_config.dart';
import 'package:vespa_app/presentations/component/typhography.dart';
import 'package:vespa_app/presentations/splashscreen/controller/splashscreen_controller.dart';

class SplashscreenView extends StatelessWidget {
  SplashscreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<SplashscreenController>(
      init: SplashscreenController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorPalette.primary,
          body: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Image.asset(
                  "assets/images/logo.png",
                  height: SizeConfig.blockSizeHorizontal * 30,
                ),
              ),
              Positioned(
                bottom: 10.0,
                child: Text(
                  "",
                  style: ComponentTyphography.titleMedium()!.copyWith(color: ColorPalette.white),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
