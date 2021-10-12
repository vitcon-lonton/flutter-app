part of 'resource.dart';

class ResourceService implements IResourceService {
  ResourceService(this.box);

  late int _language = 1;
  final Box<ResourceHive> box;

  @override
  int get language => _language;

  @override
  void languageChange(int value) => _language = value;

  @override
  String? getValue(String key) => box.get(key)?.resourceValue;

  @override
  List<String?>? getValues({List<String>? keys}) {
    if (keys?.isEmpty ?? true) {
      return box.values.map((item) => item.resourceValue).toList();
    }

    return box.values.where((item) {
      return keys!.contains(item.resourceKey);
    }).map((item) {
      return item.resourceValue;
    }).toList();
  }

  @override
  Stream<List<ResourceHive>?> watch({List<String>? keys}) {
    if (keys == null) {
      return box.watch().where((event) {
        return keys!.contains(event.key);
      }).map((event) => box.values.toList());
    }

    return box.watch().map((event) => box.values.toList());
  }
}
