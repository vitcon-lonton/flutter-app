import 'package:aqb_api/aqb_api.dart' as data;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
part 'resource.g.dart';

var store = {};
var version = 0.0;
var languageId = 1;
const key = 'resource';
const key2 = 'resource';

@HiveType(typeId: 0)
class ResourceModel extends HiveObject implements data.Resource {
  @override
  @HiveField(0)
  final String? resourceKey;

  @override
  @HiveField(1)
  final String? resourceValue;

  @override
  @HiveField(2)
  final int? languageFid;

  ResourceModel({
    this.languageFid,
    this.resourceKey,
    this.resourceValue,
  });

  @override
  data.$ResourceCopyWith<data.Resource> get copyWith =>
      throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }

  @override
  String? get typeOfResource => throw UnimplementedError();
}

class ResourceManager {
  final data.ConfigService service;
  late final Box<ResourceModel> box;

  ResourceManager(this.service);

  init() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    // await Hive.initFlutter();
    Hive.init(appDocumentDirectory.path);
    Hive.registerAdapter(ResourceModelAdapter());
    box = await Hive.openBox('resources');
  }

  bool shouldSync() => true;

  Future syncResource(String resourceKey) async {
    final res = await service.getResourceValue(languageId, resourceKey);
    if (!res.valid) return;
    final resource = ResourceModel()
        .copyWith(languageFid: languageId)
        .copyWith(resourceKey: resourceKey)
        .copyWith(resourceValue: res.responseData) as ResourceModel;
    box.add(resource);
  }
}

// class ResourceDAO {
//   final Map<String?, String?> store;

//   ResourceDAO(this.store);

//   write(data.Resource item) {
//     final key = item.resourceKey;
//     final value = item.resourceValue;
//     store.update(key, (v) => value);
//   }

//   read(String key) {
//     if (!store.containsKey(key)) return null;
//     return store[key];
//   }
// }
