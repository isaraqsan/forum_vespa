import 'package:get/get.dart';
import 'package:vespa_app/core/service/auth_service.dart';
import 'package:vespa_app/core/util/core_function.dart';
import 'package:vespa_app/presentations/dashboard/view/dashboard.dart';
import 'package:vespa_app/presentations/splashscreen/repository/splashscreen_repository.dart';

class SplashscreenController extends GetxController {
  final SplashscreenRepository historyRepository = SplashscreenRepository();

  @override
  void onInit() {
    super.onInit();
    initSplash(); // langsung mulai proses splash
  }

  Future<void> initSplash() async {
    // Delay splash selama 2 detik
    await Future.delayed(const Duration(seconds: 2));

    await AuthService().getToken(); // ambil token

    CoreFunction.logPrint("Token", AuthService.token);

    // if (AuthService.isLogin) {
      Get.offAll(() => Dashboard(), transition: Transition.fade);
    // } else {
      // Get.offAll(() => Dashboard(), transition: Transition.fade);
    // }
  }
}
