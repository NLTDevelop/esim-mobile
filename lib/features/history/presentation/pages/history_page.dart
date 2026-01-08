
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/history/data/model/transaction_model.dart';
import 'package:esim_mob_app/features/history/domain/use_cases/fetch_history_use_case.dart';
import 'package:esim_mob_app/features/history/presentation/bloc/history_bloc.dart';
import 'package:esim_mob_app/features/history/presentation/widgets/history_pagination_widget.dart';
import 'package:esim_mob_app/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key, required this.transactions});

  final List<TransactionModel> transactions;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => HistoryBloc(fetchHistoryUseCase: injector<FetchHistoryUseCase>())..add(HistoryEvent.fetchHistory()),
  child: Scaffold(
      backgroundColor: Theme.of(context).extension<ColorExtension>()!.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: DefaultText.bodySmall('History', color: Theme.of(context).extension<ColorExtension>()!.toggleCircle),
        centerTitle: true,
        leading: GestureDetector(onTap: (){
          context.pop();
        }, child: Icon(Icons.arrow_back_ios, color: Theme.of(context).extension<ColorExtension>()!.toggleCircle)),
      ),
      body: const HistoryPaginationWidget(),
    ),
);
  }

}
