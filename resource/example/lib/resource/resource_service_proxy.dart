part of 'resource.dart';

class ResourceServiceProxy implements IResourceService {
  final IResourceService service;
  final ISynchronizer synchronizer;
  final List<String> _syncing = [];

  ResourceServiceProxy(this.service, this.synchronizer);

  @override
  int get language => service.language;

  @override
  void languageChange(int value) {
    service.languageChange(value);
    // synchronizer.setLanguage(value);
  }

  @override
  String? getResource(String key) {
    final res = service.getResource(key);
    if (res == null) _requestSync(key);
    return res;
  }

  @override
  ValueListenable<Box<ResourceEntity>> listenable({List<String>? keys}) {
    return service.listenable(keys: keys);
  }

  _requestSync(String key) async {
    if (_syncing.contains(key)) return;
    _syncing.add(key);
    try {
      await synchronizer.syncResource(key);
    } catch (e) {
      _syncing.remove(key);
    }
  }
}
