import 'dart:async';
import 'dart:convert';

import 'package:aqb_api/aqb_api.dart' as data hide Resource;
import 'package:hive_flutter/hive_flutter.dart';

import 'package:resource_example/language/resource/resource.dart';

import 'isynchronizer.dart';

class Synchronizer implements ISynchronizer {
  Synchronizer(data.ConfigService api, Box<ResourceHive> resourceBox) {
    _api = api;
    _language = 1;
    language = 1;
    _resourceBox = resourceBox;
  }

  late int _language;
  late data.ConfigService _api;
  late Box<ResourceHive> _resourceBox;

  @override
  late int language;

  @override
  Future syncResource(String key) async {
    final rsEncode = jsonEncode(key);
    final response = await _api.getResourceValue(language, rsEncode);

    if (!response.valid) return;

    final resource = const ResourceHive()
        .copyWith(resourceKey: key)
        .copyWith(languageFid: _language)
        .copyWith(resourceValue: response.responseData);

    _resourceBox.put(key, resource);
  }
}
