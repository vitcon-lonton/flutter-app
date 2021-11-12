mixin ISynchronizer {
  bool isSyncing(String key);

  void updateLanguageId(int value);

  Future<DateTime?> syncByKey(String key);
}
