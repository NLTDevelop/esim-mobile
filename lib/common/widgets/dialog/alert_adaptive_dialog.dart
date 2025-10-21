
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:flutter/material.dart';

class AdaptiveAlertDialog extends StatelessWidget {
  const AdaptiveAlertDialog({
    super.key,
    required this.title,
    required this.content,
    this.actions,
  });

  final String title;
  final String content;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) => AlertDialog.adaptive(
    title: DefaultText.bodyLarge(title),
    content: DefaultText.titleSmall(content),
    actions: actions,
  );
}
