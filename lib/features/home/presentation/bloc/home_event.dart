part of 'home_bloc.dart';


@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.fetchESims({ required final List<TariffModel> tariffs}) =
  _HomeEventFetchESims;

  const factory HomeEvent.installFirstESim() = _HomeEventInstallFirstESim;
  const factory HomeEvent.addESim({required final TariffModel tariff}) = _HomeEventAddESim;
}
