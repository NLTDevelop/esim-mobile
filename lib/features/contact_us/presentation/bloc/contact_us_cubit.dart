import 'package:bloc/bloc.dart';
import 'package:esim_mob_app/core/utils/error/error_mapper.dart';
import 'package:esim_mob_app/features/contact_us/domain/use_cases/send_message_to_contact_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_us_state.dart';
part 'contact_us_cubit.freezed.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit({required SendMessageToContactUseCase sendMessageToContactUseCase}) : _sendMessageToContactUseCase = sendMessageToContactUseCase, super(const ContactUsState.initial());

  final SendMessageToContactUseCase _sendMessageToContactUseCase;

  sendMessageToSupport(String value) async{
    try{
      emit(const ContactUsState.loading());
      await _sendMessageToContactUseCase.call(MessageParams(message: value));
      emit(const ContactUsState.success());
    } on Object catch(e){
      String errorMessage = ErrorMapper.mapError(e);
      emit(ContactUsState.failure(errorMessage));
    }
  }
}

