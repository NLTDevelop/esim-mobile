
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/history/data/model/transaction_model.dart';
import 'package:flutter/material.dart';

class TransactionRow extends StatelessWidget {
  const TransactionRow({super.key,required this.transactionModel});

  final TransactionModel transactionModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10,),
        DefaultText.displaySmall('${transactionModel.amount} ${transactionModel.currencyCode}', fontWeight: FontWeight.w600,),
        // const Spacer(),
        // DefaultText.displaySmall('${getStatusOfPayment(transactionModel.status)} ${DateFormat('d MMM yyyy HH:mm').format(transactionModel.createdAt)}', fontWeight: FontWeight.w600,),
      ],
    );
  }

  // String convertDoubleToString(double value) {
  //   String result = value.toString();
  //
  //   if (result.contains('.') && result.endsWith('0')) {
  //     result = result.replaceAll(RegExp(r'0*$'), '');
  //     if (result.endsWith('.')) {
  //       result = result.substring(0, result.length - 1);
  //     }
  //   }
  //   return result;
  // }

}
