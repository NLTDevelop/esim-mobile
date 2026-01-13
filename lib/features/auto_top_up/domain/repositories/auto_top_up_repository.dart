
import 'package:esim_mob_app/features/auto_top_up/data/models/dto/activation_top_up_dto.dart';
import 'package:esim_mob_app/features/auto_top_up/data/models/responses/activation_top_up_response.dart';
import 'package:esim_mob_app/features/user/data/models/user_esim_package_list_model.dart';


abstract interface class AutoTopUpRepository {
  Future<UserESimPackageListModel> fetchAutoTopUpActivations({required int id});

  Future<ActivationTopUpResponse> updateActivationTopUp({ required ActivationTopUpDto activationTopUpDto, required int id});
}
