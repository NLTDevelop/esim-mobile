part of 'authentification_bloc.dart';


@freezed
class AuthentificationEvent with _$AuthentificationEvent {
  const factory AuthentificationEvent.loginGoogle() =
  _AuthentificationEventLoginGoogle;

  const factory AuthentificationEvent.loginApple() =
  _AuthentificationEventLoginApple;

  const factory AuthentificationEvent.logout() = _AuthentificationEventLogout;
  const factory AuthentificationEvent.getSignedInUser() = _AuthentificationGetSignedInUser;

  const factory AuthentificationEvent.setUser({
    required final UserModel user,
  }) = _AuthentificationSetUser;

  const factory AuthentificationEvent.deleteUser() = _AuthentificationEventDeleteUser;
}
