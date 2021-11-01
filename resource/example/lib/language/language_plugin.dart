import 'package:aqb_api/aqb_api.dart' as api;
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

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

  static bool get ready => _ready;

  static final _instance = LanguagePlugin._();

  static initialized() async {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger(requestBody: false));
    configApi = api.ConfigService(dio);
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
    Hive.registerAdapter(ResourceAdapter());
    final _resourceBox = await Hive.openBox<Resource>('resource');
    final _synchronizer = Synchronizer(configApi, _resourceBox);
    final _realService = ResourceService(_resourceBox);
    resourceService = ResourceServiceProxy(_realService, _synchronizer);
    // resourceService.languageChange(1);
    // final _realService = ResourceService(_resourceBox)
    // ..languageChange(service.language?.id ?? 1);
  }

  Stream<List<api.Language>> watch() => service.watch();

  Stream<api.Language?> watchSelected() => service.watchSelected();

  Stream<List<Resource>?> watchResource() => resourceService.watch();
}


// , bytes: Uint8List(0)