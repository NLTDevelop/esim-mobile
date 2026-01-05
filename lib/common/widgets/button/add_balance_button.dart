
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';

class AddBalanceButton extends StatelessWidget {
  const AddBalanceButton({super.key, required this.onTap});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: const Duration(milliseconds: 300),
      onPressed: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).extension<ColorExtension>()!.addBalance
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding( padding: const EdgeInsets.only(right: 8), child: Icon(Icons.account_balance_wallet, color: Theme.of(context).extension<ColorExtension>()!.background)),
            Flexible(child: DefaultText.displayMedium('Add balance',  color: Theme.of(context).extension<ColorExtension>()!.secondaryText, fontWeight: FontWeight.w500,textAlign: TextAlign.center,)),
          ],
        ),
      ),
    );
  }
}
