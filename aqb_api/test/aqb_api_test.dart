import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:aqb_api/aqb_api.dart';
import 'package:postman_dio/postman_dio.dart';

void main() {
  final options = BaseOptions(
      sendTimeout: 10000, connectTimeout: 10000, receiveTimeout: 10000);
  final dio = Dio(options);
  final client = ConfigApi(dio);
  final authClient = AuthApi(dio);
  // ignore: unused_local_variable
  final accountClient = AccountApi(dio);
  dio.interceptors.add(PostmanDioLogger(enablePrint: true));

  Future<bool> testAuth() async {
    try {
      final data = const EmailAuthData()
          .copyWith(password: '123123123')
          .copyWith(email: 'hoanghiep97@hotmail.com');
      final res = await authClient.emailAuth(data);
      // final account = res.responseData;
      // final userId = account!.userId;

      // await accountClient.getAccessToken('data');

      // await accountClient.getReward(userId!);
      // final res = await accountClient.getReward('userId!');
      return res.valid;
    } catch (e) {
      return false;
    }
  }

  Future<bool> testService() async {
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
    final res = await client.getResources(1, ['COMMON']);
    // final res = await client.getResourceValue(1, 'CUISINE_AMERICAN');
    // final res = await client.getResourceValue(1, '\'CUISINE_AMERICAN\'');
    // final res =
    // await client.getResourceValue(1, jsonEncode('CUISINE_AMERICAN'));
    // final res = await client.getExchangeRate('thb', 'usd');

    return res.valid;
  }

  test('adds one to input values', () async {
    expect(await testService(), true);
    expect(await testAuth(), true);
  });
}
