import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:aqb_api/aqb_api.dart';

void main() {
  final dio = Dio()
    ..options = BaseOptions(
        connectTimeout: 10000, sendTimeout: 10000, receiveTimeout: 10000);
  final client = ConfigService(dio);
  final accountClient = AccountService(dio);
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

  testAuth() async {
    // final data = const EmailAuthData()
    //     .copyWith(password: '123123123')
    //     .copyWith(email: 'hoanghiep97@hotmail.com');
    // final res = await accountClient.emailAuth(data);
    // final account = res.responseData;
    // final userId = account!.userId;

    // await accountClient.getAccessToken('data');

    // await accountClient.getReward(userId!);
    await accountClient.getReward('userId!');
  }

  testService() async {
    // final res = await client.getCountries();
    // final res = await client.getMealPlans();
    // final res = await client.getLanguages();
    // final res = await client.getCurrencies();
    // final res = await client.getPhoneCodes();
    // final res = await client.getFlightParts();
    // final res = await client.getAirLineMemberClubs();
    // final res = await client.getLocations('Thai');
    // final res = await client.getCities();
    // final res = await client.getDistricts();
    // final res = await client.getAirportsByKW('Thai');
    // final res = await client.getFlightAirports('Thai');
    // final res = await client.getResources(1, ['COMMON']);
    final res = await client.getExchangeRate('thb', 'usd');

    // ignore: avoid_print
    print(res.responseData!.length);
    // for (var element in res.responseData!) {
    //   // ignore: avoid_print
    //   print(element.toString());
    // }
  }

  test('adds one to input values', () async {
    await testAuth();
    // await testService();
    final calculator = Calculator();
    expect(calculator.addOne(2), 3);
    expect(calculator.addOne(-7), -6);
    expect(calculator.addOne(0), 1);
  });
}
