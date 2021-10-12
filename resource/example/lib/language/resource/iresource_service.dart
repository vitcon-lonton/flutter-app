part of 'resource.dart';

mixin IResourceService {
  int get language;

  void languageChange(int value);

  String? getValue(String key);

  List<String?>? getValues({List<String>? keys});

  Stream<List<ResourceHive>?> watch({List<String>? keys});
}
