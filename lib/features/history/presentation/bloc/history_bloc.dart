import 'package:esim_mob_app/common/theme/app_assets.dart';
import 'package:esim_mob_app/features/history/data/model/transaction_model.dart';
import 'package:esim_mob_app/features/home/data/models/esim_model.dart';
import 'package:esim_mob_app/features/preview_tariffs/data/models/tariff_model.dart';
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
          tariff: TariffModel(
              price: 3,
              eSim: ESimModel(
                  name: 'Netherlands',
                  dataInGB: 5,
                  days: 7,
                  createdAt: DateTime.now(),
                  iconPath: AppIcons.netherlands)),
          createdAt: DateTime.now().subtract(const Duration(days: 2)),
          price: 3,
          currency: 'USD'),
      TransactionModel(
          tariff: TariffModel(
              price: 3,
              eSim: ESimModel(
                  name: 'Netherlands',
                  dataInGB: 5,
                  days: 7,
                  createdAt: DateTime.now().subtract(const Duration(days: 2)),
                  iconPath: AppIcons.netherlands)),
          createdAt: DateTime.now().subtract(const Duration(days: 2)),
          price: 3,
          currency: 'USD'),
      TransactionModel(
          tariff: TariffModel(
              price: 15,
              eSim: ESimModel(
                  name: 'Japan',
                  dataInGB: 10,
                  days: 30,
                  createdAt: DateTime.now().subtract(const Duration(days: 10)),
                  iconPath: AppIcons.japan)),
          createdAt: DateTime.now().subtract(const Duration(days: 10)),
          price: 15,
          currency: 'USD'),
      TransactionModel(
          tariff: TariffModel(
              price: 9.49,
              eSim: ESimModel(
                  name: 'USA',
                  dataInGB: 5,
                  days: 7,
                  createdAt: DateTime.now().subtract(const Duration(days: 20)),
                  iconPath: AppIcons.usa)),
          createdAt: DateTime.now().subtract(const Duration(days: 20)),
          price: 9.49,
          currency: 'USD'),
      TransactionModel(
          tariff: TariffModel(
              price: 16.99,
              eSim: ESimModel(
                  name: 'Malaysia',
                  dataInGB: 12,
                  days: 30,
                  createdAt: DateTime.now().subtract(const Duration(days: 63)),
                  iconPath: AppIcons.japan)),
          createdAt: DateTime.now().subtract(const Duration(days: 63)),
          price: 16.99,
          currency: 'USD')
    ]));
  }
}
