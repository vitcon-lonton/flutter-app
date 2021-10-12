import 'package:aqb_api/aqb_api.dart' as api;
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'ilanguage_service.dart';
import 'language_service.dart';
import 'language_service_proxy.dart';
import 'model.dart';
import 'resource/resource.dart';

class LanguagePlugin {
  LanguagePlugin._() {
    _ready = false;
  }

  static late final bool _ready;
  static late final ILanguageService service;
  static late final api.ConfigService configApi;
  static late final IResourceService resourceService;

  factory LanguagePlugin() => _instance;

  static final _instance = LanguagePlugin._();

  static bool get ready => _ready;

  static initialized() async {
    configApi = api.ConfigService(Dio());
    Hive.registerAdapter(HiveLanguageAdapter());
    final languageBox = await Hive.openBox<HiveLanguage>('languageBox');
    final selectedLanguageBox = await Hive.openBox<int>('selectedLanguageBox');
    final realService = LanguageService(selectedLanguageBox, languageBox);
    service = LanguageServiceProxy(configApi, realService, languageBox);
    service.languages;

    await _initializedResource();

    _ready = true;
  }

  static _initializedResource() async {
    Hive.registerAdapter(ResourceHiveAdapter());
    final _resourceBox = await Hive.openBox<ResourceHive>('resource');
    final _synchronizer = Synchronizer(configApi, _resourceBox);
    final _realService = ResourceService(_resourceBox)
      ..languageChange(service.language?.id ?? 1);
    resourceService = ResourceServiceProxy(_realService, _synchronizer);
    resourceService.languageChange(1);
  }

  Stream<List<api.Language>> watch() => service.watch();

  Stream<api.Language?> watchSelected() => service.watchSelected();

  Stream<List<ResourceHive>?> watchResource() => resourceService.watch();
}


// , bytes: Uint8List(0)