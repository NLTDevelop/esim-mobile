
import 'package:esim_mob_app/core/use_case/use_case.dart';
import 'package:esim_mob_app/features/contact_us/data/models/dto/message_dto.dart';
import 'package:esim_mob_app/features/contact_us/domain/repositories/contact_repository.dart';

class SendMessageToContact extends UseCase<void , MessageParams>{

  const SendMessageToContact(ContactRepository contactRepository) : _contactRepository = contactRepository;

  final ContactRepository _contactRepository;
  @override
  Future call(params) async => await _contactRepository.sendMessage(message: MessageDto(message: params.message));

}

class MessageParams{
  const MessageParams({required this.message});
  final String message;
}