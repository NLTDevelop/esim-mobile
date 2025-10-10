part of 'authentification_bloc.dart';

@freezed
class AuthentificationState with _$AuthentificationState {
  const AuthentificationState._();

  const factory AuthentificationState.authenticated({
    required final AuthenticatedUserModel user,
  }) = _Authenticated;

  const factory AuthentificationState.loading({
    @Default(NotAuthenticatedUser()) final UserModel user,
  }) = _Loading;

  const factory AuthentificationState.failure({
    @Default(NotAuthenticatedUser()) final UserModel user,
    required final String message,
  }) = _Failure;

  const factory AuthentificationState.success({
    @Default(NotAuthenticatedUser()) final UserModel user,
  }) = _Success;

  const factory AuthentificationState.notAuthenticated({
    @Default(NotAuthenticatedUser()) final UserModel user,
    final String? message,
  }) = _NotAuthenticated;

  const factory AuthentificationState.initial() = _Initial;
}
