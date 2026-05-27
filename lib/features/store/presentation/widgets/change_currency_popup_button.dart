import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:flutter/material.dart';

class ChangeCurrencyPopupButton extends StatelessWidget {
  const ChangeCurrencyPopupButton(
      {super.key, required this.onTap, required this.selectedType});

  final void Function(String) onTap;
  final String? selectedType;

  String _currencyText() {
    switch (selectedType) {
      case 'USD':
        return 'USD | \$';
      case 'EUR':
        return 'EUR | €';
      default:
        return 'Choose currency';
    }
  }

  @override
  Widget build(BuildContext context) {

    return PopupMenuButton<String>(
      initialValue: selectedType,
      onSelected: onTap,
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
            value: 'USD',
            child:  DefaultText.displaySmall('USD | \$')),
        const PopupMenuItem<String>(
            value: 'EUR',
            child:  DefaultText.displaySmall('EUR | €')),
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
