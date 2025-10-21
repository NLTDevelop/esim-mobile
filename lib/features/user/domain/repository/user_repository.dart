import 'package:esim_mob_app/features/auth/data/models/user_model.dart';

abstract class UserRepository {
  Future<UserModel> getCurrentUser();

  Future<void> deleteUserAccount();
}
