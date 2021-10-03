part of 'resource.dart';

mixin IResourceService {
  int get language;

  void languageChange(int value);

  String? getResource(String key);

  ValueListenable<Box<ResourceEntity>> listenable({List<String>? keys});
}
