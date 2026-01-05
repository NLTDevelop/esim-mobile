

import 'package:esim_mob_app/common/widgets/button/primary_button.dart';
import 'package:esim_mob_app/features/add_balance/presentation/widgets/add_money_container.dart';
import 'package:esim_mob_app/features/add_balance/presentation/widgets/summary_container.dart';
import 'package:flutter/material.dart';

class AddBalanceBody extends StatelessWidget {
  const AddBalanceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            AddMoneyContainer(),
            const SizedBox(
              height: 20,
            ),
            const SummaryContainer(),
            const Spacer(),
            PrimaryButton(onTap: (){}, text: 'Proceed', isExpanded: true,),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
