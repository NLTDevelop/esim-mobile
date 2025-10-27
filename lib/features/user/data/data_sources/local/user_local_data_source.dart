

import 'package:esim_mob_app/features/auth/data/models/user_model.dart';

abstract interface class UserLocalDataSource {

  Future<AuthenticatedUserModel?> getUser();

  Future<void> saveUser(AuthenticatedUserModel user);

}