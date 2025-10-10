
import 'package:esim_mob_app/common/widgets/button/primary_button.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:flutter/material.dart';


class FailureState extends StatelessWidget {
  const FailureState({
    super.key,
    required this.onTap,
    this.message,
  });

  final void Function() onTap;
  final String? message;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(16.0),
    child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 60.0),
            child: DefaultText.bodyMedium(
              message ?? 'Something goes wrong',
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
              color: const Color(0xFFFFFFFF),
            ),
          ),
          PrimaryButton(
            text: 'Try again',
            onTap: onTap,
          ),
        ],
      ),
    ),
  );
}
