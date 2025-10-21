import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.g.dart';

abstract class UserModel {
  const UserModel();

  factory UserModel.notAuthenticated() => const NotAuthenticatedUser();

  factory UserModel.authenticated({
    required final int id,
    required final String email,
  }) =>
      AuthenticatedUserModel(
        id: id,
        email: email,
      );

  bool get isAuthenticated;

  bool get isNotAuthenticated;

  String get userEmail;

  T when<T extends Object?>({
    required final T Function(AuthenticatedUserModel user) authenticated,
    required final T Function() notAuthenticated,
  });
}

@JsonSerializable()
class AuthenticatedUserModel implements UserModel {
  const AuthenticatedUserModel({
    required this.id,
    required this.email,
  });

  final int id;
  final String email;

  @override
  bool get isAuthenticated => !isNotAuthenticated;

  @override
  bool get isNotAuthenticated => id == 0;

  @override
  String get userEmail => email;

  @override
  T when<T extends Object?>({
    required final T Function(AuthenticatedUserModel user) authenticated,
    required final T Function() notAuthenticated,
  }) =>
      authenticated(this);


  @override
  bool operator ==(final Object other) =>
      other is AuthenticatedUserModel &&
          id == other.id &&
          email == other.email;

  @override
  int get hashCode => id.hashCode;

  factory AuthenticatedUserModel.fromJson(Map<String, dynamic> json) =>
      _$AuthenticatedUserModelFromJson(json);

  AuthenticatedUserModel copyWith({
    final bool? isAutoPlay,
  }) =>
      AuthenticatedUserModel(
        id: id,
        email: email,
      );
}

@immutable
class NotAuthenticatedUser implements UserModel {
  @literal
  const NotAuthenticatedUser();

  @override
  bool get isAuthenticated => false;

  @override
  bool get isNotAuthenticated => true;

  @override
  String get userEmail => '';

  @override
  T when<T extends Object?>({
    required final T Function(AuthenticatedUserModel user) authenticated,
    required final T Function() notAuthenticated,
  }) =>
      notAuthenticated();

  @override
  String toString() => 'User is not authenticated';

  @override
  bool operator ==(final Object other) => other is NotAuthenticatedUser;

  @override
  int get hashCode => 0;
}
