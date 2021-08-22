// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';
import 'dart:developer';

import 'package:aqb_api/aqb_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/infra/language_repo.dart';

void main() {
  test('test language', () async {
    final storage = FlutterSecureStorage();
    final dio = Dio()
      ..options = BaseOptions(
          connectTimeout: 10000, sendTimeout: 10000, receiveTimeout: 10000);
    final service = ConfigService(dio);
    dio.interceptors.add(InterceptorsWrapper(onResponse: (res, handle) {
      // print(
      //     '<-- ${res.statusCode} ${(res.request != null ? (res.request.baseUrl + res.request.path) : 'URL')}');
      // print('Headers:');
      log('--> ${res.realUri.path}');
      log('--> ${res.realUri.path}');
      // res.headers?.forEach((k, v) => print('$k: $v'));
      // ignore: avoid_print
      print('Response: ${jsonEncode(res.data)}');
      log('Response: ${jsonEncode(res.data)}');
      // print('<-- END HTTP');
    }));

    final repo = LanguageRepo(service, storage);

    // repo.init();
    await repo.init();

    // when(() => repository.getUsers('jacob')).thenAnswer((_) async =>
    //     Right<Failure, List<Result>>(
    //         <Result>[Result(image: '', name: '', nickname: '', url: '')]));

    // var result = await usecase("jacob");
    // expect(result.isRight(), true);
    // expect(result | [], isA<List<Result>>());
  });
}
