
import 'dart:async';

import 'package:esim_mob_app/core/client/rest/awinst_rest_api.dart';
import 'package:esim_mob_app/core/client/secure_storage_dao/flutter_secure_storage_dao.dart';
import 'package:esim_mob_app/core/utils/logger/logger.dart';
import 'package:esim_mob_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:esim_mob_app/features/auth/data/models/user_model.dart';
import 'package:esim_mob_app/features/auth/domain/use_cases/login_google_use_case.dart';
import 'package:esim_mob_app/features/auto_top_up/data/data_sources/remote/auto_top_up_remote_data_source.dart';
import 'package:esim_mob_app/features/auto_top_up/domain/repositories/auto_top_up_repository.dart';
import 'package:esim_mob_app/features/auto_top_up/domain/use_cases/fetch_activation_top_up_list_use_case.dart';
import 'package:esim_mob_app/features/auto_top_up/domain/use_cases/update_auto_top_up_use_case.dart';
import 'package:esim_mob_app/features/checkout/data/data_sources/remote/checkout_remote_data_source.dart';
import 'package:esim_mob_app/features/checkout/data/repository/checkout_repository_impl.dart';
import 'package:esim_mob_app/features/checkout/domain/repository/checkout_repository.dart';
import 'package:esim_mob_app/features/checkout/domain/use_cases/purchase_esim_by_balance.dart';
import 'package:esim_mob_app/features/checkout/domain/use_cases/purchase_esim_by_card_use_case.dart';
import 'package:esim_mob_app/features/contact_us/data/data_sources/remote/contact_us_remote_data_source.dart';
import 'package:esim_mob_app/features/contact_us/data/repositories/contact_repository_impl.dart';
import 'package:esim_mob_app/features/contact_us/domain/repositories/contact_repository.dart';
import 'package:esim_mob_app/features/contact_us/domain/use_cases/send_message_to_contact_use_case.dart';
import 'package:esim_mob_app/features/deposit/data/data_sources/remote/deposit_remote_data_source.dart';
import 'package:esim_mob_app/features/deposit/data/repository/deposit_repository_impl.dart';
import 'package:esim_mob_app/features/deposit/domain/repositories/deposit_repository.dart';
import 'package:esim_mob_app/features/deposit/domain/use_cases/add_balance_use_case.dart';
import 'package:esim_mob_app/features/history/data/data_sources/remote/history_remote_data_source.dart';
import 'package:esim_mob_app/features/history/data/repository/history_repository_impl.dart';
import 'package:esim_mob_app/features/history/domain/repositories/history_repository.dart';
import 'package:esim_mob_app/features/history/domain/use_cases/fetch_history_use_case.dart';
import 'package:esim_mob_app/features/home/domain/use_cases/fetch_user_esim_use_case.dart';
import 'package:esim_mob_app/features/localization/data/repository/localization_repository_impl.dart';
import 'package:esim_mob_app/features/notifcations/data/data_sources/local/fcm_token_storage.dart';
import 'package:esim_mob_app/features/notifcations/data/data_sources/local/fcm_token_storage_impl.dart';
import 'package:esim_mob_app/features/notifcations/data/data_sources/remote/fcm_token_remote_data_source.dart';
import 'package:esim_mob_app/features/notifcations/data/repository/token_repository_impl.dart';
import 'package:esim_mob_app/features/notifcations/domain/repository/token_repository.dart';
import 'package:esim_mob_app/features/notifcations/domain/use_cases/token_logout_use_case.dart';
import 'package:esim_mob_app/features/onboarding/data/data_sources/local/first_start_app_storage_impl.dart';
import 'package:esim_mob_app/features/onboarding/data/repository/onboarding_repository_impl.dart';
import 'package:esim_mob_app/features/profile/domain/use_cases/confirm_deletion_account_use_case.dart';
import 'package:esim_mob_app/features/profile/domain/use_cases/delete_account_use_case.dart';
import 'package:esim_mob_app/features/store/data/data_sources/remote/countries_remote_data_source.dart';
import 'package:esim_mob_app/features/store/data/data_sources/remote/plans_remote_data_source.dart';
import 'package:esim_mob_app/features/store/data/repositoty/countries_repository_impl.dart';
import 'package:esim_mob_app/features/store/data/repositoty/plan_esim_repository_impl.dart';
import 'package:esim_mob_app/features/store/domain/repository/countries_repository.dart';
import 'package:esim_mob_app/features/store/domain/repository/plan_esim_repository.dart';
import 'package:esim_mob_app/features/store/domain/use_cases/fetch_countries_use_case.dart';
import 'package:esim_mob_app/features/store/domain/use_cases/fetch_local_esims_use_case.dart';
import 'package:esim_mob_app/features/store/domain/use_cases/fetch_regional_esims_use_case.dart';
import 'package:esim_mob_app/features/store/domain/use_cases/fetch_regions_use_case.dart';
import 'package:esim_mob_app/features/top_up/data/data_sources/remote/top_up_remote_data_source.dart';
import 'package:esim_mob_app/features/top_up/data/repository/top_up_repository_impl.dart';
import 'package:esim_mob_app/features/top_up/domain/respository/top_up_repository.dart';
import 'package:esim_mob_app/features/top_up/domain/use_cases/top_up_by_balance_use_case.dart';
import 'package:esim_mob_app/features/top_up/domain/use_cases/top_up_by_card_use_case.dart';
import 'package:esim_mob_app/features/user/data/data_sources/local/user_local_data_source.dart';
import 'package:esim_mob_app/features/user/data/data_sources/local/user_local_data_source_impl.dart';
import 'package:esim_mob_app/features/user/data/data_sources/remote/user_remote_data_source.dart';
import 'package:esim_mob_app/features/user/data/repository/user_repository_impl.dart';
import 'package:esim_mob_app/features/user/domain/repository/user_repository.dart';
import 'package:esim_mob_app/features/user/domain/use_cases/fetch_user_use_case.dart';
import 'package:esim_mob_app/features/user/domain/use_cases/update_user_use_case.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/use_case/use_case.dart';
import 'features/auth/data/data_sources/local/session_storage.dart';
import 'features/auth/data/data_sources/local/session_storage_impl.dart';
import 'features/auth/data/repository/auth_repository_impl.dart';
import 'features/auth/domain/repository/auth_repository.dart';
import 'features/auth/domain/use_cases/login_apple_use_case.dart';
import 'features/auto_top_up/data/repository/auto_top_up_repository_impl.dart';

