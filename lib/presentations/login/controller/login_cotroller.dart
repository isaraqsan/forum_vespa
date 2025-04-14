import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vespa_app/core/app/database_key.dart';
import 'package:vespa_app/core/service/auth_service.dart';
import 'package:vespa_app/core/service/database_service.dart';
import 'package:vespa_app/core/service/dio_service.dart';
import 'package:vespa_app/presentations/dashboard/view/dashboard.dart';
import 'package:vespa_app/presentations/login/model/login_request.dart';
import 'package:vespa_app/presentations/login/repository/login_repository.dart';
// import 'package:vespa_app/presentations/profile/repository/profile_repository.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:vespa_app/presentations/register/view/register_form_view.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginRepository loginRepository = LoginRepository();
  // final ProfileRepository profileRepository = ProfileRepository();
  final dioService = Get.find<DioService>();
  final databaseService = Get.find<DatabaseService>();
  bool showPassword = false;

  Future<void> onLogin() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    LoginRequest loginRequest = LoginRequest(
      username: usernameController.text,
      password: passwordController.text,
      playerId: OneSignal.User.pushSubscription.id
      
    );
    await loginRepository.login(loginRequest).then(
      (value) async {
        await databaseService.write(Databasekey.photoId, value.fotoId);
        await AuthService().setToken(value.accessToken ?? "");
        // await onGetProfile();
      },
    ).onError(
      (error, stackTrace) {},
    );
  }

  // onGetProfile() async {
  //   await profileRepository.profile().then(
  //     (value) async {
  //       await AuthService().setName(value.empName ?? "");
  //       await databaseService.write(Databasekey.profile, value);
  //       Get.offAll(() => Dashboard());
  //     },
  //     onError: (error, stackTrace) {},
  //   );
  // }

  goToRegister() {
    Get.to(() => RegisterFormView());
  }

  onChangeShowPassword() {
    showPassword = !showPassword;
    update();
  }
}
