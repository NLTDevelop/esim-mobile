

import 'package:esim_mob_app/common/widgets/button/primary_button.dart';
import 'package:esim_mob_app/common/widgets/dialog/alert_adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AutoTopUpConfirmDialog extends StatelessWidget {
  const AutoTopUpConfirmDialog({super.key, required this.onConfirm});

  final Function() onConfirm;

  @override
  Widget build(BuildContext context) {
    return AdaptiveAlertDialog(
      title: 'Auto Top-Up',
      content: 'Do you really want to activate auto top-up for this package.',
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PrimaryButton(onTap: onConfirm, text: 'Confirm'),
            PrimaryButton(onTap: (){
              context.pop();
            }, text: 'Cancel', isActive: false,)
          ],
        )
      ],
    );
  }
}
