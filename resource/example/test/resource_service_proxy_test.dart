import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:resource_example/language/resource/resource.dart';

class MockResource extends Mock implements Resource {}

class MockSynchronizer extends Mock implements ISynchronizer {}

class MockResourceService extends Mock implements ResourceService {}

void main() {
  late int languageId;
  late List<Resource> mockResources;
  late MockResourceService mockService;
  late MockSynchronizer mockSynchronizer;
  late ResourceServiceProxy resourceServiceProxy;

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
    registerFallbackValue<Resource>(MockResource());
  });

  setUp(() {
    languageId = 1;
    mockService = MockResourceService();
    mockSynchronizer = MockSynchronizer();
    resourceServiceProxy = ResourceServiceProxy(mockService, mockSynchronizer);
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
      when(() => mockService.getValue(any())).thenAnswer((_) => mockResource);

      // act
      final result = resourceServiceProxy.getValue(mockKey);

      // assert
      verify(() => mockService.getValue(mockKey));
      expect(result, mockResource);
    });

    test("should return null and call singleSync when resource not exist",
        () async {
      // arrange
      when(() => mockService.getValue(any())).thenAnswer((_) => null);
      when(() {
        return mockSynchronizer.syncByKey(any());
      }).thenAnswer((_) => Future.value());

      // act
      final result = resourceServiceProxy.getValue(mockKey);

      // assert
      verify(() => mockService.getValue(mockKey));
      verify(() => mockSynchronizer.syncByKey(mockKey));
      expect(result, isNull);
    });
  });

  group("getValues", () {
    test("should return all resources in box", () {
      // arrange
      when(() => mockService.getValues()).thenAnswer((_) => mockResources);

      // act
      final result = resourceServiceProxy.getValues();

      // assert
      verify(() => mockService.getValues());
      expect(result, mockResources);
    });

    test("should request sync resources when resources not exist", () {
      // arrange
      when(() => mockService.getValues()).thenAnswer((_) => []);

      // act
      final result = resourceServiceProxy.getValues();

      // assert
      verify(() => mockService.getValues());
      expect(result, mockResources);
    });

    test("should return selected resources", () {
      final selectResources = mockResources.take(3).toList();
      final keys = selectResources.map((e) => e.resourceKey!).toList();

      // arrange
      when(() {
        return mockService.getValues(keys: any(named: 'keys'));
      }).thenAnswer((_) => selectResources);

      // act
      final result = resourceServiceProxy.getValues(keys: keys);

      // assert
      verify(() => mockService.getValues(keys: keys));
      expect(result, selectResources);
    });
  });
}
