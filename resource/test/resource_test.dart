import 'package:aqb_api/aqb_api.dart' as data;
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:resource/handle.dart';

import 'package:resource/resource.dart';

class CustomBindings extends AutomatedTestWidgetsFlutterBinding {
  @override
  bool get overrideHttpClient => false;
}

void main() {
  CustomBindings();
  final dio = Dio();
  final service = data.ConfigService(dio);
  final box = Hive.box<ResourceEntity>('resources');
  final manager = ResourceManager(service, box);

  const MethodChannel channel = MethodChannel('resource');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
    await manager.init();
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    for (var key in testKey) {
      manager.syncResource(key);
    }

    // manager.box.keys.toList();
    // manager.box.get('EMAIL');
    // manager.box;
    // manager.box.length;
    await Future.delayed(const Duration(seconds: 100));

    expect(await Resource.platformVersion, '42');
  }, timeout: const Timeout(Duration(seconds: 110)));
  // }, timeout: const Timeout(Duration(seconds: 5)));
}
