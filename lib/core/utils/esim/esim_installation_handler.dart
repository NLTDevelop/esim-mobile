
import 'package:flutter/services.dart';

class ESimInstallationHandler{

  static const MethodChannel _channel = MethodChannel('samples.flutter.dev/esim');

  static void installESim(String eSimPackageName) {
    _channel.invokeMethod('launchESimSetup', eSimPackageName);
  }
}