import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:vespa_app/core/service/env_service.dart';

class FirebaseService {
  Future init() async {
    await Firebase.initializeApp();

    if (EnvService.isProduction) {
      const fatalError = true;
      // Non-async exceptions
      FlutterError.onError = (errorDetails) {
        if (fatalError) {
          // If you want to record a "fatal" exception
          FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
          // ignore: dead_code
        } else {
          // If you want to record a "non-fatal" exception
          FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
        }
      };
      // Async exceptions
      PlatformDispatcher.instance.onError = (error, stack) {
        if (fatalError) {
          // If you want to record a "fatal" exception
          FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
          // ignore: dead_code
        } else {
          // If you want to record a "non-fatal" exception
          FirebaseCrashlytics.instance.recordError(error, stack);
        }
        return true;
      };
    }
  }
}
