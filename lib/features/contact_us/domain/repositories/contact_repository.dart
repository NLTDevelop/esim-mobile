
import 'package:esim_mob_app/features/contact_us/data/models/dto/message_dto.dart';

abstract interface class ContactRepository{
  Future<void> sendMessage({required MessageDto message});
}