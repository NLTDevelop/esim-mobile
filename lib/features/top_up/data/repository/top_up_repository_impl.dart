
import 'package:esim_mob_app/features/top_up/data/data_sources/remote/top_up_remote_data_source.dart';
import 'package:esim_mob_app/features/top_up/data/models/top_up_by_balance_response.dart';
import 'package:esim_mob_app/features/top_up/domain/respository/top_up_repository.dart';
import 'package:esim_mob_app/features/user/data/models/user_package_model.dart';

class TopUpRepositoryImpl implements TopUpRepository{
  final TopUpRemoteDataSource _topUpRemoteDataSource;

  const TopUpRepositoryImpl({
    required final TopUpRemoteDataSource topUpRemoteDataSource,
  }) : _topUpRemoteDataSource = topUpRemoteDataSource;

  @override
  Future<List<UserPackageModel>> fetchAutoTopUpActivations({required int id}) async => await _topUpRemoteDataSource.fetchTopUpPackages(id: id);


  @override
  Future<TopUpByBalanceResponse> topUpByBalance({required String package, required int activationId, String? promoCode}) async => await _topUpRemoteDataSource.topUpByBalance(data: {'activation_id': activationId, 'promo_code': promoCode, 'package': package});

}