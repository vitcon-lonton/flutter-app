import 'package:aqb_api/aqb_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'language/ilanguage_service.dart';
import 'language/language_service.dart';
import 'language/language_service_proxy.dart';
import 'language/model.dart';
import 'resource/resource.dart';

class LanguagePlugin {
  factory LanguagePlugin() => _instance;

  LanguagePlugin._() {
    ready = false;
  }

  @protected
  static final _instance = LanguagePlugin._();

  @protected
  static late final bool ready;

  @protected
  static late final ConfigApi configApi;

  @protected
  static late final ILanguageService languageService;

  @protected
  static late final IResourceService resourceService;

  static initialized() async {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger(requestBody: false));
    configApi = ConfigApi(dio);
    Hive.registerAdapter(HiveLanguageAdapter());
    final languageBox = await Hive.openBox<HiveLanguage>('languageBox');
    final selectedLanguageBox = await Hive.openBox<int>('selectedLanguageBox');
    final realService = LanguageService(selectedLanguageBox, languageBox);
    languageService = LanguageServiceProxy(configApi, realService, languageBox);
    languageService.languages;

    await _initializedResource();

    ready = true;
  }

  static _initializedResource() async {
    Hive.registerAdapter(ResourceAdapter());
    final _resourceBox = await Hive.openBox<Resource>('resource');
    final _synchronizer = Synchronizer(configApi, _resourceBox, []);
    final _realService = ResourceService(_resourceBox);
    resourceService = ResourceServiceProxy(_synchronizer, _realService);
    // resourceService.languageChange(1);
    // final _realService = ResourceService(_resourceBox)
    // ..languageChange(service.language?.id ?? 1);
  }

  Stream<List<Language>> watch() => languageService.watch();

  Stream<Language?> watchSelected() => languageService.watchSelected();

  Stream<List<Resource>?> watchResource() => resourceService.watch();
}


// , bytes: Uint8List(0)