part of 'resource.dart';

class ResourceServiceProxy implements IResourceService {
  final IResourceService service;
  final ISynchronizer synchronizer;
  final List<String> _syncing = [];

  ResourceServiceProxy(this.service, this.synchronizer);

  @override
  void languageChange(int value) {
    service.languageChange(value);
    synchronizer.updateLanguageId(value);

    service.getValues().forEach((element) {
      // print(element);
      if (element?.resourceKey == null) return;

      _requestSync(element!.resourceKey!);
    });
  }

  @override
  Resource? getValue(String key) {
    final result = service.getValue(key);

    if (result == null) _requestSync(key);

    return result;
  }

  @override
  List<Resource?> getValues({List<String>? keys}) {
    final result = service.getValues(keys: keys);

    if ((keys?.isNotEmpty ?? false) && result.contains(null)) {
      for (var i = 0; i < keys!.length; i++) {
        _requestSync(key);
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

  _requestSync(String key) async {
    try {
      if (_syncing.contains(key)) return;
      _syncing.add(key);
      await synchronizer.singleSync(key);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    } finally {
      _syncing.remove(key);
    }
  }
}
