
import 'package:esim_mob_app/features/localization/domain/repository/localization_repository.dart';

final class LocalizationRepositoryImpl implements LocalizationRepository{
  @override
  Future<List<String>?> fetchLanguageList() async {
    return [
      'Translate'
    ];
  }

  @override
  Future<Map<String, dynamic>?> fetchSpecificResources(String key) async{
    return {
      'welcome': 'Welcome',
      'home': 'Home',
      'store': 'Store',
      'profile': 'Profile',
      'help': 'Help'
    };
  }

}