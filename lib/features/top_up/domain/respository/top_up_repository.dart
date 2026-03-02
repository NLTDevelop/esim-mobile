
import 'package:esim_mob_app/features/top_up/data/models/top_up_by_balance_response.dart';
import 'package:esim_mob_app/features/user/data/models/user_package_model.dart';

abstract interface class TopUpRepository {
  Future<List<UserPackageModel>> fetchAutoTopUpActivations({required int id});

  Future<TopUpByBalanceResponse> topUpByBalance({ required String package, required int activationId, String? promoCode});
}
