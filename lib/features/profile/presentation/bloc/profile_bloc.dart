

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';
part 'profile_bloc.g.dart';


class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState()) {
    on<ProfileEvent>((event, emit) {
      event.map(changeNotificationStatus: (event) => _onChangeNotificationStatus(event, emit));
    });
  }

 void  _onChangeNotificationStatus(_ProfileEventChangeNotificationStatus event, Emitter<ProfileState> emit){
    emit(
      state.copyWith(isNotify: event.isNotify)
    );
  }
}