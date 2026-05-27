
part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(false) final bool isNotify,
    @Default(false) final bool isMarketingNotify,
  }) = _ProfileState;

  @override
  factory ProfileState.fromJson(Map<String, dynamic> json) =>
      _$ProfileStateFromJson(json);
}

