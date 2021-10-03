part of 'resource.dart';

class ResourceServiceProxy implements IResourceService {
  final IResourceService service;
  final ISynchronizer synchronizer;

  ResourceServiceProxy(this.service, this.synchronizer);

  @override
  int get language => service.language;

  @override
  void languageChange(int value) {
    service.languageChange(value);
    synchronizer.languageChanged(value);
  }

  @override
  String? getResource(String key) {
    final res = service.getResource(key);
    if (res == null) _syncs(key);
    return res;
  }

  @override
  ValueListenable<Box<ResourceEntity>> listenable({List<String>? keys}) {
    return service.listenable(keys: keys);
  }

  _syncs(String key) async {
    if (synchronizer.onSync(key)) return Future.value(null);
    await synchronizer.syncResource(key);
  }
}
