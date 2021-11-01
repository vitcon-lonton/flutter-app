import 'dart:async';
import 'dart:convert';

import 'package:aqb_api/aqb_api.dart' as data hide Resource;
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:resource_example/language/resource/resource.dart';

class Synchronizer implements ISynchronizer {
  Synchronizer(this.api, this.storage) {
    language = 1;
  }

  @protected
  late int language;

  @protected
  late Box<Resource> storage;

  @protected
  late data.ConfigService api;

  @override
  Future singleSync(String key) async {
    final rsEncode = jsonEncode(key);
    final response = await api.getResourceValue(language, rsEncode);

    if (!response.valid) throw Exception();

    final resource = Resource.now()
        .copyWith(resourceKey: key)
        .copyWith(languageFid: language)
        .copyWith(resourceValue: response.responseData);

    return storage.put(key, resource);
  }

  @override
  void updateLanguageId(int value) => language = value;
}
