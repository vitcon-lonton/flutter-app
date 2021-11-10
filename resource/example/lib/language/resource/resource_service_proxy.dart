part of 'resource.dart';

class ResourceServiceProxy implements IResourceService {
  final IResourceService service;
  final ISynchronizer synchronizer;

  ResourceServiceProxy(this.service, this.synchronizer);

  @override
  void languageChange(int value) {
    service.languageChange(value);
    synchronizer.updateLanguageId(value);

    _syncByKeys(
      service.getValues().map((e) => e?.resourceKey).whereNotNull().toList(),
    );
  }

  @override
  Resource? getValue(String key) {
    final result = service.getValue(key);

    if (result == null) _syncByKey(key);

    return result;
  }

  @override
  List<Resource?> getValues({List<String>? keys}) {
    final result = service.getValues(keys: keys);

    if ((keys?.isNotEmpty ?? false) && result.contains(null)) {
      for (var i = 0; i < keys!.length; i++) {
        _syncByKey(key);
      }
    }

    return result;
  }

  @override
  Stream<List<Resource>?> watch({List<String>? keys}) {
    if (keys?.isNotEmpty ?? true) {
      for (var key in keys!) {
        getValue(key);
      }
    }

    return service.watch(keys: keys);
  }

  @override
  Future clear() => service.clear();

  _syncByKey(String key) async {
    final isSyncing = synchronizer.syncingKeys().contains(key);

    if (isSyncing) return;

    await synchronizer.syncByKey(key);
  }

  _syncByKeys(List<String> keys) async {
    for (var key in keys) {
      _syncByKey(key);
    }
  }
}
