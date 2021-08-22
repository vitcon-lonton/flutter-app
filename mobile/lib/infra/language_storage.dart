// import 'dart:convert';

// import 'package:aqb_api/aqb_api.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:kt_dart/kt.dart';

// mixin ILanguageStorage {
//   Future<Language> getLanguage();

//   Future<KtList<Language>> getLanguages();

//   Future<void> updateLanguage(String language);

//   Future<void> updateLanguages(String languages);
// }

// class LanguageStorage implements ILanguageStorage {
//   static const key = 'setting_language';

//   final FlutterSecureStorage storage;

//   LanguageStorage(this.storage);

//   @override
//   Future<Language> getLanguage() async {
//     final string = await storage.read(key: key);
//     return Language.fromJson(jsonDecode(string));
//   }

//   @override
//   Future<KtList<Language>> getLanguages() {
//     // TODO: implement getLanguages
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> updateLanguage(String language) {
//     // TODO: implement updateLanguage
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> updateLanguages(String languages) {
//     // TODO: implement updateLanguages
//     throw UnimplementedError();
//   }
// }
