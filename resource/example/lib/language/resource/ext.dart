part of 'resource.dart';

extension ResourceX on IResourceService {
  ValueListenable<List<String?>?> listenable({List<String>? keys}) {
    return _ResourcesListenable(this, keys);
  }
}

class _ResourcesListenable extends ValueListenable<List<String?>?> {
  final IResourceService service;

  final List<String>? keys;

  final List<VoidCallback> _listeners = [];

  StreamSubscription? _subscription;

  _ResourcesListenable(this.service, this.keys);

  @override
  void addListener(VoidCallback listener) {
    if (_listeners.isEmpty) {
      _subscription = service.watch(keys: keys).listen((_) {
        for (var listener in _listeners) {
          listener();
        }
      });
    }

    _listeners.add(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);

    if (_listeners.isEmpty) {
      _subscription?.cancel();
      _subscription = null;
    }
  }

  @override
  List<String?>? get value {
    return service.getValues(keys: keys).map((e) => e?.resourceValue).toList();
  }

  // @override
  // String? get value => service.getValue(key);
}
