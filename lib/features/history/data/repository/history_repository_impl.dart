
import 'package:esim_mob_app/features/history/data/data_sources/remote/history_remote_data_source.dart';
import 'package:esim_mob_app/features/history/data/model/history_model.dart';
import 'package:esim_mob_app/features/history/domain/repositories/history_repository.dart';

class HistoryRepositoryImpl implements HistoryRepository{
  const HistoryRepositoryImpl({required HistoryRemoteDataSource historyRemoteDataSource}) : _historyRemoteDataSource = historyRemoteDataSource, super();

  final HistoryRemoteDataSource _historyRemoteDataSource;

  @override
  Future<HistoryModel> fetchHistory({required int page}) async {
    return await _historyRemoteDataSource.fetchHistory(page: page);
  }
}