// import 'package:flutter_geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:vespa_app/core/util/core_function.dart';
import 'package:vespa_app/presentations/component/bottomsheet.dart';

import 'auth_service.dart';

class LocationService extends GetxService {
  late Position position;

  init() async {
    await 1.delay();
    CoreFunction.logPrint("Location Service", "Ready");
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      ComponentBottomsheet.gpsDisabled();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    position = await Geolocator.getCurrentPosition();
    AuthService.setLatitudeLongitude(position.latitude, position.longitude);
    return position;
  }

  Future currentLocation() async {
    try {
      var currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high, forceAndroidLocationManager: true, timeLimit: const Duration(seconds: 10)).catchError((e) async {
        CoreFunction.logPrint("TimeOut", "error boy");
        var pos = await Geolocator.getLastKnownPosition(forceAndroidLocationManager: true).timeout(const Duration(seconds: 5), onTimeout: () {
          CoreFunction.logPrint("TimeOutLagi", "error lagi boy");
          return Position(
            longitude: 0,
            latitude: 0,
            timestamp: DateTime.now(),
            accuracy: 0,
            altitude: 0,
            heading: 0,
            speed: 0,
            speedAccuracy: 0,
            altitudeAccuracy: 0,
            headingAccuracy: 0,
          );
        });
        return pos!;
      });

      CoreFunction.logPrint("Try location handphone", currentPosition.toString());

      // //? Save Location
      // if (authUsecase.adminBox.siteid == null) {
      //   LocationBoxController.save(LocationBox(
      //     latitudeCell: currentPosition.latitude,
      //     longitudeCell:  currentPosition.longitude,
      //     periode: authUsecase.setupSiteBox.tanggal,
      //     createdBy: authUsecase.salesmanBox.salesmanid,
      //     createdDate: CoreFunction.timeNow(),
      //     send: true,
      //     salesmanid: authUsecase.salesmanBox.salesmanid,
      //     siteid: authUsecase.setupSiteBox.siteid
      //   ));
      //   // authUsecase.setlatLng("-6.561582323174693", "107.44694021340075");
      //   // if (authUsecase.adminBox.salesmanid == null) {
      //     var utilityBox = await CoreDatabase.openBoxDatabase(DRCUtilityBox.tabel);
      //     utilityBox.put(DRCUtilityBox.lastTime, DateTime.now().toString());
      //   // }
      // }

      AuthService.setLatitudeLongitude(currentPosition.latitude, currentPosition.longitude);
    } catch (error) {
      CoreFunction.logPrint("Error Location", error.toString());
      //? Save Location
      AuthService.setLatitudeLongitude(0, 0);
    }
  }

  Future<bool> isLocationEnabled() async {
    bool isGpsActive = await Geolocator.isLocationServiceEnabled();
    CoreFunction.logPrint("GPS", isGpsActive);
    return isGpsActive;
  }

  // Future<String> locationName({double? latitude, double? longitude}) async {
  //   try {
  //     final coordinates = Coordinates(AuthService.latitude, AuthService.longitude);
  //     var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
  //     CoreFunction.logPrint("Address", addresses);
  //     Address result = addresses.firstWhere((element) => element.addressLine!.toLowerCase().contains("jl."));
  //     CoreFunction.logPrint("Result", "Jl.${result.addressLine!.toLowerCase().split('jl.').last}");
  //     // var first = addresses.first;
  //     return "Jl.${result.addressLine!.toLowerCase().split('jl.').last}";
  //   } catch (e) {}
  //   return "";
  // }
}
