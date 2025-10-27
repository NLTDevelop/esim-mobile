
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/history/data/model/transaction_model.dart';
import 'package:esim_mob_app/features/history/presentation/widgets/transaction_row.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key, required this.transactions});

  final List<TransactionModel> transactions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).extension<ColorExtension>()!.primary,
      appBar: AppBar(
        backgroundColor:  Theme.of(context).extension<ColorExtension>()!.primary,
        automaticallyImplyLeading: false,
        title: DefaultText.bodySmall('History', color: Theme.of(context).extension<ColorExtension>()!.background),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: (){
                context.pop();
              },
              child: Icon(Icons.close, size: 24, color: Theme.of(context).extension<ColorExtension>()!.background,),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + 26),
        child: Column(
          children: [
            ...transactions.map((e) => Padding(padding:const EdgeInsets.symmetric(vertical: 16, horizontal: 14), child: TransactionRow(transactionModel: e,))),
          ],
        ),
      ),
    );
  }
}
