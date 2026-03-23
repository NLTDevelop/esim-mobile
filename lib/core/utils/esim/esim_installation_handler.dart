
import 'dart:io';

import 'package:flutter/services.dart';

class ESimInstallationHandler{

  static const MethodChannel _channel = MethodChannel('samples.flutter.dev/esim');

  static void installESim(String eSimPackageName) {
    if(Platform.isIOS){
      _channel.invokeMethod('launchESimSetup', eSimPackageName);
    } else {
      _channel.invokeMethod('installEsimViaUniversalLink', {
        'activationCode': eSimPackageName,
      });
    }
  }
}