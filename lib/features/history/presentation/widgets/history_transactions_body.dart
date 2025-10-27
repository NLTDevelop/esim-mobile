
import 'package:esim_mob_app/common/routes/routes.dart';
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/history/data/model/transaction_model.dart';
import 'package:esim_mob_app/features/history/presentation/widgets/transaction_row.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HistoryTransactionsBody extends StatelessWidget {
  const HistoryTransactionsBody({super.key, required this.transactions});

  final List<TransactionModel> transactions;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            DefaultText.bodySmall('History', color: Theme.of(context).extension<ColorExtension>()!.background,),
            const Spacer(),
            GestureDetector(
              onTap: (){
                context.push(Routes.history, extra: {'transactions': transactions});
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).extension<ColorExtension>()!.cardBorder
                ),
                child: Row(
                  children: [
                    const DefaultText.labelMedium('All'),
                    const SizedBox(width: 4,),
                    Icon(Icons.arrow_forward_ios, size: 16, color: Theme.of(context).extension<ColorExtension>()!.text,)
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16,),
        ...transactions.map((e) => Padding(padding: const EdgeInsets.only(bottom: 20), child: TransactionRow(transactionModel: e)))
      ],
    );
  }
}
