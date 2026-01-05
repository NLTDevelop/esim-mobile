import 'package:esim_mob_app/features/auth/data/models/user_model.dart';
import 'package:esim_mob_app/features/user/data/models/user_esim_model.dart';

abstract class UserRepository {
  Future<UserModel> getCurrentUser();

  Future<void> deleteUserAccount();

  Future<void> sendCodeForDeleteAccount({ required String code});

  Future<List<UserESimModel>> getESimList();

  Future<UserESimModel> getESimById({required int id});
}
