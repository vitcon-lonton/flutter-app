import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:aqb_api/aqb_api.dart' as data hide Resource;
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rxdart/rxdart.dart';

part 'handle.g.dart';
part 'handle.freezed.dart';

var store = {};
var version = 0.0;
const key = 'resource';
const key2 = 'resource';
final testKey = [
  'EMAIL',
  'SUBMIT',
  'NEEDHELP',
  'PASSWORD',
  'PHONE_NUMBER',
  'FOOTER_SUPPORT_CONTACT_US',
  'FOOTER_SUPPORT_HELP',
  'REGISTER',
  'LAST_NAME',
  'FIRST_NAME',
  'FIRST_NAME',
  'CONFIRMPASSWORD',
  'PASSWORDDONOTMATCH',
  'HOTELS',
  'YACHTS',
  'LIMOUSINES',
  'TOURS_AND_PACKAGES',
  'DINING',
  'PRIVATE_JETS',
  'FLIGHTS',
  'UNKNOWN',
];

@freezed
abstract class ResourceEntity with _$ResourceEntity {
  @HiveType(typeId: 0, adapterName: 'ResourceEntityAdapter')
  const factory ResourceEntity({
    @HiveField(2) final int? languageFid,
    @HiveField(0) final String? resourceKey,
    @HiveField(1) final String? resourceValue,
    @HiveField(3) final String? typeOfResource,
  }) = _ResourceEntity;

  factory ResourceEntity.fromJson(Map<String, dynamic> json) =>
      _$ResourceEntityFromJson(json);
}

class ResourceManager {
  final onLoads = <String>[];
  final data.ConfigService service;
  final Box<ResourceEntity> box;
  final _keyController = BehaviorSubject<String>();
  final _languageController = BehaviorSubject<int>();

  ResourceManager(this.service, this.box);

  bool get shouldSync => true;

  int get language => _languageController.value;

  StreamSink<String> get keyInput => _keyController.sink;

  init() async {
    // await Hive.initFlutter();
    // Hive.registerAdapter(ResourceModelAdapter());
    // box = await Hive.openBox('resources', bytes: Uint8List(0));
    // box = await Hive.openBox('resources');
    _keyController.listen((value) {
      onLoads.contains(value);
    });

    _languageController.listen(onLanguageChanged);
    _languageController.add(1);

    // box.listenable().addListener(() {
    //   // ignore: avoid_print
    //   print(box.values.map((e) => e.resourceValue));
    // });
  }

  void addKey(String key) => keyInput.add(key);

  void languageChange(int language) => _languageController.sink.add(language);

  void onLanguageChanged(int language) {
    for (var key in box.keys) {
      getResource(key);
    }
  }

  String getResource(String key) {
    final res = box.get(key)?.resourceValue;
    if (res != null) return res;
    syncResource(key);
    return key;
  }

  Future syncResource(String key) async {
    if (onLoads.contains(key)) return Future.value(null);
    onLoads.add(key);
    final rsEncode = jsonEncode(key);
    final res = await service.getResourceValue(language, rsEncode);
    if (!res.valid) return;
    final resource = const ResourceEntity()
        .copyWith(resourceKey: key)
        .copyWith(languageFid: language)
        .copyWith(resourceValue: res.responseData);
    box.put(key, resource);
    onLoads.remove(key);
  }
}

mixin IRSManager {
  int get language;

  bool get shouldSync;

  String? getResource(String key);

  Future syncResource(String key);

  void languageChange(int language);
}

class RSManager implements IRSManager {
  final Box<ResourceEntity> box;
  final data.ConfigService service;
  final _languageController = BehaviorSubject<int>();

  RSManager(this.box, this.service) {
    _languageController.add(1);
  }

  @override
  bool get shouldSync => true;

  @override
  int get language => _languageController.value;

  @override
  void languageChange(int language) {
    _languageController.add(language);
  }

  @override
  String? getResource(String key) {
    return box.get(key)?.resourceValue;
  }

  @override
  Future syncResource(String key) async {
    try {
      final rsEncode = jsonEncode(key);
      final res = await service.getResourceValue(language, rsEncode);
      if (!res.valid) return;
      final resource = const ResourceEntity()
          .copyWith(resourceKey: key)
          .copyWith(languageFid: language)
          .copyWith(resourceValue: res.responseData);
      box.put(key, resource);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}

class RSProxy implements IRSManager {
  final RSManager manager;
  final _onLoads = <String>[];

  RSProxy(this.manager);

  // init() async {
  //   // await Hive.initFlutter();
  //   // Hive.registerAdapter(ResourceModelAdapter());
  //   box = await Hive.openBox('resources', bytes: Uint8List(0));
  //   _keyController.listen((value) {
  //     onLoads.contains(value);
  //   });

  //   _languageController.listen(onLanguageChanged);
  //   _languageController.add(1);

  //   box.listenable().addListener(() {
  //     // ignore: avoid_print
  //     print(box.values.map((e) => e.resourceValue));
  //   });
  // }

  get box => manager.box;

  @override
  int get language => manager.language;

  @override
  bool get shouldSync => manager.shouldSync;

  @override
  void languageChange(int language) {
    manager.languageChange(language);
  }

  @override
  String getResource(String key) {
    final res = manager.getResource(key);
    if (res == null) syncResource(key);
    return res ?? key;
  }

  @override
  Future syncResource(String key) async {
    if (_onLoads.contains(key)) return Future.value(null);
    _onLoads.add(key);
    await manager.syncResource(key);
    _onLoads.remove(key);
  }
}

class RSTest {
  late final RSProxy manager;
  static final RSTest _singleton = RSTest._internal();
  final box = Hive.box<ResourceEntity>('resources');

  factory RSTest() => _singleton;

  RSTest._internal() {
    final dio = Dio();
    final service = data.ConfigService(dio);
    //  .openBox('testBox');
    manager = RSProxy(RSManager(box, service));
    // manager.box.listenable().addListener(() {
    //   // ignore: avoid_print
    //   print(manager.box.values.map((e) => e.resourceValue));
    // });
  }
}
