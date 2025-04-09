import 'package:get/get.dart';
import 'package:vespa_app/core/service/auth_service.dart';
import 'package:vespa_app/presentations/dashboard/view/dashboard.dart';
// import 'package:vespa_app/presentations/dashboard/view/dashboard.dart';
// import 'package:vespa_app/presentations/login/view/login_view.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    checkSession();
    
    super.onInit();
  }

  Future checkSession() async {
    await Future.delayed(Duration(seconds: 1), () async {
      // await AuthService().getToken();
      // if (AuthService.isLogin) {
      //   Get.offAll(() => Dashboard(), transition: Transition.fade);
      // } else {
      //   Get.offAll(() => LoginView());
      // }
      Get.offAll(() => Dashboard(), transition: Transition.fade);
    });
  }
}
