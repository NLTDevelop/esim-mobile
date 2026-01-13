part of 'auto_top_up_bloc.dart';


@freezed
class AutoTopUpEvent with _$AutoTopUpEvent {
  const factory AutoTopUpEvent.fetchTariffs() =
  _AutoTopUpEventFetchTariffs;

  const factory AutoTopUpEvent.selectTariff({ required int selectedIndex}) = _AutoTopUpEventSelectTariff;
  const factory AutoTopUpEvent.enableAutoTop() = _EnableAutoTopUp;
}
