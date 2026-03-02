import 'package:dio/dio.dart';
import 'package:esim_mob_app/core/client/rest/awinst_rest_api.dart';
import 'package:esim_mob_app/core/use_case/use_case.dart';
import 'package:esim_mob_app/core/utils/error/error_mapper.dart';
import 'package:esim_mob_app/features/auth/data/data_sources/local/session_storage.dart';
import 'package:esim_mob_app/features/auth/data/models/user_model.dart';
import 'package:esim_mob_app/features/auth/domain/use_cases/login_apple_use_case.dart';
import 'package:esim_mob_app/features/auth/domain/use_cases/login_google_use_case.dart';
import 'package:esim_mob_app/features/notifcations/domain/use_cases/token_logout_use_case.dart';
import 'package:esim_mob_app/features/onboarding/data/repository/onboarding_repository_impl.dart';
import 'package:esim_mob_app/features/profile/domain/use_cases/delete_account_use_case.dart';
import 'package:esim_mob_app/features/user/domain/use_cases/fetch_user_use_case.dart';
import 'package:esim_mob_app/features/user/domain/use_cases/update_user_use_case.dart';
import 'package:esim_mob_app/injector.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentification_event.dart';

part 'authentification_state.dart';

part 'authentification_bloc.freezed.dart';

