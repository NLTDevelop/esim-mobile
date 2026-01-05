import 'package:esim_mob_app/features/contact_us/data/data_sources/remote/contact_us_remote_data_source.dart';
import 'package:esim_mob_app/features/contact_us/data/models/dto/message_dto.dart';
import 'package:esim_mob_app/features/contact_us/domain/repositories/contact_repository.dart';

class ContactRepositoryImpl implements ContactRepository{

  const ContactRepositoryImpl({ required ContactUsRemoteDataSource contactUsRemoteDataSource}) : _contactUsRemoteDataSource = contactUsRemoteDataSource;
  final ContactUsRemoteDataSource _contactUsRemoteDataSource;
  @override
  Future<void> sendMessage({required MessageDto message}) async => await _contactUsRemoteDataSource.sendMessage(data: message.toJson());
}