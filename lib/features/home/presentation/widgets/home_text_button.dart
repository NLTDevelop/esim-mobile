
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_svg/flutter_svg.dart';

class HomeTextButton extends StatefulWidget {
  const HomeTextButton({
    super.key,
    required this.text,
    required this.iconPath,
    this.onPressed,
    this.isHighlight = false,
  });

  final String text;
  final String iconPath;
  final void Function()? onPressed;
  final bool isHighlight;

  @override
  State<HomeTextButton> createState() => _HomeTextButtonState();
}

class _HomeTextButtonState extends State<HomeTextButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _glowAnimation = Tween<double>(begin: 0.0, end: 30.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    if (widget.isHighlight) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(covariant HomeTextButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Start or stop animation when highlight changes
    if (widget.isHighlight && !_controller.isAnimating) {
      _controller.repeat(reverse: true);
    } else if (!widget.isHighlight && _controller.isAnimating) {
      _controller.stop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color secondaryText =
        Theme.of(context).extension<ColorExtension>()!.secondaryText;
    final Color primary = Theme.of(context).primaryColor;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return GestureDetector(
          onTap: widget.onPressed,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: widget.isHighlight
                  ? [
                BoxShadow(
                  color: primary.withAlpha(100),
                  blurRadius: _glowAnimation.value,
                  spreadRadius: _glowAnimation.value / 2,
                ),
              ]
                  : []
            ),
            child: Column(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: primary,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    widget.iconPath,
                    colorFilter:
                    ColorFilter.mode(secondaryText, BlendMode.srcIn),
                  ),
                ),
                const SizedBox(height: 12),
                DefaultText.displaySmall(
                  widget.text,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                  maxLines: 2,
                  color: secondaryText,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

