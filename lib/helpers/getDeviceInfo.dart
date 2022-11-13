import 'package:flutter/services.dart';
import 'package:platform_device_id/platform_device_id.dart';

Future<String?> getDeviceIdentifier() async {
  String? deviceId;
  try {
    deviceId = await PlatformDeviceId.getDeviceId;
  } on PlatformException {
    deviceId = null;
  }

  print('deviceId');
  print(deviceId);

  return deviceId;
}
