import 'dart:async';

import 'package:aqb_api/aqb_api.dart';
import 'package:flutter/foundation.dart';

import 'ilanguage_service.dart';

extension LanguageX on ILanguageService {
  ValueListenable<List<Language>?> languagesListenable() {
    return _LanguagesListenable(this);
  }

  ValueListenable<Language?> selectedLanguageListenable() {
    return _SelectedLanguageListenable(this);
  }
}

class _LanguagesListenable extends ValueListenable<List<Language>?> {
  final ILanguageService service;

  final List<VoidCallback> _listeners = [];

  StreamSubscription? _subscription;

  _LanguagesListenable(this.service);

  @override
  void addListener(VoidCallback listener) {
    if (_listeners.isEmpty) {
      _subscription = service.watch().listen((_) {
        for (var listener in _listeners) {
          listener();
        }
      });
    }

    _listeners.add(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);

    if (_listeners.isEmpty) {
      _subscription?.cancel();
      _subscription = null;
    }
  }

  @override
  List<Language>? get value => service.languages;
}

class _SelectedLanguageListenable extends ValueListenable<Language?> {
  final ILanguageService service;

  final List<VoidCallback> _listeners = [];

  StreamSubscription? _subscription;

  _SelectedLanguageListenable(this.service);

  @override
  void addListener(VoidCallback listener) {
    if (_listeners.isEmpty) {
      _subscription = service.watchSelected().listen((_) {
        for (var listener in _listeners) {
          listener();
        }
      });
    }

    _listeners.add(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);

    if (_listeners.isEmpty) {
      _subscription?.cancel();
      _subscription = null;
    }
  }

  @override
  Language? get value => service.language;
}
