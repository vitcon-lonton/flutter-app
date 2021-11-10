import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:resource_example/language/resource/resource.dart';

class MockBox<Resource> extends Mock implements Box<Resource> {}

void main() {
  late MockBox<Resource> box;
  late IResourceService resourceService;

  setUp(() async {
    box = MockBox<Resource>();
    resourceService = ResourceService(box);
  });

  group("getValue", () {
    test("should return todo when there exists with the given id", () async {
      // act
      final result = resourceService.getValue(testKey[8]);

      // assert
      expect(result, isNull);
    });
  });
}
