
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/circular_progress_indicator/default_circular_progress_indicator.dart';
import 'package:flutter/material.dart';


class AdaptiveDialogButton extends StatelessWidget {
  const AdaptiveDialogButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.isLoading = false,
  });

  final VoidCallback onPressed;
  final String title;
  final bool isLoading;

  @override
  Widget build(BuildContext context) => TextButton(
    onPressed: onPressed,
    child: isLoading
        ? const SizedBox.square(dimension: 20.0, child: DefaultCircularProgressIndicator())
        : Text(
      title,
      style: TextStyle(
        color: Theme.of(context).extension<ColorExtension>()?.textDialogButton,
      ),
    ),
  );
}
