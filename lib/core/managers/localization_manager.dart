// class LocalizationManager extends ChangeNotifier with ILanguageManager {
//   final ILanguageService languageService;
//
//   LanguageManager(this.languageService) {
//     changeLanguage(initialResources);
//   }
//   Map<String, dynamic>? resources;
//   String initialResources = Languages.en.name;
//
//   @override
//   Future<void> changeLanguage(String language) async {
//     final response = await languageService.fetchSpesificResources(language);
//     resources = response;
//     initialResources = language;
//     notifyListeners();
//   }
//
//   Future<List<String>> fetchLanguageList() async {
//     return (await languageService.fetchLanguageList()) ?? [];
//   }
// }