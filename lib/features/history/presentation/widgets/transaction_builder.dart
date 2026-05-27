

import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/state/loading_state.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart' show DefaultText;
import 'package:esim_mob_app/features/history/data/model/transaction_model.dart';
import 'package:esim_mob_app/features/history/presentation/widgets/transaction_row.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class TransactionBuilder extends StatelessWidget {
  final List<TransactionModel> transactions;
  final ScrollController scrollController;
  final bool isLoading;

  const TransactionBuilder({
    super.key,
    required this.transactions,
    required this.scrollController,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      controller: scrollController,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + 26),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    decoration: BoxDecoration(
                        color: Theme.of(context).extension<ColorExtension>()!.toggleCircle,
                        borderRadius: BorderRadius.circular(6)
                    ),
                    child: DefaultText.displaySmall('Amount'.toUpperCase(), color: Theme.of(context).extension<ColorExtension>()!.secondaryText, fontWeight: FontWeight.w600, fontSize: 14,),
                  ),
                  ...transactions.map((e) => Padding(padding:const EdgeInsets.symmetric(vertical: 16, horizontal: 14), child: TransactionRow(transactionModel: e,))),
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    decoration: BoxDecoration(
                        color: Theme.of(context).extension<ColorExtension>()!.toggleCircle,
                        borderRadius: BorderRadius.circular(6)
                    ),
                    child: DefaultText.displaySmall('Status'.toUpperCase(), color: Theme.of(context).extension<ColorExtension>()!.secondaryText, fontWeight: FontWeight.w600, fontSize: 14,),
                  ),
                  ...transactions.map((e) => Padding(padding:const EdgeInsets.symmetric(vertical: 16, horizontal: 14), child: DefaultText.displaySmall(getStatusOfPayment(e.status)))),
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    decoration: BoxDecoration(
                        color: Theme.of(context).extension<ColorExtension>()!.toggleCircle,
                        borderRadius: BorderRadius.circular(6)
                    ),
                    child: DefaultText.displaySmall('Time'.toUpperCase(), color: Theme.of(context).extension<ColorExtension>()!.secondaryText, fontWeight: FontWeight.w600, fontSize: 14,),
                  ),
                  ...transactions.map((e) => Padding(padding:const EdgeInsets.symmetric(vertical: 16, horizontal: 14), child: DefaultText.displaySmall(DateFormat('dd.MM.yyyy HH:mm').format(e.createdAt)))),
                ],
              ),
            ],
          ),
          if(isLoading)
            LoadingState()
        ],
      ),
    );
  }

  String getStatusOfPayment(int status){
    switch(status){
      case 1:
        return 'Success';
      case 2:
        return 'Pending';
      case 3:
        return 'Rejected';
      default:
        return 'Failed';
    }
  }

}