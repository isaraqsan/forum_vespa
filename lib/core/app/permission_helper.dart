import 'package:geolocator/geolocator.dart';
import 'package:vespa_app/core/util/core_function.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  static Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      CoreFunction.toast('Location Permission', 'Location services are disabled. Please enable the services');
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        CoreFunction.toast('Location Permission', 'Location permissions are denied');
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      CoreFunction.toast('Location Permission', 'Location permissions are permanently denied, we cannot request permissions.');
      return false;
    }
    return true;
  }

  static handleStoragePermission() async {
    await Permission.storage.request();
    await Permission.accessMediaLocation.request();
    await Permission.mediaLibrary.request();
  }

  static handleCameraPermission() async {
    if (!await Permission.camera.isGranted) {
      await Permission.camera.request();
    }
  }

  static handleNotifcationPermission() async {
    if (!await Permission.notification.isGranted) {
      await Permission.notification.request();
    }
  }
}
