mixin ISynchronizer {
  int get language;
  bool onSync(String key);
  Future syncResource(String key);
  void languageChanged(int value);
}
