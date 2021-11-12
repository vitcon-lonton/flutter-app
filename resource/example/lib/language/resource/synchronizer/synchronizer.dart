import 'dart:async';
import 'dart:convert';

import 'package:aqb_api/aqb_api.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:resource_example/language/resource/resource.dart';

class Synchronizer implements ISynchronizer {
  Synchronizer(this.api, this.storage, this.syncing) {
    language = 1;
  }

  @protected
  late int language;

  @protected
  late ConfigApi api;

  @protected
  late List<String> syncing;

  @protected
  late Box<Resource> storage;

  @override
  bool isSyncing(String key) => syncing.contains(key);

  @override
  void updateLanguageId(int value) => language = value;

  @override
  Future<DateTime?> syncByKey(String key) async {
    try {
      syncing.add(key);

      final encodeData = jsonEncode(key);
      final response = await api.getResourceValue(language, encodeData);

      if (!response.valid) return null;

      final resource = Resource.now()
          .copyWith(resourceKey: key)
          .copyWith(languageFid: language)
          .copyWith(resourceValue: response.responseData);

      storage.put(key, resource);

      syncing.remove(key);

      return resource.createTime;
    } catch (e) {
      syncing.remove(key);
      return null;
    }
  }
}
