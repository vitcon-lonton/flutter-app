mixin ISynchronizer {
  Future singleSync(String key);

  void updateLanguageId(int value);
}
