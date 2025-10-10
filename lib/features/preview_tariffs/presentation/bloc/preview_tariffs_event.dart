part of 'preview_tariffs_bloc.dart';

@freezed
class PreviewTariffsEvent with _$PreviewTariffsEvent {
  const factory PreviewTariffsEvent.fetchTariffs({void Function()? onSuccess}) =
  _PreviewTariffsEventFetchTariffs;


  const factory PreviewTariffsEvent.selectIndex(int selectedIndex) = _PreviewTariffsEventSelectIndex;

}
