
import 'package:esim_mob_app/features/auto_top_up/data/models/dto/activation_top_up_dto.dart';
import 'package:esim_mob_app/features/auto_top_up/data/models/responses/activation_top_up_response.dart';
import 'package:esim_mob_app/features/user/data/models/user_package_model.dart';


abstract interface class AutoTopUpRepository {
  Future<List<UserPackageModel>> fetchAutoTopUpActivations({required int id});

  Future<ActivationTopUpResponse> updateActivationTopUp({ required ActivationTopUpDto activationTopUpDto, required int id});
}
