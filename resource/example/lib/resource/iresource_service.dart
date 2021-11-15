part of 'resource.dart';

mixin IResourceService {
  Future clear();

  void languageChange(int value);

  Resource? getValue(String key);

  List<Resource?> getValues({List<String>? keys});

  Stream<List<Resource>?> watch({List<String>? keys});
}
