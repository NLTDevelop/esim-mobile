import 'package:bloc/bloc.dart';
import 'package:esim_mob_app/core/utils/error/error_mapper.dart';
import 'package:esim_mob_app/features/top_up/domain/use_cases/fetch_top_up_list_use_case.dart';
import 'package:esim_mob_app/features/top_up/domain/use_cases/top_up_by_balance_use_case.dart';
import 'package:esim_mob_app/features/top_up/domain/use_cases/top_up_by_card_use_case.dart';
import 'package:esim_mob_app/features/user/data/models/user_package_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'topup_event.dart';

part 'topup_state.dart';

part 'topup_bloc.freezed.dart';

class TopupBloc extends Bloc<TopupEvent, TopupState> {
  TopupBloc(
      {required TopUpByBalanceUseCase topUpByBalanceUseCase,
      required TopUpByCardUseCase topUpByCardUseCase,
      required FetchTopUpListUseCase fetchTopUpListUseCase,
      required int activationId})
      : _activationId = activationId,
        _topUpByCardUseCase = topUpByCardUseCase,
        _topUpByBalanceUseCase = topUpByBalanceUseCase,
        _fetchTopUpListUseCase = fetchTopUpListUseCase,
        super(const TopupState.initial()) {
    on<TopupEvent>((event, emit) async {
      await event.map(
          fetchTopUpPackages: (e) => _onFetchTopUpPackages(e, emit),
          selectPackage: (e) => _onSelectTopUpPackage(e, emit),
          purchaseByBalance: (e) => _onPurchaseByBalance(e, emit));
    });
  }

  final int _activationId;
  final TopUpByBalanceUseCase _topUpByBalanceUseCase;
  final TopUpByCardUseCase _topUpByCardUseCase;
  final FetchTopUpListUseCase _fetchTopUpListUseCase;

  _onFetchTopUpPackages(_FetchTopUpPackages event, Emitter<TopupState> emit) async{
    try{
      emit(TopupState.loading(packages: [], selectedIndex: state.selectedIndex));

      final packages = await _fetchTopUpListUseCase.call(_activationId);
      emit(TopupState.loading(packages: packages, selectedIndex: 0));
    } catch(err){
      String message = ErrorMapper.mapError(err);
      emit(TopupState.failure(message, packages: state.packages, selectedIndex: 0));
    }
  }

  _onSelectTopUpPackage(_SelectPackage event, Emitter<TopupState> emit) {
    emit(TopupState.loaded(
        packages: state.packages, selectedIndex: event.index));
  }

  _onPurchaseByBalance(_PurchaseByBalance event, Emitter<TopupState> emit) async {
    try{
      emit(TopupState.loading(packages: state.packages, selectedIndex: state.selectedIndex));
      final paymentResult = await _topUpByBalanceUseCase.call(
          TopUpByBalanceParams(activationId: _activationId, promoCode: '', package: state.packages[state.selectedIndex].packageId)
      );
      emit(TopupState.paymentSuccess(packages: state.packages, selectedIndex: state.selectedIndex));
    } on Object catch (error) {

      String message = ErrorMapper.mapError(error);
      emit(TopupState.paymentFailure(message, selectedIndex: state.selectedIndex, packages: state.packages));
    }
  }
}
