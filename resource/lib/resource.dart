
import 'dart:async';

import 'package:flutter/services.dart';

class Resource {
  static const MethodChannel _channel = MethodChannel('resource');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
