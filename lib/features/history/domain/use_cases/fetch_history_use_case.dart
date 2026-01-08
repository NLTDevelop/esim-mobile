

import 'package:esim_mob_app/core/use_case/use_case.dart';
import 'package:esim_mob_app/features/history/data/model/history_model.dart';
import 'package:esim_mob_app/features/history/domain/repositories/history_repository.dart';

class FetchHistoryUseCase extends UseCase<HistoryModel, FetchHistoryParams> {
  const FetchHistoryUseCase({required HistoryRepository historyRepository}) : _historyRepository = historyRepository, super();

  final HistoryRepository _historyRepository;
  @override
  Future<HistoryModel> call(FetchHistoryParams params) async {
    return await _historyRepository.fetchHistory(page: params.page);
  }

}

class FetchHistoryParams{
  const FetchHistoryParams({ required this.page});
  final int page;
}