import 'dart:typed_data';

import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:resource_example/language/resource/resource.dart';
import 'package:aqb_api/aqb_api.dart' as api;

class MockBox<Resource> extends Mock implements Box<Resource> {}
// Mock
// class MockResource extends Mock implements Resource {}

void main() {
  late MockBox<Resource> box;
  late IResourceService resourceService;

  setUp(() async {
    box = MockBox<Resource>();
    resourceService = ResourceService(box);
  });

  group("getValue", () {
    test("should return todo when there exists with the given id", () async {
      // final resource = resourceService.getValue(testKey[8]);
      // act
      final result = resourceService.getValue(testKey[8]);
      // assert
      expect(result, isNull);
    });
  });
}
