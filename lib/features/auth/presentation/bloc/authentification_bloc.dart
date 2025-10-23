import 'package:esim_mob_app/core/use_case/use_case.dart';
import 'package:esim_mob_app/core/utils/error/error_mapper.dart';
import 'package:esim_mob_app/features/auth/data/data_sources/local/session_storage.dart';
import 'package:esim_mob_app/features/auth/data/models/user_model.dart';
import 'package:esim_mob_app/features/auth/domain/use_cases/login_apple_use_case.dart';
import 'package:esim_mob_app/features/auth/domain/use_cases/login_google_use_case.dart';
import 'package:esim_mob_app/features/notifcations/domain/use_cases/token_logout_use_case.dart';
import 'package:esim_mob_app/features/onboarding/data/repository/onboarding_repository_impl.dart';
import 'package:esim_mob_app/features/user/domain/use_cases/delete_account_use_case.dart';
import 'package:esim_mob_app/features/user/domain/use_cases/fetch_user_use_case.dart';
import 'package:esim_mob_app/injector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentification_event.dart';

part 'authentification_state.dart';

part 'authentification_bloc.freezed.dart';

class AuthentificationBloc
    extends Bloc<AuthentificationEvent, AuthentificationState> {
  AuthentificationBloc(
      {required LoginGoogleUseCase loginGoogleUseCase,
      required LoginAppleUseCase loginAppleUseCase, required DeleteAccountUseCase deleteAccountUseCase, required TokenLogoutUseCase tokenLogoutUseCase, required SessionStorage sessionStorage})
      : _loginAppleUseCase = loginAppleUseCase,
        _loginGoogleUseCase = loginGoogleUseCase,
        _deleteAccountUseCase = deleteAccountUseCase,
        _tokenLogoutUseCase = tokenLogoutUseCase,
        _sessionStorage = sessionStorage,
        super(const AuthentificationState.loading()) {
    on<AuthentificationEvent>((event, emit) async{
      await event.map(
        loginGoogle: (event) async =>
            _onLoginGoogle(event, emit),
        logout: (event) async => _onLogOut(event, emit),
        getSignedInUser: (event) async => _onGetSignedInCustomer(event, emit),
        loginApple: (event) async => _onLoginApple(event, emit),
        setUser: (event) async => _onSetUser(event, emit), deleteUser: (event) async => _onDeleteUser(event, emit),
      );
    });
  }

  final LoginGoogleUseCase _loginGoogleUseCase;
  final LoginAppleUseCase _loginAppleUseCase;
  final DeleteAccountUseCase _deleteAccountUseCase;
  final TokenLogoutUseCase _tokenLogoutUseCase;
  final SessionStorage _sessionStorage;

  final String email = 'pavelsejcenko@gmail.com';
  final String password = '12345678';

  Future<void> _onLoginGoogle(_AuthentificationEventLoginGoogle event, Emitter<AuthentificationState> emit) async{
    String? message;
    try{
      print('LOGIN');
      emit(
          const AuthentificationState.loading(user: NotAuthenticatedUser())
      );
      final token = await _loginGoogleUseCase.call(LoginAndPasswordParamsGoogle(email: email, password: password));
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
      message = ErrorMapper.mapError(error);
      emit(AuthentificationState.failure(message: message));
    }

  }

  Future<void> _onLoginApple(_AuthentificationEventLoginApple event, Emitter<AuthentificationState> emit) async{
    String? message;
    try{
      emit(
          const AuthentificationState.loading(user: NotAuthenticatedUser())
      );
      final token = await _loginAppleUseCase.call(LoginAndPasswordParams(email: email, password: password));
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
      final token = injector<SessionStorage>().getAccessToken();
      if (token != null) {
        // injector<SlonovaApi>().token = token;
        final customer = await injector<FetchCurrentUserUseCase>().call(NoParams());
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
      await _deleteAccountUseCase.call(NoParams());
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

  void onLoginGoogleTap(){
    add(const _AuthentificationEventLoginGoogle());
  }
  void onLoginAppleTap(){
    add(const _AuthentificationEventLoginApple());
  }

  void onDeleteAccount(){
    add(const _AuthentificationEventDeleteUser());
  }
}
