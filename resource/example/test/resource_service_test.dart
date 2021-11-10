import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:resource_example/language/resource/resource.dart';

class MockBox<T> extends Mock implements Box<T> {}

void main() {
  late int languageId;
  late MockBox<Resource> mockBox;
  late List<Resource> mockResources;
  late IResourceService resourceService;

  void generateResource() {
    mockResources = [
      Resource.now()
          .copyWith(languageFid: languageId)
          .copyWith(resourceKey: 'PASSWORD')
          .copyWith(resourceValue: 'Password'),
      Resource.now()
          .copyWith(languageFid: languageId)
          .copyWith(resourceKey: 'REGISTER')
          .copyWith(resourceValue: 'Register'),
      Resource.now()
          .copyWith(languageFid: languageId)
          .copyWith(resourceKey: 'EMAIL')
          .copyWith(resourceValue: 'Email'),
      Resource.now()
          .copyWith(languageFid: languageId)
          .copyWith(resourceKey: 'LAST_NAME')
          .copyWith(resourceValue: 'Last Name'),
      Resource.now()
          .copyWith(languageFid: languageId)
          .copyWith(resourceKey: 'PHONE_NUMBER')
          .copyWith(resourceValue: 'Phone Number'),
      Resource.now()
          .copyWith(languageFid: languageId)
          .copyWith(resourceKey: 'SUBMIT')
          .copyWith(resourceValue: 'Submit'),
    ];
  }

  setUpAll(() {
    registerFallbackValue<MockBox<Resource>>(MockBox<Resource>());
  });

  setUp(() {
    languageId = 1;
    mockBox = MockBox<Resource>();
    resourceService = ResourceService(mockBox);
    generateResource();
  });

  group("getValue", () {
    late String mockKey;
    late Resource mockResource;

    setUp(() {
      mockResource = mockResources.first;
      mockKey = mockResource.resourceKey!;
    });

    test("should return resource when there exists with the given key",
        () async {
      // arrange
      when(() => mockBox.get(any())).thenAnswer((_) => mockResource);

      // act
      final result = resourceService.getValue(mockKey);
      // assert
      verify(() => mockBox.get(mockKey));
      expect(result, mockResource);
    });
  });

  group("getValues", () {
    test("should return all resources in box", () {
      // arrange
      when(() => mockBox.values).thenAnswer((_) => mockResources);

      // act
      final result = resourceService.getValues();

      // assert
      verify(() => mockBox.values);
      expect(result, mockResources);
    });

    test("should return selected resources", () {
      final selectResources = mockResources.take(3);
      final keys = selectResources.map((e) => e.resourceKey!).toList();
      // arrange
      when(() => mockBox.values).thenAnswer((_) => mockResources);

      // act
      final result = resourceService.getValues(keys: keys);

      // assert
      verify(() => mockBox.values);
      expect(result, selectResources);
    });
  });
}
