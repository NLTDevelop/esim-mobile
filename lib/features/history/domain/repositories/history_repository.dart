
import 'package:esim_mob_app/features/history/data/model/history_model.dart';

abstract interface class HistoryRepository{

  Future<HistoryModel> fetchHistory({required int page});
}