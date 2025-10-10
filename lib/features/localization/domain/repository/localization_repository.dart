

abstract interface class LocalizationRepository {
  Future<Map<String, dynamic>?> fetchSpecificResources(String key);
  Future<List<String>?> fetchLanguageList();
}