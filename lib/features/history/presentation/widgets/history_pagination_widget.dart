


import 'package:esim_mob_app/common/widgets/snackbar/default_snackbar.dart';
import 'package:esim_mob_app/common/widgets/state/loading_state.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/core/utils/mixin/pagination_mixin.dart';
import 'package:esim_mob_app/features/history/presentation/bloc/history_bloc.dart';
import 'package:esim_mob_app/features/history/presentation/widgets/transaction_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryPaginationWidget extends StatefulWidget {

  const HistoryPaginationWidget({
    super.key,
  });

  @override
  State<HistoryPaginationWidget> createState() => _HistoryPaginationWidgetState();
}

class _HistoryPaginationWidgetState extends State<HistoryPaginationWidget> with PaginationScrollStateMixin {
  @override
  void initState() {
    mixinScrollController = ScrollController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    setScrollController(() =>
        context.read<HistoryBloc>().add(const HistoryEvent.loadTransactions()));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HistoryBloc, HistoryState>(
      builder: (context, state) {
        return state.when(
          initial: () =>  const Center(
            child: DefaultText.labelMedium(
              'Hallo meine Liebe, was darf ich dir heute beantworten?',
              fontFamily: 'Genttars',
              textAlign: TextAlign.center,
            ),
          ),
          loading: (transactions, isFirstFetch) => isFirstFetch
              ? const LoadingState()
              : TransactionBuilder(
            isLoading: true,
            transactions: transactions,
            scrollController: mixinScrollController,
          ),
          failure: (message, transactions) => TransactionBuilder(transactions: transactions, scrollController: mixinScrollController),
          success: (transactions) {
            return TransactionBuilder(
              transactions: transactions,
              scrollController: mixinScrollController,
            );
          },
        );
      }, listener: (BuildContext context, HistoryState state) {
      state.mapOrNull(failure: (s) {
        DefaultSnackBar.show(context: context, message: s.message);
      });
    },
    );
  }
}
