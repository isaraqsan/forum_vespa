import 'package:vespa_app/domain/base/repository.dart';
// import 'package:vespa_app/presentations/history/model/history.dart';
// import 'package:vespa_app/presentations/history/model/request_attandance.dart';
import 'package:vespa_app/domain/base/repository.dart';
import 'package:vespa_app/presentations/splashscreen/model/splashscreen.dart';

class SplashscreenRepository extends Repository {
  Future<List<Splashscreen>> attendaceHistory() async {
    return await dioService
        .get(url: Endpoint.testing, loading: true)
        .then((value) {
      return (value.data as List).map((e) => Splashscreen.fromJson(e)).toList();
    });
  }

  // Future<bool> requestAttandance(RequestAttandance requestAttandance) async {
  //   return await dioService.post(url: Endpoint.userRequestAttendance, body: requestAttandance.toJson(), loading: true).then((value) {
  //     return validateMessageResponse(value.message);
  //   });
  // }
}
