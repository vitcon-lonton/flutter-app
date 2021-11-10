import 'dart:convert';

import 'package:aqb_api/aqb_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mocktail/mocktail.dart';

import 'package:resource_example/language/resource/resource.dart';

class MockBox<T> extends Mock implements Box<T> {}

class MockResource extends Mock implements Resource {}

class MockConfigApi extends Mock implements ConfigApi {}

class MockDataResource extends Mock implements ResourceDto {}

class MockResponse<T> extends Mock implements BaseResponse<T> {}

void main() {
  late int languageId;
  late MockConfigApi mockApi;
  late MockBox<Resource> mockBox;
  late ISynchronizer synchronizer;
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
    registerFallbackValue<MockBox<Resource>>(MockBox<Resource>());
    registerFallbackValue<BaseResponse<String>>(MockResponse<String>());
  });

  setUp(() async {
    languageId = 1;
    mockApi = MockConfigApi();
    mockBox = MockBox<Resource>();
    synchronizer = Synchronizer(mockApi, mockBox);
    synchronizer.updateLanguageId(languageId);
    generateResource();
  });

  group("sync resource", () {
    test("should sync when exists with the given key", () async {
      final mockResource = mockResources.first;
      final mockKey = mockResource.resourceKey!;
      final mockKeyEncode = jsonEncode(mockKey);
      final successResponse = BaseResponse<String>(
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

      // arrange
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
      expect(result, isInstanceOf<dynamic>());
      // expect(() => call(resourceKey), returnsNormally);
      //   final cacheResource = Resource.now()
      // .copyWith(resourceKey: resourceKey)
      // .copyWith(languageFid: languageId)
      // .copyWith(resourceValue: mockResource.resourceValue);
    });

    test("shouldn't sync when exists with the given key", () async {
      final mockResource = mockResources.first;
      final mockKey = mockResource.resourceKey!;
      final mockKeyEncode = jsonEncode(mockKey);

      when(() {
        return mockApi.getResourceValue(any(), any());
      }).thenThrow(Exception());

      // act
      final call = synchronizer.syncByKey;

      // assert
      expect(() => call(mockKey), throwsA(isInstanceOf<Exception>()));
      verify(() => mockApi.getResourceValue(languageId, mockKeyEncode));
      verifyNever(() => mockBox.put(mockKey, any()));
    });
  });
}
