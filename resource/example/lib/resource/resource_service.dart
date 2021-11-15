part of 'resource.dart';

class ResourceService implements IResourceService {
  ResourceService(this.box) {
    language = 1;
  }

  @protected
  late int language;

  @protected
  final Box<Resource> box;

  @override
  Future<void> clear() => box.clear();

  @override
  void languageChange(int value) => language = value;

  @override
  Resource? getValue(String key) => box.get(key);

  @override
  List<Resource?> getValues({List<String>? keys}) {
    if (keys?.isEmpty ?? true) return box.values.toList();

    return box.values.where((item) {
      return keys!.contains(item.resourceKey);
    }).toList();
  }

  @override
  Stream<List<Resource>?> watch({List<String>? keys}) {
    if (keys != null) {
      return box.watch().where((event) {
        return keys.contains(event.key);
      }).map((event) => box.values.toList());
    }

    return box.watch().map((event) => box.values.toList());
  }
}
