import 'package:aqb_api/aqb_api.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';
import 'package:resource_example/resource/resource.dart';

class MockList<T> extends Mock implements List<T> {}

class MockConfigApi extends Mock implements ConfigApi {}

class MockDataResource extends Mock implements ResourceDto {}

class MockResponse<T> extends Mock implements BaseResponse<T> {}

class MockBox<T> extends Mock implements Box<T> {}

class MockResource extends Mock implements Resource {}

class MockSynchronizer extends Mock implements ISynchronizer {}

class MockResourceService extends Mock implements ResourceService {}

class MockResourceServiceProxy extends Mock implements ResourceServiceProxy {}