class AuthentificationBloc
    extends Bloc<AuthentificationEvent, AuthentificationState> {
  AuthentificationBloc(
      {required LoginGoogleUseCase loginGoogleUseCase,
      required LoginIOSUseCase loginAppleUseCase, required TokenLogoutUseCase tokenLogoutUseCase, required SessionStorage sessionStorage, required UpdateUserUseCase updateUserUseCase})
      : _loginAppleUseCase = loginAppleUseCase,
        _loginGoogleUseCase = loginGoogleUseCase,
        _tokenLogoutUseCase = tokenLogoutUseCase,
        _sessionStorage = sessionStorage,
        _updateUserUseCase = updateUserUseCase,
        super(const AuthentificationState.loading()) {
    on<AuthentificationEvent>((event, emit) async{
      await event.map(
        loginGoogle: (event) async =>
            _onLoginGoogle(event, emit),
        logout: (event) async => _onLogOut(event, emit),
        getSignedInUser: (event) async => _onGetSignedInCustomer(event, emit),
        loginApple: (event) async => _onLoginApple(event, emit),
        setUser: (event) async => _onSetUser(event, emit), deleteUser: (event) async => _onDeleteUser(event, emit), tryAgain: (_AuthentificationEventTryAgain value) {  }, changeCurrencyCode: (e) async => _onUpdateCurrencyCode(e, emit),
      );
    });
  }

  final LoginGoogleUseCase _loginGoogleUseCase;
  final LoginIOSUseCase _loginAppleUseCase;
  final TokenLogoutUseCase _tokenLogoutUseCase;
  final UpdateUserUseCase _updateUserUseCase;
  
  final SessionStorage _sessionStorage;
  


  Future<void> _onLoginGoogle(_AuthentificationEventLoginGoogle event, Emitter<AuthentificationState> emit) async{
    try{
      emit(
          const AuthentificationState.loading(user: NotAuthenticatedUser())
      );
      late String fcmToken;
      try{
        fcmToken = await FirebaseMessaging.instance.getToken() ?? '';
      } catch (e){
        debugPrint(e.toString());
        fcmToken = '';
      }

      final token = await _loginGoogleUseCase.call(LoginGoogleParams(fcmToken: fcmToken));


      await _sessionStorage.saveAccessToken(token.accessToken);
      injector<AwinstApi>().token = token.accessToken;
      await injector<OnBoardingRepositoryImpl>().setFirstRun(false);
      final user = await injector<FetchCurrentUserUseCase>().call(NoParams());

      emit(
        user.when<AuthentificationState>(
          authenticated: (customer) => _Authenticated(user: customer),
          notAuthenticated: () => const _NotAuthenticated(),
        ),
      );

    } on Exception catch (error) {
      // print(error);
      // print(stack);
      var errorMessage = 'Unexpected error';
      if(error is DioException){
        errorMessage = error.message!;
      }
      emit(AuthentificationState.failure(message: errorMessage));
    }

  }

  Future<void> _onLoginApple(_AuthentificationEventLoginApple event, Emitter<AuthentificationState> emit) async{
    String? message;
    try{
      emit(
          const AuthentificationState.loading(user: NotAuthenticatedUser())
      );
      late String fcmToken;
      try{
        fcmToken = await FirebaseMessaging.instance.getToken() ?? '';
      } catch (e){
        debugPrint(e.toString());
        fcmToken = '';
      }

      final token = await _loginAppleUseCase.call(LoginIOSParams(fcmToken: fcmToken));
      await _sessionStorage.saveAccessToken(token.accessToken);
      await injector<OnBoardingRepositoryImpl>().setFirstRun(false);
      final user = await injector<FetchCurrentUserUseCase>().call(NoParams());
      emit(
        user.when<AuthentificationState>(
          authenticated: (customer) => _Authenticated(user: customer),
          notAuthenticated: () => const _NotAuthenticated(),
        ),
      );

    } on Object catch (error) {
      // print(error);
      // print(stack);
      message = ErrorMapper.mapError(error);
      emit(AuthentificationState.failure(message: message));
    }
  }

  Future<void> _onLogOut(_AuthentificationEventLogout event, Emitter<AuthentificationState> emit) async{
    try {
      emit(const _Loading());
      await injector<SessionStorage>().cleanSession();
      // injector<SlonovaApi>().token = null;
      emit(const _Success(user: NotAuthenticatedUser()));
      _tokenLogoutUseCase.call(NoParams());
      // injector<NotificationBloc>().add(const NotificationEvent.fetchNotification());
    } on Object catch (error) {
      emit(_Failure(message: ErrorMapper.mapError(error)));
    } finally {
      emit(
        state.user.when<AuthentificationState>(
          authenticated: (customer) => _Authenticated(user: customer),
          notAuthenticated: () => const _NotAuthenticated(),
        ),
      );
    }
  }

  Future<void> _onGetSignedInCustomer(
      _AuthentificationGetSignedInUser event,
      Emitter<AuthentificationState> emit,
      ) async {
    try {

      emit(_Loading(user: state.user));
      final token = await injector<SessionStorage>().getAccessToken();
      if (token != null) {
        // injector<SlonovaApi>().token = token;
        final customer = await injector<FetchCurrentUserUseCase>().call(NoParams());

        print(customer);
        print(customer.userTariffs);

        emit(
          customer.when<AuthentificationState>(
            authenticated: (customer) => _Authenticated(user: customer),
            notAuthenticated: () => const _NotAuthenticated(),
          ),
        );
      }
    } on Object catch (error) {
      emit(_Failure(message: ErrorMapper.mapError(error)));
    } finally {
      emit(
        state.user.when<AuthentificationState>(
          authenticated: (customer) => _Authenticated(user: customer),
          notAuthenticated: () => const _NotAuthenticated(),
        ),
      );
    }
  }

  Future<void> _onSetUser(
      _AuthentificationSetUser event,
      Emitter<AuthentificationState> emit,
      ) async {
    emit(_Loading(user: state.user));
    ///await injector<TokenInitialUseCase>().call(NoParams());
    FirebaseMessaging.instance.onTokenRefresh.listen((String fcmToken) {
      // TODO implement refresh token logic
    });

    emit(
      event.user.when<AuthentificationState>(
        authenticated: (customer) => _Authenticated(user: customer),
        notAuthenticated: () => const _NotAuthenticated(),
      ),
    );
  }

  Future<void> _onDeleteUser(
      _AuthentificationEventDeleteUser event,
      Emitter<AuthentificationState> emit,
      ) async {
    try {
      emit(_Loading(user: state.user));
      // await _deleteAccountUseCase.call(NoParams());
      await _sessionStorage.cleanSession();
      ///injector<SlonovaApi>().token = null;
      _tokenLogoutUseCase.call(NoParams());
      ///injector<NotificationBloc>().add(const NotificationEvent.fetchNotification());
      emit(const _NotAuthenticated());
    } on Object catch (error) {
      emit(_Failure(message: ErrorMapper.mapError(error)));
    } finally {
      emit(
        state.user.when<AuthentificationState>(
          authenticated: (customer) => _Authenticated(user: customer),
          notAuthenticated: () => const _NotAuthenticated(),
        ),
      );
    }
  }

  // void _onTryAgain(_AuthentificationEventTryAgain event, Emitter<AuthentificationState> emit){
  //   try{
  //
  //   } on Object catch (error) {
  //   emit(_Failure(message: ErrorMapper.mapError(error)));
  //   }
  // }

  _onUpdateCurrencyCode(_AuthentificationChangeCurrencyCode event, Emitter<AuthentificationState> emit) async{
    try {
      emit(_Loading(user: state.user));
      final user = await _updateUserUseCase.call(event.currencyCode);
      
      emit(
        user.when<AuthentificationState>(
          authenticated: (customer) => _Authenticated(user: customer),
          notAuthenticated: () => const _NotAuthenticated(),
        ),
      );
    } on Object catch (error) {
      emit(_Failure(message: ErrorMapper.mapError(error)));
    }
  }

  void onLoginGoogleTap(){
    add(const _AuthentificationEventLoginGoogle());
  }
  void onLoginAppleTap(){
    add(const _AuthentificationEventLoginApple());
  }

  void onDeleteAccount(){
    add(const _AuthentificationEventDeleteUser());
  }

  @override
  void onEvent(AuthentificationEvent event) {
    super.onEvent(event);
  }
}
