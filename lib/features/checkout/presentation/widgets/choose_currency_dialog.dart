import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/store/presentation/widgets/change_currency_popup_button.dart';
import 'package:flutter/material.dart';

class ChooseCurrencyDialog extends StatefulWidget {
  const ChooseCurrencyDialog({
    super.key,
    required this.onConfirm,
  });

  final void Function(String currency) onConfirm;

  static Future<void> show(
      BuildContext context, {
        required void Function(String currency) onConfirm,
      }) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => ChooseCurrencyDialog(
        onConfirm: onConfirm,
      ),
    );
  }

  @override
  State<ChooseCurrencyDialog> createState() =>
      _ChooseCurrencyDialogState();
}

class _ChooseCurrencyDialogState
    extends State<ChooseCurrencyDialog> {
  String? _selectedCurrency;

  @override
  Widget build(BuildContext context) {

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.payments_outlined,
              size: 52,
            ),

            const SizedBox(height: 20),

            const DefaultText.displayMedium(
              'Choose currency before making payments',
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 24),

            ChangeCurrencyPopupButton(
              selectedType: _selectedCurrency,
              onTap: (value) {
                setState(() {
                  _selectedCurrency = value;
                });
              },
            ),

            const SizedBox(height: 28),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _selectedCurrency == null
                    ? null
                    : () {
                  widget.onConfirm(_selectedCurrency!);

                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const DefaultText.displaySmall(
                  'Select',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}