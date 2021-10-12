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
    synchronizer.language == value;
    service.getValues()?.forEach((element) {});
  }

  @override
  String? getValue(String key) {
    final result = service.getValue(key);
    if (result == null) _requestSync(key);
    return result;
  }

  @override
  List<String?>? getValues({List<String>? keys}) {
    final result = service.getValues(keys: keys);

    if (keys?.isEmpty ?? true) return result;

    if (result == null || result.contains(null)) {
      for (var i = 0; i < keys!.length; i++) {
        _requestSync(key);
      }
    }

    return result;
  }

  @override
  Stream<List<ResourceHive>?> watch({List<String>? keys}) {
    if (keys?.isNotEmpty ?? true) {
      for (var key in keys!) {
        getValue(key);
      }
    }

    return service.watch(keys: keys);
  }

  _requestSync(String key) async {
    try {
      if (_syncing.contains(key)) return;
      _syncing.add(key);
      await synchronizer.syncResource(key);
    } catch (e) {
      _syncing.remove(key);
    }
  }
}
