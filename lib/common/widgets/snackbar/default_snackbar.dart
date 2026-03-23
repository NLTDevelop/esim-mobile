import 'dart:async';
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:flutter/material.dart';


enum SnackAlignment { top, bottom }

class DefaultSnackBar {
  static OverlayEntry? _overlayEntry;
  static Timer? _timer;
  static late AnimationController _animationController;
  static late Animation<Offset> _offsetAnimation;

  static OverlayEntry _createOverlayEntry({
    final String? title,
    final String? message,
    required final SnackAlignment alignment,
    required final BuildContext context,
    final String type = 'error'
  }) =>
      OverlayEntry(
        builder: (context) => AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) => SlideTransition(
            position: _offsetAnimation,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: alignment == SnackAlignment.top ? kToolbarHeight * 1.5 : null,
                  bottom: alignment == SnackAlignment.bottom ? kToolbarHeight : null,
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        color: type == 'error' ? Colors.redAccent : Theme.of(context).extension<ColorExtension>()!.primary,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ClipRRect(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: DefaultText.labelLarge(
                                          title ?? 'Error',
                                          fontWeight: FontWeight.w600,
                                          color: Theme.of(context).extension<ColorExtension>()?.secondaryText,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      DefaultText.displaySmall(
                                        message ?? 'An error occurred. Please try again.',
                                        color: Theme.of(context).extension<ColorExtension>()?.secondaryText,
                                        textAlign: TextAlign.center,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                ),
                                // Uncomment the following lines if you want to add a close button
                                // GestureDetector(
                                //   onTap: _fadeOutAndRemove,
                                //   child: Icon(Icons.close, color: Theme.of(context).colorScheme.onBackground),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  static void show({
    required final BuildContext context,
    final String? title,
    final String? message,
    final SnackAlignment alignment = SnackAlignment.top,
    final Duration animationDuration = const Duration(milliseconds: 500),
    final Duration displayDuration = const Duration(seconds: 2),
    final String type = 'error'
  }) {
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _timer?.cancel();
    }

    _animationController = AnimationController(
      vsync: ScaffoldMessenger.of(context),
      duration: animationDuration,
    );

    _offsetAnimation = Tween<Offset>(
      begin: alignment == SnackAlignment.top ? const Offset(0, -1) : const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _overlayEntry = _createOverlayEntry(title: title, message: message, alignment: alignment, context: context, type: type);
    _insertOverlay(context);

    _animationController.forward();

    _timer = Timer(displayDuration, () {
      if (_overlayEntry != null) {
        _fadeOutAndRemove();
      }
    });
  }

  static _insertOverlay(BuildContext context) async {
    Overlay.of(context).insert(_overlayEntry!);
  }

  static _fadeOutAndRemove() {
    if (_overlayEntry != null) {
      _animationController.reverse();
      Future.delayed(_animationController.duration!, () {
        _overlayEntry?.remove();
        _overlayEntry = null;
        _timer?.cancel();
      });
    }
  }
}
