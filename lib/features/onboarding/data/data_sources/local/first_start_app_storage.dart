abstract interface class FirstStartAppStorage {
  bool load();

  Future<void> save(bool isFirstRun);

  Future<void> clear();
}

