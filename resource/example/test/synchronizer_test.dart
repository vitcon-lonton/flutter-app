import 'dart:convert';

import 'package:aqb_api/aqb_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mocktail/mocktail.dart';

import 'package:resource_example/resource/resource.dart';

class MockBox<T> extends Mock implements Box<T> {}

class MockList<T> extends Mock implements List<T> {}

class MockResource extends Mock implements Resource {}

class MockConfigApi extends Mock implements ConfigApi {}

class MockDataResource extends Mock implements ResourceDto {}

class MockResponse<T> extends Mock implements BaseResponse<T> {}

void main() {
  late int languageId;
  late MockConfigApi mockApi;
  late MockBox<Resource> mockBox;
  late ISynchronizer synchronizer;
  late MockList<String> mockSyncing;
  late List<ResourceDto> mockResources;

  void generateResource() {
    mockResources = [
      ResourceDto()
          .copyWith(languageFid: languageId)
          .copyWith(resourceKey: 'PASSWORD')
          .copyWith(resourceValue: 'Password'),
      ResourceDto()
          .copyWith(languageFid: languageId)
          .copyWith(resourceKey: 'REGISTER')
          .copyWith(resourceValue: 'Register'),
      ResourceDto()
          .copyWith(languageFid: languageId)
          .copyWith(resourceKey: 'EMAIL')
          .copyWith(resourceValue: 'Email'),
      ResourceDto()
          .copyWith(languageFid: languageId)
          .copyWith(resourceKey: 'LAST_NAME')
          .copyWith(resourceValue: 'Last Name'),
      ResourceDto()
          .copyWith(languageFid: languageId)
          .copyWith(resourceKey: 'PHONE_NUMBER')
          .copyWith(resourceValue: 'Phone Number'),
      ResourceDto()
          .copyWith(languageFid: languageId)
          .copyWith(resourceKey: 'SUBMIT')
          .copyWith(resourceValue: 'Submit'),
    ];
  }

  setUpAll(() {
    registerFallbackValue<Resource>(MockResource());
    registerFallbackValue<ResourceDto>(MockDataResource());
    registerFallbackValue<MockList<String>>(MockList<String>());
    registerFallbackValue<MockBox<Resource>>(MockBox<Resource>());
    registerFallbackValue<BaseResponse<String>>(MockResponse<String>());
  });

  setUp(() async {
    languageId = 1;
    mockApi = MockConfigApi();
    mockBox = MockBox<Resource>();
    mockSyncing = MockList<String>();
    synchronizer = Synchronizer(mockApi, mockBox, mockSyncing);
    synchronizer.updateLanguageId(languageId);
    generateResource();
  });

  group("Sync resource", () {
    late String mockKey;
    late String mockKeyEncode;
    late ResourceDto mockResource;
    late BaseResponse<String> successResponse;

    setUp(() async {
      mockResource = mockResources.first;
      mockKey = mockResource.resourceKey!;
      mockKeyEncode = jsonEncode(mockKey);
      successResponse = BaseResponse<String>(
        statusCode: 200,
        message: "Success",
        responseHeader: null,
        fullResponseString: "",
        fullMsg: "",
        isSuccessStatusCode: true,
        aqStatusCode: "200",
        resourceKey: "SUCCESS",
        responseData: mockResource.resourceValue,
      );
    });

    group('API return successfully', () {
      test("should sync to box and return DateTime", () async {
        // arrange
        when(() => mockSyncing.add(any())).thenAnswer((_) => {});
        when(() => mockSyncing.remove(any())).thenAnswer((_) => true);
        when(() {
          return mockApi.getResourceValue(any(), any());
        }).thenAnswer((_) async => successResponse);
        when(() {
          return mockBox.put(any(), any());
        }).thenAnswer((_) => Future.value(null));

        // act
        final result = await synchronizer.syncByKey(mockKey);

        // assert
        verify(() => mockBox.put(mockKey, any()));
        verify(() => mockApi.getResourceValue(languageId, mockKeyEncode));
        expect(result, isNotNull);
        expect(result, isInstanceOf<DateTime>());
      });

      test("should add and remove from syncing List when syncing", () async {
        // arrange
        when(() => mockSyncing.add(any())).thenAnswer((_) => {});
        when(() => mockSyncing.remove(any())).thenAnswer((_) => true);
        when(() {
          return mockApi.getResourceValue(any(), any());
        }).thenAnswer((_) async => successResponse);
        when(() {
          return mockBox.put(any(), any());
        }).thenAnswer((_) => Future.value(null));

        // act
        await synchronizer.syncByKey(mockKey);

        // assert
        verify(() => mockSyncing.add(mockKey));
        verify(() => mockSyncing.remove(mockKey));
      });
    });

    group('API return unsuccessfully', () {
      test("should add and remove from syncing List when syncing", () async {
        // arrange
        when(() => mockSyncing.add(any())).thenAnswer((_) => {});
        when(() => mockSyncing.remove(any())).thenAnswer((_) => true);
        when(() {
          return mockApi.getResourceValue(any(), any());
        }).thenThrow(Exception());

        // act
        await synchronizer.syncByKey(mockKey);

        // assert
        verify(() => mockSyncing.add(mockKey));
        verify(() => mockSyncing.remove(mockKey));
      });

      test("should return null and not sync to box when throw exception",
          () async {
        // arrange
        when(() => mockSyncing.add(any())).thenAnswer((_) => {});
        when(() => mockSyncing.remove(any())).thenAnswer((_) => true);
        when(() {
          return mockApi.getResourceValue(any(), any());
        }).thenThrow(Exception());

        // act
        final result = await synchronizer.syncByKey(mockKey);

        // assert
        verify(() => mockApi.getResourceValue(languageId, mockKeyEncode));
        verifyNever(() => mockBox.put(mockKey, any()));
        expect(result, isNull);
      });
    });
  });
}
