import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/store/data/models/currency_type.dart';
import 'package:flutter/material.dart';

class ChangeCurrencyPopupButton extends StatelessWidget {
  const ChangeCurrencyPopupButton(
      {super.key, required this.onTap, required this.selectedType});

  final void Function(CurrencyType) onTap;
  final CurrencyType selectedType;

  String _currencyText() {
    switch (selectedType) {
      case CurrencyType.usd:
        return 'USD | \$';
      default:
        return 'EUR | €';
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<CurrencyType>(
      initialValue: selectedType,
      onSelected: onTap,
      itemBuilder: (BuildContext context) => <PopupMenuEntry<CurrencyType>>[
        const PopupMenuItem<CurrencyType>(
            value: CurrencyType.usd,
            child: DefaultText.displaySmall('USD | \$')),
        const PopupMenuItem<CurrencyType>(
            value: CurrencyType.euro,
            child: DefaultText.displaySmall('EUR | €')),
      ],
      child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border:
                  Border.all(color: Theme.of(context).primaryColor, width: 2)),
          child: DefaultText.displaySmall(_currencyText())),
    );
  }
}
