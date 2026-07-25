part of 'authentification_bloc.dart';

@freezed
abstract class AuthentificationState with _$AuthentificationState {
  const AuthentificationState._();

  const factory AuthentificationState.authenticated({
    required final AuthenticatedUserModel user,
    required final List<UserESimModel> eSimActivations,
  }) = _Authenticated;

  const factory AuthentificationState.loading({
    @Default(NotAuthenticatedUser()) final UserModel user,
    required final List<UserESimModel> eSimActivations,
  }) = _Loading;

  const factory AuthentificationState.failure({
    @Default(NotAuthenticatedUser()) final UserModel user,
    @Default([]) final List<UserESimModel> eSimActivations,
    required final String message,
  }) = _Failure;

  const factory AuthentificationState.success({
    @Default(NotAuthenticatedUser()) final UserModel user,
    @Default([]) final List<UserESimModel> eSimActivations,
  }) = _Success;

  const factory AuthentificationState.notAuthenticated({
    @Default(NotAuthenticatedUser()) final UserModel user,
    @Default([]) final List<UserESimModel> eSimActivations,
    final String? message,
  }) = _NotAuthenticated;


}
