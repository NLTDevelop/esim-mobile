
import 'package:esim_mob_app/core/constants/languages.dart';
import 'package:esim_mob_app/features/localization/domain/repository/localization_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalizationCubit extends Cubit<String>{
  LocalizationCubit(this.localizationRepository) : super(Languages.en.name);

  final LocalizationRepository localizationRepository;

  Map<String, dynamic>? resources;
  String initialResources = Languages.uk.name;

  Future<void> changeLanguage(String language) async {
    debugPrint('Changed language to $language');
    final response = await localizationRepository.fetchSpecificResources(language);
    resources = response;
    initialResources = language;
    emit(language);
  }

  Future<List<String>> fetchLanguageList() async {
    return (await localizationRepository.fetchLanguageList()) ?? [];
  }
}