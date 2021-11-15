import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:resource_example/resource/resource.dart';

class MockResource extends Mock implements Resource {}

class MockSynchronizer extends Mock implements ISynchronizer {}

class MockResourceService extends Mock implements ResourceService {}

class MockResourceServiceProxy extends Mock implements ResourceServiceProxy {}

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
    resourceServiceProxy = ResourceServiceProxy(mockSynchronizer, mockService);
    generateResource();
  });

  group("getValue", () {
    late String mockKey;
    late Resource mockResource;

    setUp(() {
      mockResource = mockResources.first;
      mockKey = mockResource.resourceKey!;
    });

    group('Resource exist', () {
      test("Should return resource", () async {
        // arrange
        when(() => mockService.getValue(any())).thenAnswer((_) => mockResource);

        // act
        final result = resourceServiceProxy.getValue(mockKey);

        // assert
        verify(() => mockService.getValue(mockKey));
        verifyNever(() => mockSynchronizer.syncByKey(mockKey));
        expect(result, mockResource);
      });
    });

    group('Resource not exist', () {
      // arrange

      setUp(() {
        when(() => mockService.getValue(any())).thenAnswer((_) => null);
        when(() {
          return mockSynchronizer.syncByKey(any());
        }).thenAnswer((_) => Future.value());
      });

      test("Should call getValue", () async {
        // act
        resourceServiceProxy.getValue(mockKey);

        // assert
        verify(() => mockService.getValue(mockKey));
      });

      test("Should return null", () async {
        // act
        final result = resourceServiceProxy.getValue(mockKey);

        // assert
        expect(result, isNull);
      });

      test("Should request check key is syncing", () async {
        // arrange
        when(() => mockSynchronizer.isSyncing(any())).thenAnswer((_) => true);

        // act
        resourceServiceProxy.getValue(mockKey);

        // assert
        verify(() => mockSynchronizer.isSyncing(mockKey));
      });
    });
  });

  group('Request sync', () {
    late String mockKey;
    late Resource mockResource;

    setUp(() {
      mockResource = mockResources.first;
      mockKey = mockResource.resourceKey!;
    });

    // arrange
    when(() => mockService.getValue(any())).thenAnswer((_) => null);

    test("Should check key is syncing before sync", () async {
      // arrange
      when(() => mockSynchronizer.isSyncing(any())).thenAnswer((_) => false);

      // act
      resourceServiceProxy.getValue(mockKey);

      // assert
      verify(() => mockSynchronizer.isSyncing(mockKey));
    });

    test("Should request sync when key is not syncing", () async {
      // arrange
      when(() => mockSynchronizer.isSyncing(any())).thenAnswer((_) => false);

      // act
      resourceServiceProxy.getValue(mockKey);

      // assert
      verify(() => mockSynchronizer.syncByKey(mockKey));
    });

    test("Shouldn't request sync when key is syncing", () async {
      when(() => mockSynchronizer.isSyncing(any())).thenAnswer((_) => true);

      // act
      resourceServiceProxy.getValue(mockKey);

      // assert
      verifyNever(() => mockSynchronizer.syncByKey(mockKey));
    });
  });

  group("getValues", () {
    test("Should return all response from service", () {
      // arrange
      when(() => mockService.getValues()).thenAnswer((_) => mockResources);

      // act
      final result = resourceServiceProxy.getValues();

      // assert
      verify(() => mockService.getValues());
      expect(result, mockResources);
    });

    test("Should call getValues from service with matching keys", () {
      final selectResources = mockResources.take(3).toList();
      final keys = selectResources.map((e) => e.resourceKey!).toList();

      // arrange
      when(() {
        return mockService.getValues(keys: any(named: 'keys'));
      }).thenAnswer((_) => selectResources);

      // act
      resourceServiceProxy.getValues(keys: keys);

      // assert
      verify(() => mockService.getValues(keys: keys));
    });

    group('Resources not exist', () {
      test("Should request sync resources when resources not exist", () {
        // arrange
        when(() => mockService.getValues()).thenAnswer((_) => []);

        // act
        final result = resourceServiceProxy.getValues();

        // assert
        verify(() => mockService.getValues());
        expect(result, isEmpty);
      });
    });
  });
}
