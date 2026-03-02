part of 'topup_bloc.dart';

@freezed
class TopupState with _$TopupState {
  const TopupState._();

  @override
  List<UserPackageModel> get packages => when(
        initial: () => [],
        loading: (packages, __) => packages,
        loaded: (packages, __) => packages,
        failure: (_, packages, __) => packages,
        paymentFailure: (_, packages, __) => packages,
    paymentSuccess: (packages, __) => packages
      );

  @override
  int get selectedIndex => when(
        initial: () => 0,
        loading: (_, selectedIndex) => selectedIndex,
        loaded: (_, selectedIndex) => selectedIndex,
        failure: (_, __, selectedIndex) => selectedIndex,
        paymentFailure: (_, __, selectedIndex) => selectedIndex,
        paymentSuccess: (_, selectedIndex) => selectedIndex,
      );

  const factory TopupState.initial() = _Initial;

  const factory TopupState.loading({
    required List<UserPackageModel> packages,
    required int selectedIndex,
  }) = _Loading;

  const factory TopupState.loaded({
    required List<UserPackageModel> packages,
    required int selectedIndex,
  }) = _Loaded;

  const factory TopupState.failure(
    message, {
    required List<UserPackageModel> packages,
    required int selectedIndex,
  }) = _Failure;

  const factory TopupState.paymentFailure(
    message, {
    required List<UserPackageModel> packages,
    required int selectedIndex,
  }) = _PaymentFailure;

  const factory TopupState.paymentSuccess({required List<UserPackageModel> packages,
      required int selectedIndex,}) = _PaymentSuccess;
}
