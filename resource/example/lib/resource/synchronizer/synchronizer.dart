import 'dart:async';
import 'dart:convert';

import 'package:aqb_api/aqb_api.dart' as data hide Resource;
import 'package:hive_flutter/hive_flutter.dart';

import 'package:resource_example/resource/resource.dart';

import 'isynchronizer.dart';

class Synchronizer implements ISynchronizer {
  Synchronizer(data.ConfigService api, Box<ResourceEntity> resourceBox) {
    _api = api;
    _language = 1;
    _resourceBox = resourceBox;
  }

  late int _language;
  late data.ConfigService _api;
  late Box<ResourceEntity> _resourceBox;

  @override
  Future syncResource(String key) async {
    final rsEncode = jsonEncode(key);
    final response = await _api.getResourceValue(_language, rsEncode);

    if (!response.valid) return;

    final resource = const ResourceEntity()
        .copyWith(resourceKey: key)
        .copyWith(languageFid: _language)
        .copyWith(resourceValue: response.responseData);

    _resourceBox.put(key, resource);
  }
}
