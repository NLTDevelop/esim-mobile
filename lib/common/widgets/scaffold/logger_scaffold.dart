
import 'package:esim_mob_app/common/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoggerScaffold extends StatefulWidget {
  const LoggerScaffold({
    super.key,
    this.appBar,
    this.body,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomInset,
    this.floatingActionButton,
    this.extendBodyBehindAppBar = false,
  });

  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;
  final Widget? floatingActionButton;
  final bool extendBodyBehindAppBar;

  @override
  State<LoggerScaffold> createState() => _LoggerScaffoldState();
}

class _LoggerScaffoldState extends State<LoggerScaffold> {
  Offset _loggerPosition = const Offset(20, 20);
  final bool isShowLogger = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      appBar: widget.appBar,
      backgroundColor: widget.backgroundColor,
      bottomNavigationBar: widget.bottomNavigationBar,
      extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
      floatingActionButton: widget.floatingActionButton,
      body: Stack(
        children: [
          if (widget.body != null) widget.body!,
          if (isShowLogger)
            Positioned(
              left: _loggerPosition.dx,
              top: _loggerPosition.dy,
              child: DraggableFloatingButton(
                onPressed: () => context.push(Routes.logger),
                onPositionChanged: (newOffset) {
                  setState(() => _loggerPosition = newOffset);
                },
              ),
            ),
        ],
      ),
    );
  }
}

class DraggableFloatingButton extends StatefulWidget {
  const DraggableFloatingButton({
    super.key,
    required this.onPressed,
    required this.onPositionChanged,
  });

  final VoidCallback onPressed;
  final ValueChanged<Offset> onPositionChanged;

  @override
  State<DraggableFloatingButton> createState() => _DraggableFloatingButtonState();
}

class _DraggableFloatingButtonState extends State<DraggableFloatingButton> {
  Offset _dragOffset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        _dragOffset += details.delta;
        widget.onPositionChanged(_dragOffset);
      },
      child: SafeArea(
        child: IconButton.filledTonal(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.grey.withAlpha(70)),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          onPressed: widget.onPressed,
          icon: const Icon(Icons.monitor_heart_outlined),
        ),
      ),
    );
  }
}


