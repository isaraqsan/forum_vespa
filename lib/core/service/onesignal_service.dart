import 'package:flutter/material.dart';
import 'package:vespa_app/core/service/env_service.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class OnesignalService {
  setup() async {
    if (EnvService.debug) {
      OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    }

    OneSignal.Debug.setAlertLevel(OSLogLevel.none);

    OneSignal.initialize("1e4b5b91-79d9-4a36-80db-13e80071b1fb");

    OneSignal.Notifications.clearAll();

    OneSignal.User.pushSubscription.addObserver((state) {
      debugPrint(OneSignal.User.pushSubscription.optedIn.toString());
      debugPrint(OneSignal.User.pushSubscription.id);
      debugPrint(OneSignal.User.pushSubscription.token);
      debugPrint(state.current.jsonRepresentation());
    });

    OneSignal.Notifications.addPermissionObserver((state) {
      debugPrint("Has permission $state");
    });

    OneSignal.Notifications.addClickListener((event) {
      debugPrint('NOTIFICATION CLICK LISTENER CALLED WITH EVENT: $event');
    });

    OneSignal.InAppMessages.paused(true);

    OneSignal.Notifications.requestPermission(true);
  }
}
