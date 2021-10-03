import 'dart:async';
import 'dart:convert';

import 'package:aqb_api/aqb_api.dart' as data hide Resource;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:resource_example/resource/resource.dart';

import 'isynchronizer.dart';

class Synchronizer implements ISynchronizer {
  Synchronizer(Box<ResourceEntity> box, data.ConfigService service) {
    _box = box;
    _language = 1;
    _service = service;
    _onSync = <String>[];
  }

  late int _language;
  late List<String> _onSync;
  late Box<ResourceEntity> _box;
  late data.ConfigService _service;

  @override
  int get language => _language;

  @override
  bool onSync(String key) => _onSync.contains(key);

  @override
  void languageChanged(int value) => _language = 1;

  @override
  Future syncResource(String key) async {
    _onSync.add(key);

    final rsEncode = jsonEncode(key);
    final res = await _service.getResourceValue(_language, rsEncode);
    if (!res.valid) return;
    final resource = const ResourceEntity()
        .copyWith(resourceKey: key)
        .copyWith(languageFid: _language)
        .copyWith(resourceValue: res.responseData);
    _box.put(key, resource);

    _onSync.remove(key);
  }
}
