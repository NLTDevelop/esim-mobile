part of 'topup_bloc.dart';

@freezed
class TopupEvent with _$TopupEvent {
  const factory TopupEvent.fetchTopUpPackages() = _FetchTopUpPackages;

  const factory TopupEvent.selectPackage({ required int index}) = _SelectPackage;
  const factory TopupEvent.purchaseByBalance() = _PurchaseByBalance;
}
