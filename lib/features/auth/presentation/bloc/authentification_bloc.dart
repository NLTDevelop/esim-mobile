import 'package:esim_mob_app/core/utils/error/error_mapper.dart';
import 'package:esim_mob_app/features/auth/data/data_sources/local/session_storage.dart';
import 'package:esim_mob_app/features/auth/data/models/user_model.dart';
import 'package:esim_mob_app/features/auth/domain/use_cases/login_apple_use_case.dart';
import 'package:esim_mob_app/features/auth/domain/use_cases/login_google_use_case.dart';
import 'package:esim_mob_app/features/onboarding/data/repository/onboarding_repository_impl.dart';
import 'package:esim_mob_app/features/onboarding/domain/repository/onboarding_repository.dart';
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
      required LoginAppleUseCase loginAppleUseCase})
      : _loginAppleUseCase = loginAppleUseCase,
        _loginGoogleUseCase = loginGoogleUseCase,
        super(const AuthentificationState.initial()) {
    on<AuthentificationEvent>((event, emit) async{
      await event.map(
        loginGoogle: (event) async =>
            _onLoginGoogle(event, emit),
        logout: (event) async => _onLogOut(event, emit),
        getSignedInUser: (event) async => _onGetSignedInCustomer(event, emit),
        loginApple: (event) async => _onLoginApple(event, emit),
      );
    });
  }

  final LoginGoogleUseCase _loginGoogleUseCase;
  final LoginAppleUseCase _loginAppleUseCase;

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
      await injector<SessionStorage>().saveAccessToken(token.accessToken);
      await injector<OnBoardingRepository>().setFirstRun(false);
      emit(AuthentificationState.authenticated(user: AuthenticatedUserModel(id: 2, email: email)));

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
      await injector<SessionStorage>().saveAccessToken(token.accessToken);
      await injector<OnBoardingRepositoryImpl>().setFirstRun(false);
      emit(AuthentificationState.authenticated(user: AuthenticatedUserModel(id: 2, email: email)));

    } on Object catch (error) {
      message = ErrorMapper.mapError(error);
      emit(AuthentificationState.failure(message: message));
    }
  }

  Future<void> _onLogOut(_AuthentificationEventLogout event, Emitter<AuthentificationState> emit) async{

  }

  Future<void> _onGetSignedInCustomer(_AuthentificationGetSignedInUser event, Emitter<AuthentificationState> emit) async{

  }

  void onLoginGoogleTap(){
    add(const _AuthentificationEventLoginGoogle());
  }
  void onLoginAppleTap(){
    add(const _AuthentificationEventLoginApple());
  }
}
