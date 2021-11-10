mixin ISynchronizer {
  List<String> syncingKeys();

  void updateLanguageId(int value);

  Future<DateTime?> syncByKey(String key);
}
