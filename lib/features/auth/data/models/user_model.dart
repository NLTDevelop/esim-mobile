
import 'package:esim_mob_app/features/user/data/models/user_esim_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.g.dart';

abstract class UserModel {
  const UserModel();

  factory UserModel.notAuthenticated({final String? currency}) => NotAuthenticatedUser(currency: currency);

  factory UserModel.authenticated({
    required final int id,
    required final String email,
    required final double? balance,
    required final String? currency,
    required final List<UserESimModel> eSims,
  }) =>
      AuthenticatedUserModel(
        id: id,
        email: email,
        eSims: eSims,
        balance: balance,
        currency: currency,
      );

  bool get isAuthenticated;

  bool get isNotAuthenticated;

  List<UserESimModel> get userESims;

  String get userEmail;

  String? get currencyCode;

  double? get balance;

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
    required this.balance,
    required this.currency,
    this.eSims
  });

  final int id;
  final String email;
  @JsonKey(name: 'e_sims')
  final List<UserESimModel>? eSims;
  final double? balance;
  @JsonKey(name: 'currency_code')
  final String? currency;

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
        eSims: eSims,
        currency: currency,
        balance: balance
      );

  @override
  List<UserESimModel> get userESims => eSims ?? [];

  @override
  String? get currencyCode => currency;
}

@immutable
class NotAuthenticatedUser implements UserModel {
  @literal
  const NotAuthenticatedUser({this.currency});

  @override
  bool get isAuthenticated => false;

  @override
  bool get isNotAuthenticated => true;

  @override
  String get userEmail => '';

  final String? currency;

  @override
  String? get currencyCode => currency;

  @override
  double? get balance => 0;

  @override
  List<UserESimModel> get userESims => [];


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
