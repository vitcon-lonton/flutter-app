part of 'resource.dart';

class ResourceServiceProxy implements IResourceService {
  ResourceServiceProxy(this.synchronizer, this.resourceService);

  @protected
  late final ISynchronizer synchronizer;

  @protected
  late final IResourceService resourceService;

  @override
  void languageChange(int value) {
    resourceService.languageChange(value);
    synchronizer
      ..updateLanguageId(value)
      ..reSync();
  }

  @override
  bool checkValidResource(String key) {
    return resourceService.checkValidResource(key);
  }

  @override
  Resource? getValue(String key) {
    final result = resourceService.getValue(key);

    if (result == null) _syncByKey(key);

    return result;
  }

  @override
  List<Resource?> getValues({List<String>? keys}) {
    final result = resourceService.getValues(keys: keys);

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

    return resourceService.watch(keys: keys);
  }

  @override
  Future clear() => resourceService.clear();

  Future _syncByKey(String key) async {
    if (synchronizer.isSyncing(key)) return;

    return synchronizer.syncByKey(key);
  }
}
