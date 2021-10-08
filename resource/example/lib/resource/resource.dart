// ignore_for_file: avoid_print

import 'dart:typed_data';

import 'package:aqb_api/aqb_api.dart' as data hide Resource;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'synchronizer/isynchronizer.dart';
import 'synchronizer/synchronizer.dart';

part 'constants.dart';
part 'iresource_service.dart';
part 'model.dart';
part 'resource.freezed.dart';
part 'resource.g.dart';
part 'resource_service.dart';
part 'resource_service_proxy.dart';
part 'widget.dart';

class Resource {
  late final IResourceService _service;
  late final ISynchronizer _synchronizer;
  late final Box<ResourceEntity> _resourceBox;

  Resource._();

  factory Resource() => _instance;

  static final _instance = Resource._();

  init() async {
    _resourceBox = await Hive.openBox<ResourceEntity>(key, bytes: Uint8List(0));
    _synchronizer = Synchronizer(data.ConfigService(Dio()), _resourceBox);
    final realService = ResourceService(_resourceBox);
    _service = ResourceServiceProxy(realService, _synchronizer);
    _service.languageChange(1);
  }

  int get language => _service.language;

  String? getResource(String key) => _service.getResource(key);

  void languageChange(int value) => _service.languageChange(value);

  ValueListenable<Box<ResourceEntity>> listenable({List<String>? keys}) {
    return _service.listenable(keys: keys);
  }
}