typedef _InitializationStep = FutureOr<void> Function();

final injector = GetIt.instance;

final Map<String, _InitializationStep> _initializationSteps = {
  'User': () {
    injector.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSource(injector<AwinstApi>().dio));
    injector.registerLazySingleton<UserRepository>(
            () => UserRepositoryImpl(userRemoteDataSource: injector<UserRemoteDataSource>()));
    injector.registerLazySingleton(() => FetchCurrentUserUseCase(userRepository: injector<UserRepository>()));
    // injector.registerLazySingleton(() => DeleteCurrentUserUseCase(userRepository: injector<UserRepository>()));
    // injector.registerLazySingleton(() => UpdateCurrentUserUseCase(userRepository: injector<UserRepository>()));
  },
  'RemoteDataSource': (){
    final authRemoteDataSource = AuthRemoteDataSource(injector<AwinstApi>().dio);
    injector.registerLazySingleton<AuthRemoteDataSource>(() => authRemoteDataSource);
    injector.registerLazySingleton<PlansRemoteDataSource>(() => PlansRemoteDataSource(injector<AwinstApi>().dio));
    injector.registerLazySingleton<CountriesRemoteDataSource>(() => CountriesRemoteDataSource(injector<AwinstApi>().dio));
    injector.registerLazySingleton<AutoTopUpRemoteDataSource>(() => AutoTopUpRemoteDataSource(injector<AwinstApi>().dio));
    injector.registerLazySingleton<CheckoutRemoteDataSource>(() => CheckoutRemoteDataSource(injector<AwinstApi>().dio));
    injector.registerLazySingleton<DepositRemoteDataSource>(() => DepositRemoteDataSource(injector<AwinstApi>().dio));
    injector.registerLazySingleton<HistoryRemoteDataSource>(() => HistoryRemoteDataSource(injector<AwinstApi>().dio));
    injector.registerLazySingleton<ContactUsRemoteDataSource>(() => ContactUsRemoteDataSource(injector<AwinstApi>().dio));
    injector.registerLazySingleton<TopUpRemoteDataSource>(() => TopUpRemoteDataSource(injector<AwinstApi>().dio));
  },
  'Repository': (){
    injector.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(authRemoteDataSource: injector<AuthRemoteDataSource>()));
    injector.registerLazySingleton<PlanESimRepository>(() => PlanESimRepositoryImpl(plansRemoteDataSource: injector<PlansRemoteDataSource>()));
    injector.registerLazySingleton<CountriesRepository>(() => CountryRepositoryImpl(countriesRemoteDataSource: injector<CountriesRemoteDataSource>()));
    injector.registerLazySingleton<AutoTopUpRepository>(() => AutoTopUpRepositoryImpl(autoTopUpRemoteDataSource: injector<AutoTopUpRemoteDataSource>()));
    injector.registerLazySingleton<CheckoutRepository>(() => CheckoutRepositoryImpl(checkoutRemoteDataSource: injector<CheckoutRemoteDataSource>()));
    injector.registerLazySingleton<DepositRepository>(() => DepositRepositoryImpl(depositRemoteDataSource: injector<DepositRemoteDataSource>()));
    injector.registerLazySingleton<HistoryRepository>(() => HistoryRepositoryImpl(historyRemoteDataSource: injector<HistoryRemoteDataSource>()));
    injector.registerLazySingleton<ContactRepository>(() => ContactRepositoryImpl(contactUsRemoteDataSource: injector<ContactUsRemoteDataSource>()));
    injector.registerLazySingleton<TopUpRepository>(() => TopUpRepositoryImpl(topUpRemoteDataSource: injector<TopUpRemoteDataSource>()));

    },
  'UseCases': (){
    final loginGoogleUseCase = LoginGoogleUseCase(authRepository: injector<AuthRepository>());
    injector.registerLazySingleton(() => loginGoogleUseCase);
    final loginAppleUseCase = LoginIOSUseCase(authRepository: injector<AuthRepository>());
    injector.registerLazySingleton(() => loginAppleUseCase);
    injector.registerLazySingleton(() => DeleteAccountUseCase(userRepository: injector<UserRepository>()));
    injector.registerLazySingleton(() => ConfirmDeletionAccountUseCase(userRepository: injector<UserRepository>()));
    injector.registerLazySingleton(() => FetchActivationTopupListUseCase(autoTopUpRepository: injector<AutoTopUpRepository>()));
    final planESimRepository = injector<PlanESimRepository>();

    injector.registerLazySingleton(() => FetchRegionalESimsUseCase(planESimRepository: planESimRepository));
    injector.registerLazySingleton(() => FetchLocalESimsUseCase(planESimRepository: planESimRepository));
    final countriesRepository = injector<CountriesRepository>();
    injector.registerLazySingleton(() => FetchCountriesUseCase(countriesRepository: countriesRepository));
    injector.registerLazySingleton(() => FetchRegionsUseCase(countriesRepository: countriesRepository));
    injector.registerLazySingleton(() => FetchUserESimUseCase(userRepository: injector<UserRepository>()));
    injector.registerLazySingleton(() => PurchaseESimByCardUseCase(checkoutRepository: injector<CheckoutRepository>()));
    injector.registerLazySingleton(() => PurchaseESimByBalanceUseCase(checkoutRepository: injector<CheckoutRepository>()));
    injector.registerLazySingleton(() => AddBalanceUseCase(depositRepository: injector<DepositRepository>()));
    injector.registerLazySingleton(() => FetchHistoryUseCase(historyRepository: injector<HistoryRepository>()));
    injector.registerLazySingleton(() => UpdateActivationTopUpUseCase(autoTopUpRepository: injector<AutoTopUpRepository>()));
    injector.registerLazySingleton(() => SendMessageToContactUseCase(contactRepository: injector<ContactRepository>()));
    injector.registerLazySingleton(() => UpdateUserUseCase(userRepository: injector<UserRepository>()));

    injector.registerLazySingleton(() => TopUpByCardUseCase(autoTopUpRepository: injector<AutoTopUpRepository>()));
    injector.registerLazySingleton(() => TopUpByBalanceUseCase(topUpRepository: injector<TopUpRepository>()));
    },
  'Token': () async {
    injector
        .registerLazySingleton<FcmTokenRemoteDataSource>(() => FcmTokenRemoteDataSource());
    injector.registerLazySingleton<TokenRepository>(() => TokenRepositoryImpl(
      fcmTokenRemoteDataSource: injector<FcmTokenRemoteDataSource>(),
      fcmTokenStorage: injector<FcmTokenStorage>(),
    ));
    // injector.registerLazySingleton(() => TokenAuthUserUseCase(tokenRepository: injector<TokenRepositoryImpl>()));
    // injector.registerLazySingleton(() => TokenInitialUseCase(tokenRepository: injector<TokenRepositoryImpl>()));
    injector.registerLazySingleton(() => TokenLogoutUseCase(tokenRepository: injector<TokenRepository>()));
  },
};

