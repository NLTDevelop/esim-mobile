import 'package:esim_mob_app/core/utils/error/error_mapper.dart';
import 'package:esim_mob_app/features/history/data/model/transaction_model.dart';
import 'package:esim_mob_app/features/history/domain/use_cases/fetch_history_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_state.dart';

part 'history_event.dart';

part 'history_bloc.freezed.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc({required FetchHistoryUseCase fetchHistoryUseCase}) : _fetchHistoryUseCase = fetchHistoryUseCase, super(const HistoryState.loading(transactions: [])) {
    on<HistoryEvent>((event, emit) async {
      await event.map(fetchHistory: (e) => _onFetchHistory(e, emit), loadTransactions: (e) => _onLoadTransactions(e, emit));
    });
  }

  final FetchHistoryUseCase _fetchHistoryUseCase;
  int _currentPage = 1;
  int _lastPage = 1;

  _onFetchHistory(_HistoryEventFetchPlans event, Emitter<HistoryState> emit) async{

    try{
      emit(const HistoryState.loading(transactions: [], isFirstFetch: true));
      final history = await _fetchHistoryUseCase.call(FetchHistoryParams(page: _currentPage));
      _lastPage = history.meta.lastPage;
      _currentPage++;
      emit(HistoryState.success(transactions: history.transactions));
    } on Object catch(error){
      String message = ErrorMapper.mapError(error);
      emit(HistoryState.failure(message));
    }
    // emit(HistoryState.success(transactions: [
    //   TransactionModel(
    //       createdAt: DateTime.now().subtract(const Duration(days: 2)),
    //       amount: '3.00',
    //       currencyCode: 'USD',
    //       id: 1,
    //       trx: 'DgGEFF', charge: '0',
    //       discountAmount: '',
    //       gatewayName: '',
    //       status: 1
    //   ),
    //   TransactionModel(
    //       createdAt: DateTime.now().subtract(const Duration(days: 4)),
    //       amount: '6.00',
    //       currencyCode: 'USD',
    //       id: 2,
    //       trx: 'DgGEFF', charge: '0',
    //       discountAmount: '',
    //       gatewayName: '',
    //       status: 1
    //   ),
    //   TransactionModel(
    //       createdAt: DateTime.now().subtract(const Duration(days: 5)),
    //       amount: '3.00',
    //       currencyCode: 'USD',
    //       id: 3,
    //       trx: 'DgGEFF', charge: '0',
    //       discountAmount: '',
    //       gatewayName: '',
    //       status: 1
    //   ),
    //   TransactionModel(
    //       createdAt: DateTime.now().subtract(const Duration(days: 6)),
    //       amount: '8.00',
    //       currencyCode: 'USD',
    //       id: 4,
    //       trx: 'DgGEFF', charge: '0',
    //       discountAmount: '',
    //       gatewayName: '',
    //       status: 1
    //   ),
    //   TransactionModel(
    //       createdAt: DateTime.now().subtract(const Duration(days: 10)),
    //       amount: '10.00',
    //       currencyCode: 'USD',
    //       id: 5,
    //       trx: 'DgGEFF', charge: '0',
    //       discountAmount: '',
    //       gatewayName: '',
    //       status: 3
    //   ),
    // ]));
  }

  _onLoadTransactions(_HistoryEventLoadTransactions event ,Emitter<HistoryState> emit) async{
    try{

      emit(HistoryState.loading(transactions: state.transactions, isFirstFetch: false));
      if(_currentPage == _lastPage){
        emit(HistoryState.success(transactions: state.transactions));
        return;
      }
      _currentPage++;
      final newHistory = await _fetchHistoryUseCase.call(FetchHistoryParams(page: _currentPage));
      emit(HistoryState.success(transactions: [...state.transactions, ...newHistory.transactions]));
    } on Object catch (error) {

      String message = ErrorMapper.mapError(error);
      emit(HistoryState.failure(message));
    }

  }
}
