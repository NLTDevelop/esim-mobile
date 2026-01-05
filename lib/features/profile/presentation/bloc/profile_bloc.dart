

import 'package:bloc/bloc.dart';
import 'package:esim_mob_app/core/utils/logger/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

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

 void _onChangeNotificationStatus(_ProfileEventChangeNotificationStatus event, Emitter<ProfileState> emit){
    emit(
      state.copyWith(isNotify: event.isNotify)
    );
  }

  Future<void> openLink(
      Uri uri, {
        LaunchMode launchMode = LaunchMode.platformDefault,
      }) async {
    try {
      await launchUrl(uri, mode: launchMode);
    } on Object catch (error, stackTrace) {
      Logger.error(error, stackTrace);
    }
  }

}