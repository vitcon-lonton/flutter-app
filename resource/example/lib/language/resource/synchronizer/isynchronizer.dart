mixin ISynchronizer {
  late int language;
  Future syncResource(String key);
}
