import 'package:aqb_api/aqb_api.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'model.dart';

mixin ILanguageService {
  Language? get language;
  Stream<List<Language>> watchAll();
  Stream<Language?> watchSelected();
  Future<List<Language>?> get languages;
  Future<void> update(Language language);
  ValueListenable<Box<int>> languageListenable();
  ValueListenable<Box<HiveLanguage>> listenable({List<int>? ids});
}
