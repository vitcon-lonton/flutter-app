import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aqb_api/aqb_api.dart' as data;

import 'package:language/language.dart';
import 'package:language/src/resource.dart';

void main() {
  final dio = Dio();
  final service = data.ConfigService(dio);

  test('adds one to input values', () async {
    final manager = ResourceManager(service);
    await manager.init();
    manager.syncResource('EMAIL');

    final calculator = Calculator();
    expect(calculator.addOne(2), 3);
    expect(calculator.addOne(-7), -6);
    expect(calculator.addOne(0), 1);
  }, timeout: const Timeout(Duration(seconds: 2)));
}
