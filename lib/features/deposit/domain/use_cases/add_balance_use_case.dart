
import 'package:esim_mob_app/core/use_case/use_case.dart';
import 'package:esim_mob_app/features/deposit/data/models/deposit_url_model.dart';
import 'package:esim_mob_app/features/deposit/domain/repositories/deposit_repository.dart';

class AddBalanceUseCase extends UseCase<DepositUrlModel, AddBalanceParams> {

  const AddBalanceUseCase({
    required final DepositRepository depositRepository,
  }) : _depositRepository = depositRepository;

  final DepositRepository _depositRepository;
  @override
  Future<DepositUrlModel> call(AddBalanceParams params) async{
    return await _depositRepository.fetchUrlBalance(amount: params.amount, currencyCode: params.currencyCode);
  }

}


class AddBalanceParams{
  const AddBalanceParams({
   required this.amount,
   required this.currencyCode
});

  final String currencyCode;
  final num amount;
}
