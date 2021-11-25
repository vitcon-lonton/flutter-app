import 'package:flutter_test/flutter_test.dart';
import 'package:resource_example/resource/resource.dart';

import 'mock.dart';

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
