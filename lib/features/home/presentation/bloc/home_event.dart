part of 'home_bloc.dart';


@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.fetchESims({ required final List<UserESimModel> tariffs}) =
  _HomeEventFetchESims;

  const factory HomeEvent.installFirstESim() = _HomeEventInstallFirstESim;
  const factory HomeEvent.addESim({required final UserESimModel tariff}) = _HomeEventAddESim;
}
