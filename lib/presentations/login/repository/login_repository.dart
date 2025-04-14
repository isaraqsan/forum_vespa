import 'package:vespa_app/domain/base/repository.dart';
import 'package:vespa_app/presentations/login/model/login_request.dart';
import 'package:vespa_app/presentations/login/model/login_response.dart';

class LoginRepository extends Repository {
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    return await dioService.post(url: Endpoint.authLogin, body: loginRequest.toJson(), loading: true).then((value) {
      return LoginResponse.fromJson(value.data);
    });
  }
}
