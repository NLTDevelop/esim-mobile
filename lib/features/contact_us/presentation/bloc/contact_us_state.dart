part of 'contact_us_cubit.dart';

@freezed
class ContactUsState with _$ContactUsState {
  const ContactUsState._();
  const factory ContactUsState.initial() = _Initial;
  const factory ContactUsState.success() = _Success;
  const factory ContactUsState.failure(String message) = _Failure;
  const factory ContactUsState.loading() = _Loading;
}
