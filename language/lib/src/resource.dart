import 'dart:convert';
import 'dart:developer';

import 'package:aqb_api/aqb_api.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kt_dart/kt.dart';

import 'failures.dart';

mixin ILanguageManager {
  Future<Either<LanguageFailure, Language>> getLanguage();

  Future<Either<LanguageFailure, KtList<Language>>> getLanguages();

  Future<Either<LanguageFailure, Unit>> update(Language language);
}

class LanguageManager implements ILanguageManager {
  static const key = 'setting_language';
  static const key2 = 'setting_languages';
  final ConfigService service;
  final FlutterSecureStorage storage;
  final dfLanguage =
      Language().copyWith(id: 1).copyWith(displayName: 'Thailand');

  LanguageManager(this.service, this.storage);

  @override
  Future<Either<LanguageFailure, Language>> getLanguage() async {
    try {
      final language = await _fromLocal();
      return Right(language!);
    } catch (e) {
      log('getLanguage');
      return const Left(LanguageFailure.notFound());
    }
  }

  @override
  Future<Either<LanguageFailure, KtList<Language>>> getLanguages() async {
    try {
      final res = await service.getLanguages();
      if (!res.valid) return const Left(LanguageFailure.notFound());
      return Right(KtList.from(res.responseData!.map((e) => e)));
    } catch (e) {
      log('getLanguages');
      return const Left(LanguageFailure.notFound());
    }
  }

  init() async {
    // try {
    var _language = await _fromLocal();
    if (_language != null) return;
    // _language = (await getLanguages()).foldRight(null, (r, previous) {
    //   print(r);
    //   return r.first();
    // });

    _language = (await getLanguages()).fold((l) => null, (r) {
      return r.first();
    });

    // print(_language);

    if (_language == null) return;
    await _updateLocal(_language);
    return;
    // } catch (e) {
    //   log(e.toString());
    // }
  }

  // Future<void> _updateLanguages(KtList<Language> languages) async {
  //   final string = jsonEncode(languages.map((p0) => p0.toJson()));
  //   return storage.write(key: key2, value: string);
  // }

  // Future<KtList<Language>> _readLanguages(KtList<Language> languages) async {
  //   final string = await storage.read(key: key2);
  //   return KtList.from(
  //       (jsonDecode(string!) as Iterable).map((e) => Language.fromJson(e)));
  // }

  @override
  Future<Either<LanguageFailure, Unit>> update(Language language) async {
    try {
      await _updateLocal(language);
      return const Right(unit);
    } catch (e) {
      log('update');
      return const Left(LanguageFailure.notFound());
    }
  }

  Future<Language?> _fromLocal() async {
    final string = await storage.read(key: key);
    if (string == null) return null;
    return Language.fromJson(jsonDecode(string));
  }

  Future<void> _updateLocal(Language language) async {
    final string = jsonEncode(language.toJson());
    return storage.write(key: key, value: string);
  }
}


  // @override
  // Future<Either<LanguageFailure, KtList<Resource>>> getLanguage() {
  //   // TODO: implement getLanguage
  //   throw UnimplementedError();
  // }
  // // final SearchRepository repository;

  // // SearchByTextImpl(this.repository);

  // // @override
  // // Future<Either<Failure, List<Result>>> call(String? textSearch) async {
  // //   if (textSearch?.isEmpty ?? true) {
  // //     return Left(InvalidSearchText());
  // //   }
  // //   return repository.getUsers(textSearch!);
  // // }