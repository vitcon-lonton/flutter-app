// ignore_for_file: implementation_imports

import 'dart:async';

import 'package:aqb_api/aqb_api.dart';
import 'package:collection/src/iterable_extensions.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'ilanguage_service.dart';
import 'language.dart';
import 'model.dart';

class LanguageService implements ILanguageService {
  final selectedIndex = 0;
  final Box<int> selectedLanguageBox;
  final Box<HiveLanguage> languageBox;

  LanguageService(this.selectedLanguageBox, this.languageBox);

  @override
  Language? get language {
    if (selectedLanguageBox.length == 0) return null;

    final id = selectedLanguageBox.getAt(selectedIndex);
    final languagesCached = languageBox.values.toList();
    final language = languagesCached.firstWhereOrNull((e) => e.id == id);

    if (language == null) return null;

    return language.toData();
  }

  @override
  List<Language>? get languages {
    return languageBox.values.map((e) {
      return Language.fromJson(e.toJson());
    }).toList();
  }

  @override
  Stream<List<Language>> watch() {
    return languageBox.watch().map((event) {
      return languageBox.values.map((e) => e.toData()).toList();
    });
  }

  @override
  Stream<Language?> watchSelected() async* {
    yield* selectedLanguageBox.watch().map((event) => language);
  }

  @override
  Future<void> update(Language language) {
    if (selectedLanguageBox.length == 0) {
      return selectedLanguageBox.add(language.id!);
    }

    return selectedLanguageBox.putAt(selectedIndex, language.id!);
  }
}



// @override
// Future<List<Language>?> get languages {
//   return Future.value(languageBox.values.map((e) {
//     return Language.fromJson(e.toJson());
//   }).toList());
// }

// yield* selectedLanguageBox.watch().skipWhile((event) {
//   return event.value == selectedLanguageBox.getAt(selectedIndex);
// }).map((event) => language);
// return selectedLanguageBox.watch().skipWhile((event) {
//   return event.value == selectedLanguageBox.getAt(selectedIndex);
// }).map((event) => language);