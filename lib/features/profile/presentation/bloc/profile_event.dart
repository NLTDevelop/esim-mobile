part of 'profile_bloc.dart';


@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.changeNotificationStatus({required bool isNotify}) =
  _ProfileEventChangeNotificationStatus;
  const factory ProfileEvent.changeMarketingNotificationStatus({ required bool isMarketingNotify}) = _ProfileEventChangeMarketingNotificationStatus;
}
