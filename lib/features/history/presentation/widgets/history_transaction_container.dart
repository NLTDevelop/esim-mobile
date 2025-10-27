import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/features/history/presentation/bloc/history_bloc.dart';
import 'package:esim_mob_app/features/history/presentation/widgets/history_transactions_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryTransactionContainer extends StatelessWidget {
  const HistoryTransactionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      margin: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).extension<ColorExtension>()!.primary,
      ),
      child: BlocBuilder<HistoryBloc, HistoryState>(
        builder: (context, state) {
          return state.map(success: (s) =>
              HistoryTransactionsBody(transactions: state.transactions),
              loading: (s) =>
                  Center(child: SizedBox(width: 28,
                      height: 28,
                      child: CircularProgressIndicator(
                        color: Theme.of(context).extension<ColorExtension>()!
                            .background,))),
              failure: (s) =>
                  HistoryTransactionsBody(transactions: state.transactions,));
        },
      ),
    );
  }
}
