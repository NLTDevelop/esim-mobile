
import 'dart:async';

import 'package:esim_mob_app/core/client/secure_storage_dao/flutter_secure_storage_dao.dart';
import 'package:esim_mob_app/core/utils/logger/logger.dart';
import 'package:esim_mob_app/features/auth/domain/use_cases/login_google_use_case.dart';
import 'package:esim_mob_app/features/localization/data/repository/localization_repository_impl.dart';
import 'package:esim_mob_app/features/localization/domain/repository/localization_repository.dart';
import 'package:esim_mob_app/features/onboarding/data/data_sources/local/first_start_app_storage_impl.dart';
import 'package:esim_mob_app/features/onboarding/data/repository/onboarding_repository_impl.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/auth/data/data_sources/local/session_storage.dart';
import 'features/auth/data/data_sources/local/session_storage_impl.dart';
import 'features/auth/data/repository/auth_repository_impl.dart';
import 'features/auth/domain/repository/auth_repository.dart';
import 'features/auth/domain/use_cases/login_apple_use_case.dart';

typedef _InitializationStep = FutureOr<void> Function();

final injector = GetIt.instance;

final Map<String, _InitializationStep> _initializationSteps = {
  'User': () {
    // injector.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSource(injector<SlonovaApi>().dio));
    // injector.registerLazySingleton<UserRepository>(
    //         () => UserRepositoryImpl(userRemoteDataSource: injector<UserRemoteDataSource>()));
    // injector.registerLazySingleton(() => FetchCurrentUserUseCase(userRepository: injector<UserRepository>()));
    // injector.registerLazySingleton(() => DeleteCurrentUserUseCase(userRepository: injector<UserRepository>()));
    // injector.registerLazySingleton(() => UpdateCurrentUserUseCase(userRepository: injector<UserRepository>()));
  },
  'Repository': (){
    injector.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  },
  'UseCases': (){
    final loginGoogleUseCase = LoginGoogleUseCase(authRepository: injector<AuthRepository>());
    injector.registerLazySingleton(() => loginGoogleUseCase);
    final loginAppleUseCase = LoginAppleUseCase(authRepository: injector<AuthRepository>());
    injector.registerLazySingleton(() => loginAppleUseCase);
  }
};

Future<void> initializeDependencies({
  void Function(int progress, String message)? onProgress,
  ///required void Function(UserModel user) onAuth,
}) async {
  final stopwatch = Stopwatch()..start();
  final totalSteps = _initializationSteps.length;
  int currentStep = 0;
  onProgress?.call(currentStep, 'Initializing dependencies...');
  try {
    for (final step in _initializationSteps.entries) {
      //TODO: Remove delayed
      await Future.delayed(const Duration(milliseconds: 50));
      final progress = (currentStep * 100 ~/ totalSteps).clamp(0, 100);
      currentStep++;
      Logger.info('Progress: ${step.key}');
      onProgress?.call(progress, step.key);
      await step.value();
    }
    // onAuth.call(await fetchCurrentUser());
    onProgress?.call(100, 'Dependencies initialized in ${stopwatch.elapsedMilliseconds}ms');
  } finally {
    stopwatch.stop();
  }
}


Future<void> baseSteps() async{
  AndroidOptions _getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
  );
  final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
  final sharedPreferences = await SharedPreferences.getInstance();
  final storageDao = FlutterSecureStorageDao(secureStorage: storage, sharedPreferences: sharedPreferences);
  injector.registerLazySingleton(() => LocalizationRepositoryImpl());
  injector.registerLazySingleton<SessionStorage>(() => SessionStorageImpl(secureStorageDao: storageDao));
  injector.registerLazySingleton(() => FirstStartAppStorageImpl(secureStorageDao: storageDao));
  injector.registerLazySingleton(() => OnBoardingRepositoryImpl(firstStartAppStorage: injector<FirstStartAppStorageImpl>()));

}