Future<void> initializeDependencies({
  void Function(int progress, String message)? onProgress,
  required void Function(UserModel user) onAuth,
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
    onAuth.call(await fetchCurrentUser());
    onProgress?.call(100, 'Dependencies initialized in ${stopwatch.elapsedMilliseconds}ms');
  } finally {
    stopwatch.stop();
  }
}

FutureOr<UserModel> fetchCurrentUser() async {
  final token = await injector<SessionStorage>().getAccessToken();
  injector<AwinstApi>().token = token;
  try {
    if (token != null) {
      final customer = await injector<FetchCurrentUserUseCase>().call(NoParams());
      return customer;
    }
    return UserModel.notAuthenticated();
  } on Object catch (e) {
    Logger.error('Error fetching current user', e);
    await injector<SessionStorage>().cleanSession();
    return UserModel.notAuthenticated();
  }
}



Future<void> baseSteps() async{
  AndroidOptions _getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
  );
  final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
  final sharedPreferences = await SharedPreferences.getInstance();
  final storageDao = FlutterSecureStorageDao(secureStorage: storage, sharedPreferences: sharedPreferences);
  if(storageDao.readBool('first_start_app') ?? true){
    await storage.deleteAll();
    await sharedPreferences.clear();
  }
  injector.registerLazySingleton<AwinstApi>(() => AwinstApi());
  injector.registerLazySingleton(() => LocalizationRepositoryImpl());
  injector.registerLazySingleton<SessionStorage>(() => SessionStorageImpl(secureStorageDao: storageDao));
  injector.registerLazySingleton<FcmTokenStorage>(() => FcmTokenStorageImpl(secureStorageDao: storageDao));
  injector.registerLazySingleton(() => FirstStartAppStorageImpl(secureStorageDao: storageDao));
  injector.registerLazySingleton(() => OnBoardingRepositoryImpl(firstStartAppStorage: injector<FirstStartAppStorageImpl>()));
  injector.registerLazySingleton<UserLocalDataSource>(() => UserLocalDataSourceImpl(secureStorageDao: storageDao));
}