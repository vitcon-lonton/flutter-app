// ignore_for_file: implementation_imports

import 'dart:async';

import 'package:aqb_api/aqb_api.dart';
import 'package:collection/src/iterable_extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rxdart/subjects.dart';

import 'language.dart';
import 'model.dart';

class LanguageService implements ILanguageService {
  final selectedIndex = 0;
  final Box<int> selectedLanguageBox;
  final Box<HiveLanguage> languageBox;
  final languageController = BehaviorSubject<List<Language>>();

  LanguageService(this.selectedLanguageBox, this.languageBox) {
    languageBox.listenable().addListener(() {
      languageController.add(languageBox.values.map((e) {
        return e.toData();
      }).toList());
    });

    // languageBox.watch().map((event) {
    //   languageController.add(languageBox.values.map((e) {
    //     return e.toData();
    //   }).toList());
    // });
    languageController.add(languageBox.values.map((e) {
      return e.toData();
    }).toList());
  }

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
  Stream<List<Language>> watchAll() {
    // languageController.add(languageBox.values.map((e) => e.toData()).toList());

    // return languageBox.watch().map((event) {
    //   return languageBox.values.map((e) => e.toData()).toList();
    // });
    return languageController.stream;
    // return Stream.value(languageBox.values.map((e) => e.toData()).toList())
    //     .asBroadcastStream();
  }

  @override
  Stream<Language?> watchSelected() {
    return selectedLanguageBox.watch().skipWhile((event) {
      return event.value == selectedLanguageBox.getAt(selectedIndex);
    }).map((event) => language);
  }

  @override
  Future<List<Language>?> get languages {
    return Future.value(languageBox.values.map((e) {
      return Language.fromJson(e.toJson());
    }).toList());
  }

  @override
  Future<void> update(Language language) {
    if (selectedLanguageBox.length == 0) {
      return selectedLanguageBox.add(language.id!);
    }

    return selectedLanguageBox.putAt(selectedIndex, language.id!);
  }

  @override
  ValueListenable<Box<int>> languageListenable() {
    return selectedLanguageBox.listenable();
  }

  @override
  ValueListenable<Box<HiveLanguage>> listenable({List<int>? ids}) {
    return languageBox.listenable(keys: ids);
  }
}
