import 'package:aqb_api/aqb_api.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'ilanguage_service.dart';
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
  List<Language>? get languages {
    final cached = service.languages;

    if (cached?.isEmpty ?? true) _syncToLocal();

    return cached;
  }

  @override
  Stream<List<Language>> watch() => service.watch();

  @override
  Stream<Language?> watchSelected() => service.watchSelected();

  @override
  Future<void> update(Language value) => service.update(value);

  Future<List<Language>?> _syncToLocal() async {
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
