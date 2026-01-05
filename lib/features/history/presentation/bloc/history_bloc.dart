import 'package:esim_mob_app/features/history/data/model/transaction_model.dart';
import 'package:esim_mob_app/features/preview_tariffs/data/models/package_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_state.dart';

part 'history_event.dart';

part 'history_bloc.freezed.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(const HistoryState.loading(transactions: [])) {
    on<HistoryEvent>((event, emit) {
      event.map(fetchHistory: (e) => _onFetchHistory(e, emit));
    });
  }


  _onFetchHistory(_HistoryEventFetchPlans event, Emitter<HistoryState> emit) {
    emit(HistoryState.success(transactions: [
      TransactionModel(
          tariff: PackageModel(
              price: 3,
            currency: 'USD', packageIndex: 1, dataInMb: 1024, validDays: 7,

              ),
          createdAt: DateTime.now().subtract(const Duration(days: 2)),
          price: 3,
          currency: 'USD'),
      TransactionModel(
          tariff: PackageModel(
            price: 3,
            currency: 'USD', packageIndex: 1, dataInMb: 1024, validDays: 7,
              ),
          createdAt: DateTime.now().subtract(const Duration(days: 2)),
          price: 3,
          currency: 'USD'),
      TransactionModel(
          tariff: PackageModel(
            price: 3,
            currency: 'USD', packageIndex: 1, dataInMb: 1024, validDays: 7,
              ),
          createdAt: DateTime.now().subtract(const Duration(days: 10)),
          price: 15,
          currency: 'USD'),
      TransactionModel(
          tariff: PackageModel(
            price: 3,
            currency: 'USD', packageIndex: 1, dataInMb: 1024, validDays: 7,
              ),
          createdAt: DateTime.now().subtract(const Duration(days: 20)),
          price: 9.49,
          currency: 'USD'),
      TransactionModel(
          tariff: PackageModel(
            price: 3,
            currency: 'USD', packageIndex: 1, dataInMb: 1024, validDays: 7,
              ),
          createdAt: DateTime.now().subtract(const Duration(days: 63)),
          price: 16.99,
          currency: 'USD')
    ]));
  }
}
