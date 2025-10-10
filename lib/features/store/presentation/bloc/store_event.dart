part of 'store_bloc.dart';

@freezed
class StoreEvent with _$StoreEvent {
  const factory StoreEvent.fetchPlans({void Function()? onSuccess}) =
  _StoreEventFetchPlans;


  const factory StoreEvent.setText(String text) = _StoreEventSetText;

  const factory StoreEvent.changeCurrencyType(CurrencyType type) = _StoreEventChangeCurrencyType;

  const factory StoreEvent.changePlansType(bool isLocal) =
  _StoreEventChangePlansType;

}
