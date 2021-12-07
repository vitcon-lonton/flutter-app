// You have generated a new plugin project without
// specifying the `--platforms` flag. A plugin project supports no platforms is generated.
// To add platforms, run `flutter create -t plugin --platforms <platforms> .` under the same
// directory. You can also find a detailed instruction on how to add platforms in the `pubspec.yaml` at https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.

import 'package:aqb_api/aqb_api.dart';
import 'package:config/service/config_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'service/iconfig_service.dart';

class Config {
  factory Config() => _instance;

  Config._() {
    ready = false;
  }

  @protected
  static final _instance = Config._();

  @protected
  static late final bool ready;

  // @protected
  static late final ConfigApi api;

  // @protected
  static late final IConfigService service;

  static initialized() async {
    final dio = Dio();
    api = ConfigApi(dio);
    service = ConfigService(api);
    ready = true;
  }
}
