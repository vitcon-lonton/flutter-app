part of 'resource.dart';

class ResourceService implements IResourceService {
  ResourceService(this.box);

  late int _language = 1;
  final Box<ResourceEntity> box;

  @override
  int get language => _language;

  @override
  void languageChange(int value) => _language = value;

  @override
  String? getResource(String key) => box.get(key)?.resourceValue;

  @override
  ValueListenable<Box<ResourceEntity>> listenable({List<String>? keys}) {
    return box.listenable(keys: keys);
  }
}
