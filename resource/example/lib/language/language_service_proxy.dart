import 'package:aqb_api/aqb_api.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'language.dart';
import 'model.dart';

class LanguageServiceProxy implements ILanguageService {
  final ConfigService api;
  final ILanguageService service;
  final Box<HiveLanguage> languageBox;

  LanguageServiceProxy(this.api, this.service, this.languageBox);

  @override
  Language? get language => service.language;

  @override
  Stream<List<Language>> watchAll() => service.watchAll();

  @override
  Stream<Language?> watchSelected() => service.watchSelected();

  @override
  Future<List<Language>?> get languages async {
    final cached = await service.languages;
    if (cached?.isEmpty ?? true) return _sync();
    return cached;
  }

  @override
  Future<void> update(Language value) => service.update(value);

  @override
  ValueListenable<Box<int>> languageListenable() {
    return service.languageListenable();
  }

  @override
  ValueListenable<Box<HiveLanguage>> listenable({List<int>? ids}) {
    return service.listenable(ids: ids);
  }

  Future<List<Language>?> _sync() async {
    final response = await api.getLanguages();
    final languages = response.responseData;
    final entries = <int?, HiveLanguage>{};

    for (var language in languages!) {
      entries.putIfAbsent(
        language.id,
        () => HiveLanguage.fromJson(language.toJson()),
      );
    }

    languageBox.putAll(entries);

    if (service.language == null) await service.update(languages.first);

    return languages;
  }
}
