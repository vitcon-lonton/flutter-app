import 'dart:convert';

import 'package:aqb_api/aqb_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:resource_example/resource/resource.dart';

import 'mock.dart';

void main() {
  late int languageId;
  late MockConfigApi mockApi;
  late MockBox<Resource> mockBox;
  late ISynchronizer synchronizer;
  late MockList<String> mockSyncing;
  late List<ResourceDto> mockResourcesDto;

  List<ResourceDto> genResourcesWithLanguage(int language) {
    return [
      ResourceDto()
          .copyWith(languageFid: language)
          .copyWith(resourceKey: 'PASSWORD')
          .copyWith(resourceValue: 'Password'),
      ResourceDto()
          .copyWith(languageFid: language)
          .copyWith(resourceKey: 'REGISTER')
          .copyWith(resourceValue: 'Register'),
      ResourceDto()
          .copyWith(languageFid: language)
          .copyWith(resourceKey: 'EMAIL')
          .copyWith(resourceValue: 'Email'),
      ResourceDto()
          .copyWith(languageFid: language)
          .copyWith(resourceKey: 'LAST_NAME')
          .copyWith(resourceValue: 'Last Name'),
      ResourceDto()
          .copyWith(languageFid: language)
          .copyWith(resourceKey: 'PHONE_NUMBER')
          .copyWith(resourceValue: 'Phone Number'),
      ResourceDto()
          .copyWith(languageFid: language)
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
    mockResourcesDto = genResourcesWithLanguage(languageId);
  });

  group("Sync resource", () {
    late String mockKey;
    late String mockKeyEncode;
    late ResourceDto mockResource;
    late BaseResponse<String> successResponse;

    setUp(() async {
      mockResource = mockResourcesDto.first;
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

  group("Resync resource", () {
    late List<String> keys;
    late ResourceDto mockResource;
    late List<Resource> mockResources;
    late BaseResponse<String> errorResponse;
    late BaseResponse<String> successResponse;

    setUp(() async {
      mockResource = mockResourcesDto.first;

      mockResources = mockResourcesDto.map((e) => e.toJson()).map((json) {
        return Resource.fromDto(json);
      }).toList();

      keys = mockResources.map((e) => e.resourceKey!).toList();

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

      errorResponse = BaseResponse<String>(
        statusCode: 400,
        message: "Failed",
        responseHeader: null,
        fullResponseString: "",
        fullMsg: "",
        isSuccessStatusCode: false,
        aqStatusCode: "400",
        resourceKey: "FAILED",
      );
    });

    group('API return successfully', () {
      test("Should resync all resources", () async {
        final apiCalled = keys.length;
        final apiSuccessCalled = apiCalled;
        final syncingAddCalled = apiCalled;
        final syncingRemoveCalled = syncingAddCalled;
        final boxPutCalled = apiSuccessCalled;

        // arrange
        when(() => mockSyncing.add(any())).thenAnswer((_) => {});
        when(() => mockSyncing.remove(any())).thenAnswer((_) => true);
        when(() {
          return mockApi.getResourceValue(any(), any());
        }).thenAnswer((_) async => successResponse);
        when(() {
          return mockBox.put(any(), any());
        }).thenAnswer((_) => Future.value(null));
        when(() => mockBox.values).thenAnswer((_) => mockResources);

        // act
        await synchronizer.reSync();

        // assert

        verify(() => mockBox.values).called(1);
        verify(() => mockBox.put(any(), any())).called(boxPutCalled);
        verify(() => mockSyncing.add(any())).called(syncingAddCalled);
        verify(() => mockSyncing.remove(any())).called(syncingRemoveCalled);
        verify(() => mockApi.getResourceValue(any(), any())).called(apiCalled);
      });
    });

    group('API return unsuccessfully', () {
      test("should sync to box and return DateTime", () async {
        final apiCalled = keys.length;
        final syncingAddCalled = apiCalled;
        final apiSuccessCalled = apiCalled - 1;
        final syncingRemoveCalled = apiCalled;
        final boxPutCalled = apiSuccessCalled;

        // arrange
        when(() => mockSyncing.add(any())).thenAnswer((_) => {});
        when(() => mockSyncing.remove(any())).thenAnswer((_) => true);
        when(() => mockBox.values).thenAnswer((_) => mockResources);
        when(() {
          return mockBox.put(any(), any());
        }).thenAnswer((_) => Future.value(null));
        when(() {
          return mockApi.getResourceValue(any(), any());
        }).thenAnswer((_) async {
          final args = _.positionalArguments;
          final key = args.last as String;

          if (key.contains(mockResources[2].resourceKey!)) return errorResponse;

          return successResponse;
        });

        // act
        await synchronizer.reSync();

        // assert
        verify(() => mockBox.values);
        verify(() => mockBox.put(any(), any())).called(boxPutCalled);
        verify(() => mockSyncing.add(any())).called(syncingAddCalled);
        verify(() => mockSyncing.remove(any())).called(syncingRemoveCalled);
        verify(() => mockApi.getResourceValue(any(), any())).called(apiCalled);
      });
    });
  });
}
