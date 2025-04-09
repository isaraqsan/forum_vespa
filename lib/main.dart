import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vespa_app/core/app/app_config.dart';
import 'package:vespa_app/core/app/color_palette.dart';
import 'package:vespa_app/core/service/env_service.dart';
import 'package:vespa_app/core/service/firebase_service.dart';
import 'package:vespa_app/core/service/onesignal_service.dart';
import 'package:vespa_app/core/util/core_function.dart';
import 'package:vespa_app/core/service/database_service.dart';
import 'package:vespa_app/core/service/dio_service.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:vespa_app/presentations/splashscreen/view/splashscreen_view.dart';

import 'presentations/component/component.dart';

void main() async {
  await initServices();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(MyApp());
  });
}

Future<void> initServices() async {
  CoreFunction.logPrint('Services', 'Starting all services...');
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: ColorPalette.primary, // Ubah ini sesuai warna dashboard
    statusBarIconBrightness: Brightness.dark, // Icon hitam di status bar
    systemNavigationBarColor: ColorPalette.primary, // Warna bottom nav
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  initializeDateFormatting(AppConfig.dateLocale);
  WidgetsFlutterBinding.ensureInitialized();
  // await Get.putAsync<EnvService>(() => EnvService().init(), permanent: true);
  await Get.putAsync<DatabaseService>(() => DatabaseService().init(),
      permanent: true);
  await Get.putAsync<DioService>(() => DioService().init(), permanent: true);
  // OnesignalService().setup();
  // FirebaseService().init();
  CoreFunction.logPrint('Services', 'All services started...');
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade,
      opaqueRoute: Get.isOpaqueRouteDefault,
      popGesture: Get.isPopGestureEnable,
      transitionDuration: const Duration(milliseconds: 500),
      title: 'VespApp',
      theme: Component.theme(),
      home: SplashscreenView(),
    );
  }
}
