
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/history/data/model/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionRow extends StatelessWidget {
  const TransactionRow({super.key,required this.transactionModel});

  final TransactionModel transactionModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: SvgPicture.asset(transactionModel.tariff.eSim.iconPath),
        ),
        const SizedBox(width: 10,),
        DefaultText.displaySmall('${transactionModel.tariff.eSim.name}  ${transactionModel.tariff.eSim.dataInGB} GB', color: Theme.of(context).extension<ColorExtension>()!.background, fontWeight: FontWeight.w600,),
        const Spacer(),
        DefaultText.displaySmall('-${transactionModel.tariff.price.toStringAsFixed(2)} ${transactionModel.tariff.currency}', color: Theme.of(context).extension<ColorExtension>()!.background, fontWeight: FontWeight.w600,),
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
